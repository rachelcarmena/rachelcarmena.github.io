---
layout: post
asset-type: post
title: Before learning SOLID principles
description: An alternative list before learning the list of titles and statements
date: 2019-04-04 09:00:00 +00:00
last_modified_at: 2019-06-10 12:00:00 +00:00
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
* [CQS = Command-Query Separation](http://wiki.c2.com/?CommandQuerySeparation). An architecture pattern based on CQS: [CQRS = Command-Query Responsibility Segregation](https://kalele.io/really-simple-cqrs/).

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Frameworks and APIs change fast. Software design principles are evergreen. Learn principles that translate across language barriers.</p>&mdash; Eric Elliott (@_ericelliott) <a href="https://twitter.com/_ericelliott/status/1073701678816333824?ref_src=twsrc%5Etfw">December 14, 2018</a></blockquote>

## Friendly reminder

I prefer having a colleague who follows SOLID principles, rather than a colleague who remembers the list with every title and statement and doesn't implement them. Please, don't shame a person when not remembering the statement of a letter from SOLID principles.

## Received feedback

[Ricardo Borillo](https://twitter.com/borillo), a good friend and the first project manager I had in my professional experience, likes to explain the anti-patterns when not following these principles: singleton invasion, tight coupling, untestability, premature optimization, indescriptive naming and duplication. They form the acronym STUPID and are detailed in this article: [From STUPID to SOLID code!](https://williamdurand.fr/2013/07/30/from-stupid-to-solid-code/).

## Related tweet

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Small reminder: <a href="https://twitter.com/hashtag/SOLID?src=hash&amp;ref_src=twsrc%5Etfw">#SOLID</a> principles are applicable to anything that is code.<br>Also:<br>- tests<br>- infrastructure-as-code<br>- pipeline-as-code<br>- builds</p>&mdash; Thierry de Pauw (@tdpauw) <a href="https://twitter.com/tdpauw/status/1120938604631613441?ref_src=twsrc%5Etfw">April 24, 2019</a></blockquote>

## Other resource

* [Why Every Element of SOLID is Wrong](https://speakerdeck.com/tastapod/why-every-element-of-solid-is-wrong) by [Daniel Terhorst-North](https://twitter.com/tastapod).

## Update

From [Pragmatic thinking and learning. Refactor your wetware](https://pragprog.com/book/ahptl/pragmatic-thinking-and-learning) by [Andy Hunt](https://twitter.com/PragmaticAndy):

> Don’t be in such a hurry. When problem solving, learn to be comfortable with uncertainty. When creating, be comfortable with the absurd and the impractical. When learning, **don’t try so hard to learn and memorize**; just get “used to it” first. Try to understand the meaning first; get the overall gist of it.

> (...) simply mastering a syllabus of knowledge doesn’t increase professional effectiveness. It’s useful, certainly, but by itself it doesn’t contribute all that much to what you do in the actual, daily practice of your craft.

> The model you build in your mind, the questions you ask to build that model, and your experiences and practices built up along the way and that you use daily are far more relevant to your performance. They’re the things that develop competence and expertise. Mastery of the knowledge alone isn’t sufficient.
