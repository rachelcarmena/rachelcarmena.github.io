---
layout: post
asset-type: post
title: Domain-Driven Design to the rescue
description: Trying to explain DDD easily
date: 2019-06-24 08:00:00 +00:00
last_modified_at: 2019-08-08 08:00:00 +00:00
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

The purpose of the software is to enhance a specific **domain** or a business domain, so we should start by **understanding** and **acquiring knowledge** about that domain.

As [Jeff Johnson](http://www.uiwizards.com/about.html) wrote in "GUI Bloopers":

> Starting by worrying about appearances (...) results in products that lack important functionality, contain unneeded functionality, and are difficult to learn and use. (...) A recommended way is to design a conceptual model for the software (...) The idea is that by carefully crafting an explicit conceptual model, and then designing a UI from that, the resulting software will be cleaner, simpler, and easier to understand.

How to acquire knowledge about the business domain?

We'll see a collaborative technique at the end.

### The software system has no architecture. It's a big ball of mud.

The domain could be divided into logical subdomains: 

* **A core domain**: the main area of expertise.
* **Supporting subdomains**: they are necessary and support the core domain.
* **Generic subdomains**: they are also necessary but they don't give a relevant meaning to the domain, such as identity and access subdomain.

It's interesting to identify the logical subdomains in order to know what really gives a meaning to the business and if there is something that should be built on third-party components.

When implementing the software system, we don't want to mix knowledge or responsibilities, so we should determine contextual or semantic boundaries: **bounded contexts**.

Generally there will be one bounded context per subdomain.

How are those bounded contexts integrated? Through relationships known as **context mappings**.

Some types of context mappings:

* **Shared kernel**: two bounded contexts are sharing a part of the model.
* **Customer/supplier**: one bounded context is feeding another one.
* **Conformist**: the customer adapts to the supplier model.
* **Anti-corruption layer**: the customer builds a translation layer to protect themselves.
* **Open host service** with a **published language**: the supplier provides well documented services to integrate with.

All of this will be reflected on the architecture.

### Newcomers to the team struggle to understand the code. Users struggle to use the product.

Both domain experts and developers should use a common vocabulary to ensure a clear understanding of the domain: **a ubiquitous language**.

Every bounded context will have its ubiquitous language and it will be used to model that context.

So we will create the software system in the language of the domain, taking care of names for variables, methods, tables, relations, labels, etc.

As [Jeff Johnson](http://www.uiwizards.com/about.html) wrote in "GUI Bloopers":

> A recommended way is to design a conceptual model for the software (...) expressed in terms of the concepts of the intended users’ tasks (...) concepts that will be familiar to users. Leave foreign concepts out. (...) Software developed without a lexicon often suffers from two common user interface “bloopers”: (1) multiple terms for a given concept and (2) the same term for different concepts.

When using a ubiquitous language, the software system will reflect, internally and externally, the business domain it's being created for.

### Some domain objects have complex associations with other objects and it's difficult to guarantee the data consistency.

On one hand, the operations that effect some change to the system intentionally are known as **commands**. And the result of a command is known as a **domain event**.

On the other hand, there are associated objects that can suffer data consistency problems because of those changes.

Therefore, the associated objects should be clustered to be treated as a unit: an **aggregate**.

The external reference to that cluster is restricted to one member: an **aggregate root**. 

Aggregates should be small in order not to have problems with transactions or memory.

If the associated objects can be updated eventually (seconds, minutes, ...), they don't have to be in the same aggregate. In that case, a domain event could be published to be consumed afterwards. Or those domain events could be stored in order to be used to reconstitute the state of a domain object (the idea behind _Event Sourcing_).

<div class="note">
<strong>Note</strong>: Domain events are facts that can be caused by other reasons. For example, they could be time-based with a significant business meaning.
</div>

<div class="note">
<strong>Note</strong>: A naming convention for domain events is the domain object name followed by a verb in past tense.
</div>

## Appendix: Event Storming

Event Storming is a collaborative technique for exploring and acquiring knowledge about the domain.

It's focused on the operations that happen within a business process. 

As [Scott Wlaschin](https://twitter.com/ScottWlaschin) said:

> Our first guideline is to focus on domain events rather than data structures. A business doesn't just have data, it transforms it somehow.

Participants: 

* Domain experts
* Developers

Requirements:

* A room with a lot of wall space to be covered

Materials:

* Sticky notes
* Black markers
* A roll of paper

The color of a sticky note has a specific meaning:

* Orange: domain events
* Blue: commands
* Yellow: aggregates or entities
* Red: a caution or error situation
* Green: user interface components
* Purple: policies or processes

Steps:

1. Model **domain events** in time order
2. Model **commands** that cause **domain events**
3. Model the **aggregates** or **entities** of the model: they receive a command, handle it and produce a domain event.
4. Identify **context boundaries**
5. Identify views and other components

## Friendly reminder

Nowadays we think about microservices as the great solution. However, a tidy monolith might be enough if there is no need to scale microservices independently.

[Simon Brown](https://twitter.com/simonbrown) differentiates a "modular monolith" from a "monolithic big ball of mud". And I could say that I've seen microservices which were really micro-monolithic big balls of mud. It's ok, we make mistakes. The real mistake is not to do anything to fix it.

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
