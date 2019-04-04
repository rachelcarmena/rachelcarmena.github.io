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

It's not the first time that I meet a person who is trying to learn SOLID principles and that person is struggling to remember: letter + title + statement.

I hope this post is useful to understand what they mean and why they are important and then, you can learn the SOLID principles with their titles and statements.

## An alternative list

SOLID principles are a set of design principles for object-oriented programming, although some of them could be good practices for other programming paradigms. 

This is my alternative list.

**Don't mix unrelated responsibilities.** I'm not particularly fan of the definition of a responsibility as "one reason to change", because I realized that it leads to confusion or it can be misinterpreted: _Should a class have only one method?_. Or if we are playing with [CRC cards](http://www.extremeprogramming.org/rules/crccards.html), we are talking about responsibilities for each class and we could also enunciate a general responsibility for each of them. So I prefer indicating "don't mix unrelated responsibilities", "this class/method is doing too much", "responsibilities hide implementation details", "look for high cohesion", ...

**When adding new features, try to add new source code without doing a lot of changes in the existing code.** It will be a signal that the source code is well-organized. If you can't do it, try to refactor it to follow this purpose.

**Think twice before designing with inheritance.** Instead of an object, could you pass another one from a corresponding superclass without causing errors? Look for signals: Are you overriding behaviour that is inherited from a superclass?

**When using an interface, don't make me implement methods that don't make sense.** Look for signals: Do you find a name for the interface? Is it easy to find it? Are you mixing unrelated responsibilitities?

**Look for flexibility with parameters like interfaces or abstract classes**, rather than concrete classes.

Do you follow them when programming? That's the most important thing.

## Other principles

My favourite one?

* [POLA = Principle Of Least Astonishment](http://wiki.c2.com/?PrincipleOfLeastAstonishment)

Don't astonish me. 

If I read a class name, the content must match with that name and don't include other responsibilities.

If I read a method name, the content must match with that name.

If I push a button, the result must match with the context and its name.

In general, don't surprise with things that aren't expected.

Other principles:

* [KISS = Keep It Small and Simple](http://wiki.c2.com/?KeepItSimple)
* [DRY = Don't Repeat Yourself](http://wiki.c2.com/?DontRepeatYourself): be careful with it, [duplication, you're welcome](/2018/02/27/duplication-you-are-welcome.html)
* [YAGNI = You Aren't Gonna Need It](http://wiki.c2.com/?YouArentGonnaNeedIt)
* [SoC = Separation of Concerns](http://wiki.c2.com/?SeparationOfConcerns)
* [LoD = Law of Demeter = Only talk to your immediate friends](http://wiki.c2.com/?LawOfDemeter)
* [CQS = Command Query Separation](http://wiki.c2.com/?CommandQuerySeparation)

## Friendly reminder

I prefer having a colleague that follows SOLID principles, rather than a colleague that remembers the list with every title and statement and don't implement them. Please, don't shame a person when not remembering the statement of a letter from SOLID principles.
