---
layout: post
asset-type: post
title: Refactoring
description: What do we need to refactor? Reviewing a refactoring kata
date: 2019-04-13 12:00:00 +00:00
updated: 2019-04-15 22:00:00 +00:00
image:
    src: /img/cards/posts/refactoring/cover.jpg
---

## Motivation

The motivation of this post is reviewing a screencast about a refactoring kata that I recorded a year ago and indicating better refactorings.

I don't have a favorite programming language. I chose Java because it was used by the client I was working for. However, I think it can be understood by any developer.

## Introduction

If I reflect about the projects I've participated so far, the number of **legacy code** projects is greater than those created from scratch (also known as greenfield projects).

The term of **legacy code** doesn't have a negative meaning for me but challenging: a project that I didn't start from the beginning and it was built during a period of time in which several circumstances happened and I wasn't there.

Let's see **Michael C. Feathers**' view. He heard the term of **legacy code** from a friend of his, Erik Meade, when starting to work with a new team:

> How are they doing?

> They’re writing legacy code, man.

What's **legacy code**?

> Legacy code is code that we’ve gotten from someone else. (...) tangled, unintelligible structure, code that you have to change but don’t really understand.

That was the first idea, but Michael changed his mind:

> Legacy code is simply code without tests.

Why?

> Code without tests is bad code. It doesn’t matter how well written it is; it doesn’t matter how pretty or object-oriented or well-encapsulated it is. With tests, we can change the behavior of our code quickly and verifiably. Without them, we really don’t know if our code is getting better or worse.

In this case, Michael talked about changing the behavior, maybe when thinking about adding a new feature, making an adjustment or fixing an error.

However, there is another type of changes that do keep the behavior: **refactorings**.

As **Martin Fowler** says:

> Refactoring: a change made to the internal structure of software to make it easier to understand and cheaper to modify without changing its existing behavior.

## What do we need to refactor?

I'd mention three things: what to pursue, what to move away from and knowing how to refactor.

1. Things to pursue:
* [**4 Rules of Simple Design**](http://wiki.c2.com/?XpSimplicityRules)
* [**Design principles**](/2019/04/04/before-learning-solid-principles.html)
* [**High cohesion and low coupling**](http://wiki.c2.com/?CouplingAndCohesion)
* [**Clean code**](http://wiki.c2.com/?CleanCode)
* [**Clean architecture**](http://wiki.c2.com/?HexagonalArchitecture)
* [**Testability**](http://wiki.c2.com/?DesignForTestability)
2. Things to move away from:
* [**Code smells**](http://wiki.c2.com/?CodeSmell) like [primitive obsession](http://wiki.c2.com/?PrimitiveObsession), [data clumps](http://wiki.c2.com/?DataClumps), ... 
* [**Code deodorants**](http://wiki.c2.com/?CodeDeodorant)
* **Other signals**. Not everything is written or catalogued and it's necessary to detect the signals. I usually say: _This code is asking us for a change_. So, [**listen to the code**](http://wiki.c2.com/?ListenToTheCode).
3. Knowing how to refactor:
* **Knowing if we have a safety net of tests**. Do they follow F.I.R.S.T principles? Fast, Isolated, Repeatable, Self-validating, Timely. [Do we have a good safety net to change this legacy code?](/2017/09/01/do-we-have-a-good-safety-net-to-change-this-legacy-code.html)
* **Knowing how to create that safety net if it doesn't exist** (see below)
* **Refactorings** like [remove dead code](https://refactoring.com/catalog/removeDeadCode.html), [extract method](https://refactoring.com/catalog/extractFunction.html), [inline method](https://refactoring.com/catalog/inlineFunction.html), [replace nested conditional with guard clauses](https://refactoring.com/catalog/replaceNestedConditionalWithGuardClauses.html), ...
* **Knowing the refactoring options provided by the IDE**. For example, take a look at this [list of refactorings in Intellij IDEA](https://www.jetbrains.com/help/idea/refactoring-source-code.html).
* **Knowing techniques to refactor**: [the Mikado Method](https://www.manning.com/books/the-mikado-method), [Parallel Change](https://www.martinfowler.com/bliki/ParallelChange.html), leaning on the compiler (when altering a declaration to cause compile errors), scratch refactoring (when doing changes to get a better understanding on the code and then throwing those changes away), ...

### How to create a safety net if it doesn't exist (some tips)

I love when **Michael C. Feathers** talks about two ways of doing changes:

> Edit and Pray

or:

> Cover and Modify

I think we would all prefer the second one ;)

Although we can face the **Legacy Code Dilemma**:

> When we change code, we should have tests in place. To put tests in place, we often have to change code.

Maybe we can trust in automated refactorings with an IDE. If you do that, take care of it, because as Michael says:

> You can do some automated refactoring without tests, but you have to know what the tool is checking and what it isn’t.

One of the techniques to get a safety net is **Golden Master Technique** which consists of capturing the output for different inputs and creating a test with them to ensure we don't break the system when refactoring.

After using this technique, refactoring the source code and understanding it better, we can add unit tests and then discard the Golden Master Test. As Michael says:

> While higher-level tests are an important tool, they shouldn't be a substitute for unit tests. Instead, they should be a first step toward getting unit tests in place. 

If the current system doesn't send text to an output stream, we must follow other techniques to write tests:

* Breaking dependencies. It can be useful to create [seams](http://ptgmedia.pearsoncmg.com/images/9780131177055/samplepages/0131177052.pdf).
* Identifying responsibilities and extracting methods for them.
* Starting with characterization tests to document the actual behaviour.
* Pair programming: _(...) working in legacy code is surgery, and doctors never operate alone_ - Michael C. Feathers.
* Knowing the programming language to consider all the available options.
* ...

Are you trying to test a private method? I love this piece of advice by Michael:

> (...) Many people spend a lot of time trying to figure out how to get around this problem, but, (...) the real answer is that if you have the urge to test a private method, the method shouldn’t be private; (...) it is part of a separate responsibility. It should be on another class.

## How to learn and practice all those things?

One of the best ways to learn and practice is _playing_ with **refactoring katas** where you start with a small piece of legacy code that must be refactored in order to add/change a feature.

You can find several [refactoring katas at Kata Log](http://kata-log.rocks/refactoring.html).

One of my favorite **refactoring katas** is 'Gilded Rose Kata', because it's a great example of the recommended steps for adding a new feature in legacy code:

1. Creating a safety net of tests
2. Refactoring (because the code isn't simple)
3. Adding the new feature

I recorded a screencast about a part of the refactoring step: getting a clear conditional statement, after having a safety net of tests and before replacing the conditional by polymorphism to finish the refactoring step. Oh, my first screencast! 

It's a mouseless demo:

<iframe title="Intermediate step of Gilded Rose Kata" width="100%" height="365" src="https://www.youtube.com/embed/JkaRA9y0aPc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Let's see each change that I made.

### Making the `for` loop more compact and easy to read

The main loop is a ```for``` statement with the three expressions:

```java

  for (int i = 0; i < items.length; i++) {
      ...
      // elements are accessed by items[i]
      ...
  }

```

So it's replaced by an enhanced ```for``` statement with **Replace with foreach** option in Intellij IDEA:

```java

  for (Item item : items) {
      ...
      // elements are accessed by item
      ...
  }

```

### Inverting ```if``` to avoid negative conditionals

Martin Fowler only includes a comment about negative conditionals in his book:

> Leaving nots in a conditional like that twists my mind around at a painful angle (...)

However, Robert C. Martin includes **Avoid negative conditionals** in _Clean Code_ book (chapter _Smells and Heuristics_):

> Negatives are just a bit harder to understand than positives. So, **when possible**, conditionals should be expressed as positives.

There are several negative conditionals in the `for` loop. For example:

```java
  
  if (!item.name.equals("Aged Brie")
          && !item.name.equals("Backstage passes to a TAFKAL80ETC concert")) {
      if (item.quality > 0) {
          ...
      }
  }
  
```

I chose **Invert if condition** option in IntelliJ IDEA to get this result:

```java

  if (item.name.equals("Aged Brie")
          || item.name.equals("Backstage passes to a TAFKAL80ETC concert")) {
      ...
  } else {
      if (item.quality > 0) {
          ...
      }
  }

```

In this case, I also extracted the first condition in order not to have two conditions in the same if statement. It's possible with **Extract if ...** or **Split into 2 if's** options:

```java

  if (item.name.equals("Aged Brie")) {
      ...
  } else if (item.name.equals("Backstage passes to a TAFKAL80ETC concert")) {
      ...
  } else {
      if (item.quality > 0) {
          ...
      }
  }

```

### Removing Dead Code

The IDE detects a piece of dead code inside this condition:

```java

  if (item.name.equals("Aged Brie")) {
      if (item.quality < 50) {
          item.quality = item.quality + 1;

          if (item.name.equals("Backstage passes to a TAFKAL80ETC concert")) {
              ...
          }
      }
  }

``` 

The field ```name``` is not changed between the two comparisons with it, so the second comparison can be removed because it'll never be true:

```java
  
  if (item.name.equals("Aged Brie")) {
      if (item.quality < 50) {
          item.quality = item.quality + 1;
      }
  }
  
```

### Simplifying operations 

There are several verbose operations with the field ```quality```:

```java

  item.quality = item.quality - 1;
  ...
  item.quality = item.quality + 1;
  ...
  item.quality = item.quality - item.quality;

```

and they are simplified with the replacing options:

```java

  item.quality -= 1;
  ...
  item.quality += 1;
  ...
  item.quality = 0;

```

### Extracting methods

I made several small changes to be able to extract these methods to increase and decrease the quality:

```java

  if (item.quality < 50) {
    item.quality += 1;
  }

```

```java

  if (item.quality > 0) {
    item.quality -= 1;
  }

```

It removes the duplicated code and it makes code easier to read and understand.

### Reflecting the domain

This change could be DDD-related. The text of the kata includes the following description:

> "Backstage passes", like aged brie, increases in Quality as it's SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert.

However, the source code shows the consideration of 11 days or 6 days:

```java

  increaseItemQuality(item);
  if (item.sellIn < 11) {
      increaseItemQuality(item);
  }
  if (item.sellIn < 6) {
      increaseItemQuality(item);
  }

  ...

  if (item.name.equals("Sulfuras, Hand of Ragnaros")) {
  } else {
      item.sellIn -= 1;
  }
  
  ...

  if (item.sellIn < 0) {
      item.quality = 0;
  }

```

So, I changed the order of the reduction of the field ```sellIn``` to reflect the domain values. However, it wasn't right, because it's about "10 days or less" and "5 days or less". So, a more accurate change would be:

```java

  increaseItemQuality(item);
  if (item.sellIn <= 10) {
      increaseItemQuality(item);
  }
  if (item.sellIn <= 5) {
      increaseItemQuality(item);
  }

```

Let's see again the text of the kata:

> Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert

Do we read the same in the source code? I don't think it's clear to have that kind of conditionals that are true at the same time for particular values. Now I think that I'd prefer something as follows:

```java

  if (item.sellIn <= 5) {
      increaseItemQuality(item, 3);
      break;
  } 
  if (item.sellIn <= 10) {
      increaseItemQuality(item, 2);
      break; 
  }

```

**NOTE 1**. This is the previous step to replacing the conditional. That's the reason why `item` is still a parameter in a method.

**NOTE 2**. I think that the source code doesn't make sense now: comparing `sellIn` (with 5 and 10), updating `sellIn` and then comparing `sellIn` again (with 0). 

I think it would be more logical as follows: updating `sellIn` and then comparing `sellIn`. 

Maybe the kata should start with `<= 11` and `<= 6` in order to be able to locate the reduction in `sellIn` before all the comparisons.

### A different approach instead of the manual changes

I made automated refactorings with the IDE, but I also made some error-prone changes: moving lines up and down manually. Oh!

A few weeks ago, **Emily Bache** published a trilogy about this kata and she follows [**Lift-Up Conditional**](https://www.praqma.com/stories/advanced-testing-refactoring-techniques-2/). Thanks again for sharing it, Emily!

## Friendly reminders

As **Michael C. Feathers** says:

> Remember, code is your house, and you have to live in it.

and the attitude is the most important thing:

> (...) I've visited teams with millions of lines of legacy code who looked at each day as a challenge and as a chance to make things better and have fun. I've also seen teams with far better code bases who are dejected. The attitude we bring to the work is important.

Last but not least, as **Dani Latorre** says (in English below):

<blockquote class="twitter-tweet" data-lang="en"><p lang="es" dir="ltr">El refactoring es rollo la higiene personal, hay que ir haciéndolo continuamente. Así que siempre en contra de los “sprints de refactoring” </p>&mdash; Dani Latorre (@dani_latorre) <a href="https://twitter.com/dani_latorre/status/1113719760213151745?ref_src=twsrc%5Etfw">April 4, 2019</a></blockquote>

In English:

> Refactoring is like personal hygiene, it must be done continuously. So always against "refactoring sprints".

## Further reading

[Trilogy about Advanced Testing & Refactoring Techniques](https://www.praqma.com/stories/advanced-testing-refactoring-techniques/) by **Emily Bache**. Take a look at the use of [Approval Tests](https://github.com/approvals) that are available in different programming languages.

Existing quotes in this post come from these books:

* [Clean Code](https://www.goodreads.com/book/show/3735293-clean-code) by **Robert C. Martin** (chapter _Smells and Heuristics_)
* [Working Effectively With Legacy Code](http://wiki.c2.com/?WorkingEffectivelyWithLegacyCode) by **Michael C. Feathers**
* [Refactoring - Improving the Design of Existing Code](https://refactoring.com) by **Martin Fowler**
    * [Catalog of refactorings](https://refactoring.com/catalog/)
    * [Changes for the 2nd edition of the book](https://martinfowler.com/articles/refactoring-2nd-changes.html)
