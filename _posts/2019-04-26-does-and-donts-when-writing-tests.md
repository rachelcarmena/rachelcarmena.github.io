---
layout: post
asset-type: post
title: DO's and DON'Ts when writing tests
description: Some tips
date: 2019-04-26 10:00:00 +00:00
last_modified_at: 2021-08-11 10:00:00 +00:00
image:
    src: /img/cards/posts/dos-and-donts-when-writing-tests/cover.jpg
---

This post includes some small tips from my experience when writing tests. I'll update it as soon as I have more things to share about it.

## Don't mix production code and test code

A long time ago, I reviewed a module which was responsible for receiving messages and doing some actions afterwards.

However, I found production code both to send messages and to receive them. Why? Because it was used for a test.

It was very confusing for me: production code was communicating a wrong responsibility. In that case, source code to send messages was part of test code rather than production code.

Another case: adding objects comparison capabilities in production code which are only used by assertions. This is called [Equality Pollution](http://xunitpatterns.com/Test%20Logic%20in%20Production.html). Check testing frameworks because they include options to avoid this issue.

So, don't add extra code in production code if it's only used by tests.

## Decouple production code from test code

There are software development teams following this rule: one test class per production class (or one test file per production file or something similar depending on the programming language). And I've seen these effects:

* Writing tests is a boring task.
* People don't write tests because of being convinced about the advantages.
* Writing tests seems like a waste of time.
* Every single change breaks several tests.
* Refactoring production code is a pain because of a huge amount of coupled tests.
* Tests are focused on **implementation**: they are not good documentation.
* There are a lot of tests that don't provide any value or don't make sense.
* Sooner or later, tests are skipped.

Test code and production code have different purposes, so they must "live" independently.

Test code should be focused on **behaviours**, **intentions** or **capabilities**:

* Changes in production code won't imply changes in test code and vice versa.
* Refactoring will be possible.
* Tests will be good documentation.
* Writing tests will be a meaningful task.
* People will understand the advantages of starting with tests.
* Tests will be kept updated.
* Tests will be valuable and appreciated.

As [Kent C. Dodds](https://twitter.com/kentcdodds) says:

> The more your tests resemble **the way your software is used**, the more confidence they can give you.

## Listen to test code

Just as it's useful to listen to production code, it's also useful to listen to test code.

When it's said [listen to the code](http://wiki.c2.com/?ListenToTheCode), it's related to all the source code.

If we are facing difficulties when writing a test, it's a signal that should be analysed carefully to know the root causes and to fix them.

Another case (or smell): too much logic or implementation details in tests. What's being tested? How can the test be broken?

## Think twice before removing duplicated test code

A long time ago, I was reviewing a test class with 4 extracted parameterized methods (for 4 different types of expectations) and 6 extracted methods (for 6 different JSON files). I sat with the author of that class and we applied inline method refactoring (in other words, replacing method calls by the corresponding source code). After that, we realized that the test class was more readable and understandable without those 10 additional methods, despite having duplicated source code.

As it's said in [Fifty quick ideas to improve your tests](https://fiftyquickideas.com/fifty-quick-ideas-to-improve-your-tests/) by Gojko Adzic, David Evans and Tom Roden:

> It's far better to optimise tests for reading than for writing (...) if you need to compromise either ease of maintenance or readability, keep readability.

## Consider test code as important as production code

All the source code should be cared or reviewed when refactoring, not only production code.

Test code is part of the documentation of your project.

## Communicate through proper test names

I find it easier to write proper test names when following this piece of advice by [Sandro Mancuso](https://twitter.com/sandromancuso): invert the order of writing [test parts](http://wiki.c2.com/?ArrangeActAssert) when starting with the assertion. 

In this way, you'll see the test name very near the assertion and you'll be able to check if it makes sense and it's communicating the same thing.

Furthermore, time is not wasted arranging test data, acting and then realizing that the test makes no sense when writing the assertion. 

On the other hand, it forces you to focus on checking a single thing. As it's said in [Fifty quick ideas to improve your tests](https://fiftyquickideas.com/fifty-quick-ideas-to-improve-your-tests/) by Gojko Adzic, David Evans and Tom Roden:

> Write assertions first. (...) Tests that are written bottom up, by doing the outputs first, tend to be shorter and more directly explain the purpose.

They also include an interesting recommendation about test names:

> Avoid using conjunctions (and, or, not) in test names. Conjunctions are a sign the test is trying to do too much, or lacks focus.

## Consider the possibility of extending the testing framework

If the testing framework doesn't include a matcher which would be interesting for you, consider the possibility of creating a custom matcher to fit your testing needs.

For example, I created a [custom Hamcrest Matcher for Golden Master Refactoring](https://github.com/rachelcarmena/legacyutils/blob/custom-hamcrest-matcher/src/test/java/com/gmaur/legacycode/legacyutils/output/StringIsEqualsAsPreviousInMatcher.java), although now I'd recommend the use of [ApprovalTests](https://github.com/approvals) to get the same thing ;)

## Don't check only a few properties when comparing objects

I've seen problems because of comparing only 1 or 2 properties from objects with more properties.

Testing frameworks include specific assertions to facilitate this kind of comparisons: field by field comparison, deep equality, etc.

So, check that objects are fully compared.

## Check the failure messages

I remember that day in which I spent more than fifteen minutes trying to understand an error raised by the testing framework. Finally, I realized that the expected and actual results were swapped in the assertion, so the message didn't make sense.

Although some testing frameworks have been improved to avoid these mistakes, take care of it.

Check that the tests will raise an understable message if they fail: what's failing, the expected output and the actual output.

## Choose good and meaningful inputs for the tests

The inputs of the tests are not only important to check possible edge cases but also to show the tested behaviour.

Sometimes it's possible to describe the properties of the behaviour under test: [property-based testing](https://fsharpforfunandprofit.com/pbt).

On the other hand, if some input data isn't relevant for a test, it can be named like `any...`.

## Check that the test fails under the wrong circumstances

My cousin [Francisco Moreno](https://twitter.com/morvader) usually says:

> Don't trust a test if you didn't see it fail.

How could we make a passing test fail?

* Changing the input or the expected output.
* Changing the related production code (similar to mutation testing).

Failing tests during the red phase of TDD might not be included in that list: it's about making a passing test fail.

More details about my cousin's advice (in Spanish):

<blockquote class="twitter-tweet"><p lang="es" dir="ltr">A mí, la técnica que mejor me funciona es seguir estos pasos:<br>1- Escribe un test que funcione<br>2- Cambia el aserto y aseguráte de que falla<br>3- Déjalo como estaba <a href="https://t.co/EWhRCailiy">pic.twitter.com/EWhRCailiy</a></p>&mdash; Francisco Moreno (@morvader) <a href="https://twitter.com/morvader/status/1268600288157544450?ref_src=twsrc%5Etfw">June 4, 2020</a></blockquote>

## Don't mix behaviours in the same test

Every test should have just one reason to fail.

## Be careful with the false sense of security

As Dijkstra said in [The Humble Programmer](https://www.cs.utexas.edu/~EWD/transcriptions/EWD03xx/EWD340.html):

> (...) program testing can be a very effective way to show the presence of bugs, but is hopelessly inadequate for showing their absence.

On the other hand, a high value of code coverage isn't a guarantee of the testing quality. I talked about it in [99% code coverage - Do we have a good safety net to change this legacy code?](/2017/09/01/do-we-have-a-good-safety-net-to-change-this-legacy-code.html).

## Friendly reminder

As **Dani Latorre** says (in English below):

<blockquote class="twitter-tweet" data-lang="en"><p lang="es" dir="ltr">Los tests son parte de la documentación. Así que escribir tests para una base de código existente debería tomarse como una oportunidad inmejorable para documentar su funcionamiento, no ser mera cobertura </p>&mdash; Dani Latorre (@dani_latorre) <a href="https://twitter.com/dani_latorre/status/1121412874088386562?ref_src=twsrc%5Etfw">April 25, 2019</a></blockquote>

<blockquote class="twitter-tweet" data-lang="en"><p lang="es" dir="ltr">Que se entiendan, copón</p>&mdash; Dani Latorre (@dani_latorre) <a href="https://twitter.com/dani_latorre/status/1121413066166394880?ref_src=twsrc%5Etfw">April 25, 2019</a></blockquote>

In (my) English:

> Tests are part of the documentation. So, writing tests for existing code should be an amazing opportunity to document the behaviour, not only coverage.

> Please, we need that they are understood!

## Update

### About decoupling production code from test code

This is the abstract of the talk **Are your tests really driving your development?** by [Nat Pryce](https://twitter.com/natpryce) and [Steve Freeman](https://twitter.com/sf105) during XPDay London 2006. It has been preserved thanks to [Kevlin Henney](https://twitter.com/KevlinHenney), because he included it in some [article](https://www.theregister.co.uk/2007/03/09/test_driven_development/) or [talk](https://www.youtube.com/watch?v=ZsHMHukIlJY):

> Everybody knows that TDD stands for Test Driven Development. However, people too often concentrate on the words "Test" and "Development" and don't consider what the word "Driven" really implies. For tests to drive development they must do more than just test that code performs its required functionality: **they must clearly express that required functionality to the reader**. That is, they must be clear specifications of the required functionality. Tests that are not written with their role as specifications in mind can be very confusing to read.

On the other hand, in 2009, [Michael Feathers](https://twitter.com/mfeathers) and [Steve Freeman](https://twitter.com/sf105) gave a talk about [Ten years of Test-Driven Development](http://gotocon.com/dl/micro-agile-cph-mar-2009/slides/SteveFreeman_TDDTenYearsLater.pdf) where they remembered these thoughts by [Kent Beck](https://twitter.com/KentBeck):

> It said the way to program is to look at the input tape and manually type in the output tape you expect. Then you program until the actual and expected tapes match.

> I thought, what a stupid idea. I want tests that pass, not tests that fail. Why would I write a test when I was sure it would fail. Well, I'm in the habit of trying stupid things out just to see what happens, so I tried it and it worked great.

> I was finally able to separate logical from physical design. I'd always been told to do that but no one ever explained how.

and they gave this piece of advice, among others:

> **Separate what from how**

## Recommended resources

* [Turing lecture: The Humble Programmer](https://www.cs.utexas.edu/~EWD/transcriptions/EWD03xx/EWD340.html)
* [Post: Duplication, you're welcome](/2018/02/27/duplication-you-are-welcome.html), where I explained the experience included in the section **Think twice before removing duplicated test code**.
* [Post: 99% code coverage - Do we have a good safety net to change this legacy code?](/2017/09/01/do-we-have-a-good-safety-net-to-change-this-legacy-code.html)
* [Book: XUnit Test Patterns](http://xunitpatterns.com)
* [Book: Growing Object-Oriented Software Guided by Tests](http://www.growing-object-oriented-software.com) by **Steve Freeman** and **Nat Pryce**
* [Book: Fifty quick ideas to improve your tests](https://fiftyquickideas.com/fifty-quick-ideas-to-improve-your-tests/) by **Gojko Adzic**, **David Evans** and **Tom Roden**
* An example about tests in less than 2 minutes (from 11:20 to 13:05): [Why everyone should care about TDD?](https://www.youtube.com/watch?v=04x0stqD9f0) by **Steve Freeman**
* [Talk: Unit Tests as Specifications - Effective Ways to Think About TDD](https://www.youtube.com/watch?v=3oIe8JPloaw) by **David Bernstein**, a talk with a very good content, reflections and tips for tests, although it appears an example about testing a constructor and I think that example is coupled to the implementation rather than a specification or a behaviour.

