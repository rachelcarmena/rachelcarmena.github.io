---
layout: post
asset-type: post
title: Before learning SOLID principles
description: An alternative list before learning the list of titles and statements
date: 2019-04-04 09:00:00 +00:00
image:
    src: /img/cards/posts/before-learning-solid-principles/cover.jpg
---

## Motivation

I've met a lot of people who are trying to learn SOLID principles and are struggling to remember: letter + title + statement.

I hope this post is useful to understand what they mean and why they are important.

## An alternative list

SOLID principles are a set of design principles for object-oriented programming, although some of them could be good practices for other programming paradigms. 

This is an alternative list:

* **Don't mix unrelated responsibilities.** I'm not particularly a fan of the definition of a responsibility as "one reason to change", because I realized that it leads to confusion or it can be misinterpreted: _Should a class have only one method?_. Or if we are playing with [CRC cards](http://www.extremeprogramming.org/rules/crccards.html), we are talking about responsibilities for each class and even a general responsibility for each class could be enunciated. So I prefer pointing out "don't mix unrelated responsibilities", "this class/method is doing too much", "look for high cohesion", ...

* **When adding new features, avoid doing a lot of changes in the existing code.** It will be a signal that the source code is well-organized.

* **Think twice before designing with inheritance.** Instead of an object, could you pass another one from a corresponding superclass without causing errors? Look for signals: Is inherited behaviour from a superclass being overriden?

* **When using an interface, don't make me implement methods that don't make sense.** Look for signals: Do you find a name for the interface? Is it easy to find it? Are unrelated responsibilities being mixed?

* **Look for flexibility with abstractions**, rather than concretions. Is there code depending upon specific implementation details? How easy is it to change a type?

## Other principles with acronyms

There are other principles with acronyms like POLA, my favorite one:

* [POLA = Principle Of Least Astonishment](http://wiki.c2.com/?PrincipleOfLeastAstonishment)

When reading a class name, the content must match with that name and don't include other responsibilities.

When reading a method name, the content must match with that name.

When clicking a button, the action must match with the context and its name.

In general, don't surprise with things that aren't expected.

Other principles:

* [KISS = Keep It Small and Simple](http://wiki.c2.com/?KeepItSimple)
* [DRY = Don't Repeat Yourself](http://wiki.c2.com/?DontRepeatYourself): be careful with it, [duplication, you're welcome](/2018/02/27/duplication-you-are-welcome.html)
* [YAGNI = You Aren't Gonna Need It](http://wiki.c2.com/?YouArentGonnaNeedIt)
* [SoC = Separation of Concerns](http://wiki.c2.com/?SeparationOfConcerns)
* [LoD = Law of Demeter = Only talk to your immediate friends](http://wiki.c2.com/?LawOfDemeter). It's related to the [Information Hiding Principle](https://wiki.c2.com/?InformationHiding).
* [CQS = Command-Query Separation](http://wiki.c2.com/?CommandQuerySeparation). An architecture pattern based on CQS: [CQRS = Command-Query Responsibility Segregation](https://kalele.io/really-simple-cqrs/).

## Friendly reminder

Please, don't shame a person who doesn't remember the statement of a letter from SOLID principles. I think that following these principles when programming is more important than remembering the letter + title + statement from each of them.

## Received feedback

[Ricardo Borillo](https://twitter.com/borillo), a good friend and the first project manager I had in my professional experience, likes to explain the anti-patterns when SOLID principles are missing: singleton invasion, tight coupling, untestability, premature optimization, indescriptive naming and duplication. They form the acronym STUPID and are detailed in this article: [From STUPID to SOLID code!](https://williamdurand.fr/2013/07/30/from-stupid-to-solid-code/).
