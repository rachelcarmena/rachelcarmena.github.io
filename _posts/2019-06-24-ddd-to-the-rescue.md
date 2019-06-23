---
layout: post
asset-type: post
title: Domain-Driven Design to the rescue
description: Trying to explain DDD easily
date: 2019-06-24 08:00:00 +00:00
category: reflections
image:
    src: /img/cards/posts/ddd-to-the-rescue/cover.jpg
---

## Introduction

Domain-Driven Design (DDD) could be explained from the problems that we experience in our profession.

What problems does DDD solve?

Or what problems can we avoid when following DDD?

Let's see some of them.

## Problems and solutions

### The software system lacks important functionality and contains unneeded functionality.

It's usual to see how design sketching is the first step when creating a software product without knowing the business it's being created for.

Or sometimes there is a misunderstanding about Agile methodologies and it's thought that there is no need for neither analysis nor design at all.

The purpose of the software is to enhance a specific **domain** or a business domain. So we should start by understanding and **acquiring knowledge about that domain**.

As [Jeff Johnson](http://www.uiwizards.com/about.html) wrote in "GUI Bloopers":

> Starting by worrying about appearances (...) results in products that lack important functionality, contain unneeded functionality, and are difficult to learn and use. (...) A recommended way is to design a conceptual model for the software (...) The idea is that by carefully crafting an explicit conceptual model, and then designing a UI from that, the resulting software will be cleaner, simpler, and easier to understand.

### The software system has no architecture. It's a big ball of mud.

The domain could be divided into logical subdomains: 

* **A core domain**: the main area of expertise.
* **Supporting subdomains**: they are necessary and support that core domain.
* **Generic subdomains**: they are also necessary but they don't give a relevant meaning to the domain, such as identity and access subdomain.

When implementing the software system, we don't want to mix knowledge or responsibilities, so we should determine contextual or semantic boundaries: **bounded contexts**.

Generally we'll have one bounded context per subdomain and we'll establish the relationships between those bounded contexts to integrate them: **context mappings**.

Some types of context mappings:

* **Shared kernel**: two bounded contexts are sharing a part of the model.
* **Customer/supplier**: one bounded context is feeding another one.
* **Conformist**: the customer adapts to the supplier model.
* **Anti-corruption layer**: the customer builds a translation layer to protect themselves.
* **Open host service** with a **published language**: the supplier provides well documented services to integrate with.

### Newcomers to the team struggle to understand the code. Users struggle to use the product.

Both domain experts and developers should use a common vocabulary to ensure a clear understanding: **a ubiquitous language**.

Every bounded context will have its ubiquitous language and it will be used to model that context.

So we will create the software system in the language of the domain. We will take care of naming for variables, methods, tables, relations, labels, etc.

In this way, the software system will reflect the business domain it's being created for.

As [Jeff Johnson](http://www.uiwizards.com/about.html) wrote in "GUI Bloopers":

> A recommended way is to design a conceptual model for the software (...) expressed in terms of the concepts of the intended users’ tasks (...) concepts that will be familiar to users. Leave foreign concepts out. (...) Software developed without a lexicon often suffers from two common user interface “bloopers”: (1) multiple terms for a given concept and (2) the same term for different concepts.

### Some domain objects have complex associations with other objects and it's difficult to guarantee the data consistency.

Associated objects that can suffer data consistency problems because of changes should be clustered to be treated as a unit: **aggregate**. The external reference to that cluster should be restricted to one member: **aggregate root**. 

The operations that effect some change to the system intentionally are known as **commands**.

Aggregates should be small in order not to have problems with transactions or memory. If the associated objects can be updated eventually (seconds, minutes, ...), they don't have to be in the same aggregate. In that case, an **domain event** could be published to be consumed afterwards. Or those domain events could be stored in order to be used to reconstitute the state of a domain object (the idea behind _Event Sourcing_).

However, domain events are facts that can be caused by other reasons. For example, they could be time-based with a significant business meaning.

Note: a naming convention for domain events is the domain object name followed by a verb in past tense.

## Appendix: Event Storming

Event Storming is a technique for exploring and acquiring knowledge about the domain. It's focused on the operations that happen within a business process. 

* Participants: domain experts and developers.
* Materials: sticky notes, black markers and a roll of paper.

The color of a sticky note has a specific meaning:

* Orange: domain events
* Blue: commands
* Yellow: aggregates or entities
* Red: a caution or error situation
* Green: user interface components
* Purple: policies or processes

Steps:

1. Model domain events in time order
2. Model commands that cause domain events
3. Model the aggregates or entities of the model (they receive a command, handle it and produce a domain event)
4. Identify context boundaries
5. Identify views and other components

## Friendly reminder

Nowadays we think about microservices very quickly but there are other architectures. Besides, we could have a tidy monolith.

[Simon Brown](https://twitter.com/simonbrown) differentiates a "modular monolith" from a "monolithic big ball of mud".

## Further knowledge

* [DDD Community: What is Domain-Driven Design?](http://dddcommunity.org/learning-ddd/what_is_ddd/)
* Domain-Driven Design: Tackling Complexity in the Heart of Software by **Eric Evans**
* [Eric Evans: What I've learned about DDD since the book](http://dddcommunity.org/library/evans_2009_1/) 
* Implementing Domain-Driven Design by **Vaughn Vernon**
* Domain-Driven Design Distilled by **Vaughn Vernon**
* [Talk: Domain Modeling Made Functional](https://www.youtube.com/watch?v=Up7LcbGZFuo) by Scott Wlaschin. He includes a lot of interesting things about DDD and functional programming (not scary but unfamiliar). However, I don't agree with his opinion about UML diagrams because it's not a black or white choice for me and they are sometimes necessary. It's another tool/card in this profession/game.
* [Event Storming](https://www.eventstorming.com) by Alberto Brandolini
* [Talk: Deconstructing the monolith: maximizing developer productivity](https://www.youtube.com/watch?v=sOsSaK90j5w) by **Kirsten Westeinde**. She explains these steps to deconstruct a monolith: reorganize the code, isolate dependencies and enforce boundaries. Concepts by **Simon Brown** appear at 00:07:20.
* [Talk: Domain prototyping, or design is how it works](http://videos.ncrafts.io/video/342450315) by **Tobias Goeschel**. He shows a workflow which starts with the domain model.
