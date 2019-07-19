---
layout: post
asset-type: post
title: More timber! anti-pattern
description: Decision when there is a poor performance
date: 2019-07-10 09:00:00 +00:00
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
