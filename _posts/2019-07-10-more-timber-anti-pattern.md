---
layout: post
asset-type: post
title: More timber! anti-pattern
description: Decision when there is a poor performance
date: 2019-07-10 09:00:00 +00:00
last_modified_at: 2019-07-23 09:00:00 +00:00
category: reflections
image:
    src: /img/cards/posts/more-timber-anti-pattern/cover.jpg
---

## Motivation

> Users are complaining about slowness issues.

> Ok, let's talk to System Team to increase resources.

I've listened that decision a lot of times.

I'm a fan of Marx Brothers movies since I was a child and, immediately, this film sequence by Marx Brothers appears in my mind:

<iframe width="100%" height="315" src="https://www.youtube.com/embed/UlVoZgM4fgI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

The request was translated in Spanish like _¡Más madera! ¡Más madera!_ (_More timber! More timber!_). That's the reason why I used that name for this anti-pattern.

## When it happens

**More timber! anti-pattern** happens if infrastructure is the **only** focus when an application crashes or a performance issue occurs: increasing memory, more processing capability, increasing the number of nodes, among others.

Nobody thinks about reviewing the source code, database queries, database indexes or any other internal aspect about the software.

## Possible solutions

* Code reviews.
* Database reviews: I remember that time when the problem was that the database didn't have any index.
* Observability (testing and monitoring).
* Benchmarking.

In any case, it's important to detect the issues before users.

## Update

Maybe this anti-pattern didn't happen years ago when there wasn't the current hardware neither the current ease to manage infrastructure in the cloud.

I'll never forget that time when I was helping a recent graduated colleague to improve several loops. He told me:

> I understand your proposal to save resources and time although I don't understand the need of change. I understand my source code and we have enough resources. Look, my code works!

Is the lack of constraints the root of some of our problems about development? I don't know if [Corey Haines](https://twitter.com/coreyhaines) was thinking the same when he came up with [the coderetreat format](https://www.coderetreat.org/pages/facilitating/structure-of-a-coderetreat/) where there is a constraint for each session.
