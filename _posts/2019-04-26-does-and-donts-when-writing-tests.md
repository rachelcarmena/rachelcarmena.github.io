---
layout: post
asset-type: post
title: DO's and DON'Ts when writing tests
description: Some tips
date: 2019-04-26 10:00:00 +00:00
image:
    src: /img/cards/posts/dos-and-donts-when-writing-tests/cover.jpg
---

## Introduction

This post includes some small tips from my experience when writing tests. I'll update it as soon as I have more things to share about it.

## Some tips

### Don't mix production code and test code

A long time ago, I reviewed a module which was responsible of receiving messages and doing some actions from them.

However, I found production code both to send messages and to receive them. Why? Because it was used by a test.

It was very confusing for me: production code was communicating a wrong responsibility. In that case, source code to send messages was part of test code rather than production code.

Another case: adding objects comparison capabilities in production code which are only used by assertions. This is called [Equality Pollution](http://xunitpatterns.com/Test%20Logic%20in%20Production.html). Check testing frameworks because they include options to avoid this issue.

So, don't add extra code in production code if it's only used by tests.

### Decouple production code from test code

There are software development teams following this rule: one test class per production class (or one test file per production file or something similar depending on the programming language). And I've seen these effects:

* Writing tests is a boring task.
* People don't write tests because of being convinced about the advantages.
* Writing tests seems a waste of time.
* Every single change breaks several tests.
* Refactoring production code is a pain because of a huge amount of coupled tests.
* Tests are focused on **implementation**: they are not a good documentation.
* There are a lot of tests that don't provide any value or don't make sense.
* Sooner or later, tests are skipped.

Test code and production code have different purposes, so they must "live" independently.

Test code should be focused on **behaviours**, **intentions** or **capabilities**:

* Refactoring production code will be possible and test code will remain unchanged.
* Refactoring test code will be possible without having to change production code.
* Tests will be a good documentation.
* Writing tests will be a meaningful task.
* People will understand the advantages of starting with tests.
* Tests will be kept updated.
* Tests will be valuable and appreciated.

### Listen to test code

Just as it's useful to listen to production code, it's also useful to listen to test code.

When it's said [listen to the code](http://wiki.c2.com/?ListenToTheCode), it's related to all the source code.

If we are facing difficulties when writing a test, it's a signal that should be analysed carefully to know the root causes and to fix them.

### Think twice before removing duplicated test code

A long time ago, I was reviewing a test class with 4 extracted parameterized methods (for 4 different types of expectations) and 6 extracted methods (for 6 different JSON files). I sat with the author of that class and we applied inline method refactoring (in other words, replacing method calls by the corresponding source code). After that, we realized that the test class was more readable and understandable without those 10 additional methods, despite having duplicated source code.

As it's said in [Fifty quick ideas to improve your tests](https://fiftyquickideas.com/fifty-quick-ideas-to-improve-your-tests/) by Gojko Adzic, David Evans and Tom Roden:

> It's far better to optimise tests for reading than for writing (...) if you need to compromise either ease of maintenance or readability, keep readability.

### Consider test code as important as production code

All the source code should be cared or reviewed when refactoring, not only production code.

Test code is part of the documentation of your project.

### Communicate through proper test names

I find it easier to write proper test names when following this piece of advice by [Sandro Mancuso](https://twitter.com/sandromancuso): invert the order of writing [test parts](http://wiki.c2.com/?ArrangeActAssert) when starting with the assertion. 

In this way, you'll see the test name very near the assertion and you'll be able to check if it makes sense and it's communicating the same thing.

Furthermore, time is not wasted arranging test data, acting and then realizing that the test makes no sense when writing the assertion. 

On the other hand, it forces yourself to focus on checking a single thing. As it's said in [Fifty quick ideas to improve your tests](https://fiftyquickideas.com/fifty-quick-ideas-to-improve-your-tests/) by Gojko Adzic, David Evans and Tom Roden:

> Write assertions first. (...) Tests that are written bottom up, by doing the outputs first, tend to be shorter and more directly explain the purpose.

They also include an interesting recommendation about test names:

> Avoid using conjunctions (and, or, not) in test names. Conjunctions are a sign the test is trying to do too much, or lacks focus.

### Consider the possibility of extending the testing framework

If the testing framework doesn't include a matcher which would be interesting for you, consider the possibility of creating a custom matcher to fit your testing needs.

For example, I created a [custom Hamcrest Matcher for Golden Master Refactoring](https://github.com/rachelcarmena/legacyutils/blob/custom-hamcrest-matcher/src/test/java/com/gmaur/legacycode/legacyutils/output/StringIsEqualsAsPreviousInMatcher.java), although now I'd recommend the use of [ApprovalTests](https://github.com/approvals) to get the same thing ;)

### Don't check only a few properties when comparing objects

I've seen problems because of comparing only 1 or 2 properties from objects with more properties.

Testing frameworks include specific assertions to facilitate this kind of comparisons: field by field comparison, deep equality, etc.

So, check that objects are fully compared.

### Expected vs. actual

I remember that day in which I spent more than fifteen minutes to understand an error raised by the testing framework. 

Finally, I realized that the expected and actual results were swapped in the assertion, so the message doesn't make sense.

Some testing frameworks have been improved to avoid these mistakes, but take care of it.

## Recommended resources

* [XUnit Test Patterns](http://xunitpatterns.com)
* [Growing Object-Oriented Software Guided by Tests](http://www.growing-object-oriented-software.com) by Steve Freeman and Nat Pryce
* [Fifty quick ideas to improve your tests](https://fiftyquickideas.com/fifty-quick-ideas-to-improve-your-tests/) by Gojko Adzic, David Evans and Tom Roden
