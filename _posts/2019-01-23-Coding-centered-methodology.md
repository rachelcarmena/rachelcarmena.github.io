---
layout: post
asset-type: post
title: Coding-centered methodology
description: Trying to answer to What methodology?
image:
    src: /img/cards/posts/coding-centered-methodology/cover.jpg
---

A friend of mine:

> Rachel, I'm lost with so many names: Scrum, Kanban, Scrumban, Extreme Programming, Agile methodologies and DevOps. And now you are talking about Software Craftsmanship. Absolutely lost. Where are we going? What methodology should I choose?

It was a difficult question and I needed to organize the mentioned methodologies and cultures.

At that time, I remembered one of the reflection moments that came up when preparing a talk. 

I talked about [Software as a Craft](/2018/02/23/software-as-a-craft.html) at the University of Tarragona with a lot of students as attendees. However, I forgot to ask them if the **Waterfall model** was still taught there and how.

Taking the definition of [Extreme Humility](http://wiki.c2.com/?ExtremeHumility) as a reference, I came up with these reflections.

![Waterfall](/img/cards/posts/coding-centered-methodology/waterfall.jpg)

There was a lack of humility, because it was thought that we could make each phase correctly one after another.

Developers were not expected to think, because they only had to program what other people thought. And experienced developers were promoted to think and they lose their expertise in programming.

There were also a separation between master (first phases) and apprentice (coding phase), the difficulty in giving feedback and a clear separation with Testing and Deployment phases at the end (_quick, quick, we're late_).

Alternatives to the Waterfall model were both the **iterative development** and the **incremental development**. Its combination led to new development methodologies.

The idea of Scrum for software development was presented by Jeff Sutherland and Ken Schwaber at [OOPSLA conference](http://www.oopsla.org/oopsla-history/) in 1995. All activity in the **Scrum Development Process** takes place within two inspect-and-adapt cycles: sprint and daily meeting.

**Kanban System** was developed by Taiichi Ohno, a vice president of Toyota, and Shigeo Shingo and it consists of a set of cards containing all the information required to be done on a product. They are used to control the work-in-progress (WIP), production and inventory flow.

**Scrumban** was born as a way to transition from Scrum to Kanban, when introducing Kanban to visualize, understand and continuously improve the way of working.

On the other hand, Kent Beck created **Extreme Programming** in 1996 and it takes values, principles and practices to extreme levels. As Kent Beck wrote:

> (...) there are certain things that you have to do to be doing XP. You don't get to choose whether or not you will write tests - if you don't, you aren't extreme (...)

In 2001, there was a discussion about all the new methodologies and the result was the [**Manifesto for Agile Software Development**](https://agilemanifesto.org). The [list of 12 principles](https://agilemanifesto.org/principles.html) include:

* Build projects around **motivated individuals**. Give them the environment and support they need, and trust them to get the job done.
* Continuous attention to **technical excellence** and **good design** enhances agility.
* At regular intervals, the team reflects on **how to become more effective**, then tunes and adjusts its behavior accordingly.

These 3 principles are focused on professionalism and well-craft software. However, in 2008, Robert C. Martin proposed a fifth value for the Agile Manifesto: _Craftsmanship over Crap_. 

More discussions came up with an extension of the Agile Manifesto in 2009: [Manifesto for Software Craftsmanship](http://manifesto.softwarecraftsmanship.org/). 

**Software Craftsmanship** is an approach to software development that inspires me the apprentice/master relationship, professionalism, practice to improve coding skills and the existence of communities.

Finally, **DevOps** term comes from [DevOpsDays](https://legacy.devopsdays.org/events/2009-ghent/), the conference that brings development and operations together since 2009. I understand DevOps as a culture of collaboration and cooperation between development and IT operations, working together towards a common objective.

![Coding-centered methodology](/img/cards/posts/coding-centered-methodology/coding-centered.jpg)

So I think that we are travelling to a **coding-centered methodology** as follows:

* More humility when postponing decisions
* More humility when trying concrete experiments
* More humility when doing small and simple steps
* Getting fast feedback and embracing change
* Working together with a better communication
* Having common objectives as a team (business people and customer included)
* Having a common responsibility
* Having a better knowledge transmission
* Having a set of agile technical practices

And following a learning culture in order to share and improve our skills.

[UPDATE] Of course, coding-centered doesn't mean only coding, nor to remove analysis and design, but focused on getting value and feedback as soon as possible. As [Kent Beck said in an interview](https://www.youtube.com/watch?v=fH4gqsIYzyE):

> We were taught that the way that you develop software is you think very carefully about what you're going to do first (...) you draw lots of diagrams and you write lots of text and you specify exactly what the system needs to do - not exactly how it's going to accomplish it - and then, you design exactly the computer system that will implement those ideas (...) When you start implementing it, you realize "hey, this is not what we want the system to do". And even if that is what we want the system to do, the way we were guessing isn't going to work to make that happen (...) It's a question of the order of the decisions (...) Nobody's saying you don't have to decide what the system has to do, but the question is how much of it you have to decide when.

My friend again:

> Thanks, I have a general idea now. And which are the rules of that software development methodology?

There aren't rules.

It consists of values:

* [Values from Extreme Programming](http://www.extremeprogramming.org/values.html)
* [Values from Manifesto for Agile Software Development](https://agilemanifesto.org)
* [Values from Manifesto for Software Craftsmanship](http://manifesto.softwarecraftsmanship.org/)
* Pragmatism
* Proactivity
* Open-minded
* Creativity
* Trust

principles:

* [Principles from Extreme Programming](https://en.wikipedia.org/wiki/Extreme_programming#Principles)
* [Principles from Manifesto for Agile Software Development](https://agilemanifesto.org/principles.html)
* [Principles from Continuous Delivery](https://continuousdelivery.com/principles/)
* [Lean Software Development Principles](http://www.leanessays.com/2015/06/lean-software-development-history.html)

and practices:

* [Practices from Extreme Programming](https://ronjeffries.com/xprog/what-is-extreme-programming/) 
* [Other test-driven programming workflows](/2018/11/13/test-driven-programming-workflows.html)
* [Property-based testing (link of the canonical framework)](https://hackage.haskell.org/package/QuickCheck)
* [Continuous Delivery](https://continuousdelivery.com)
* [Trunk based development](https://trunkbaseddevelopment.com)

## Further reading

* [The Pragmatic Programmer: From Journeyman to Master](https://pragprog.com/book/tpp/the-pragmatic-programmer) by Andrew Hunt and David Thomas 
* [Software Craftsmanship: Professionalism, Pragmatism, Pride](https://leanpub.com/socra) by Sandro Mancuso
* [Release It! Design and Deploy Production-Ready Software](https://pragprog.com/book/mnee2/release-it-second-edition) by Michael T. Nygard
* [Agile Technical Practices Distilled](https://leanpub.com/agiletechnicalpracticesdistilled) by Pedro Moreira Santos, Marco Consolaro, and Alessandro Di Gioia

## Disclaimer

I usually simplify the terms with methodologies or cultures. However, there are more terms as methods, models, frameworks, processes or approaches, among others.

For example, the authors of Scrum called it "Scrum development process" to avoid [the method or methodology debate](http://wiki.c2.com/?MethodOrMethodology). However, it's also referred as an agile framework.

In this post, I usually used the terms that appear at the [Wiki](http://wiki.c2.com) by Ward Cunningham.

