---
layout: post
asset-type: post
title: Rereading The Cathedral and The Bazaar
description: Some notes about the book
date: 2021-07-16 10:00:00 +00:00
category: reading
image:
    src: /img/cards/posts/rereading-the-cathedral-and-the-bazaar/cover.jpg
---

A few weeks ago, I found a paper copy of the essay [The Cathedral and The Bazaar](http://www.catb.org/~esr/writings/cathedral-bazaar/) by Eric S. Raymond from my first year of University degree, the subject Computing and Society. The essay had been published one year before and it would become a book one year later. It was very popular then.

So many years on, it deserved a rereading given what happened with [The Mythical Man-Month](/2018/03/31/rereading-the-mythical-man-month.html).

I think it's a recommended reading for anyone who wants to know more about the called bazaar style and the lessons learnt when applying it on an open-source product.

The essay is available on [Eric S. Raymond's website](http://www.catb.org/~esr/writings/cathedral-bazaar/). I'm just including a few comments here.

## Continuous delivery

> I had been preaching the Unix gospel of small tools, rapid prototyping and evolutionary programming for years.

On the other hand, one chapter is entitled:

> Release early, release often.

And one of the lessons in that chapter adds:

> And listen to your customers.

Those things are widely mentioned nowadays. However, I'm wondering whether it would happen in 1997.

## Make it work, make it right and make it fast

Eric explains how Linux started reusing code and ideas from Minix:

> Eventually all the Minix code went away or was completely rewritten—but while it was there, it provided scaffolding for the infant that would eventually become Linux. 

Find [more details about make it work, make it right and make it fast](https://wiki.c2.com/?MakeItWorkMakeItRightMakeItFast).

## Problem vs. Solution

I witnessed a lot of discussions in terms of the solution before having a clear understanding of the problem. Eric talks about the importance of understanding the problems (please, take a look at the essay to get more context about it):

> you often don't really understand the problem until after the first time you implement a solution

> Often, the most striking and innovative solutions come from realizing that your concept of the problem was wrong.

## Pygmalion effect

> If you treat your beta-testers as if they're your most valuable resource, they will respond by becoming your most valuable resource.

## Simplicity

> Don't hesitate to throw away superannuated features when you can do it without loss of effectiveness.

> When your code is getting both better and simpler, that is when you know it's right.

## Brooks' law

The author tries to understand how an open-source product can be made by so many people because that fact contradicts Brooks' law.

However, I find some differences between a team in a company and a community of an open-source product:

* Target: People that are part of a community are usually users of the product.

* Context: People that are part of a community decide freely their contributions.

* Communication: Teams in a company usually have a biased view of a product. However, Eric explained how he dealt with the communication of the design decisions for the whole community.

* Motivation: Sometimes it's easier to find more recognition in a community than in a company.

## References

Finally, it includes a small but interesting [bibliography](http://www.catb.org/~esr/writings/cathedral-bazaar/cathedral-bazaar/ar01s15.html).

I would add [Basics of the Unix Philosophy](http://www.catb.org/~esr/writings/taoup/html/ch01s06.html) from the book The Art of Unix Programming by Eric S. Raymond. Some of the rules continue being discussed even nowadays.

## Credit

Image by <a href="https://pixabay.com/users/majaranda-13272204/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=5473076">Majaranda</a> from <a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=5473076">Pixabay</a>
