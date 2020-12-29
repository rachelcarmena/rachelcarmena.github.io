---
layout: post
asset-type: post
title: Not only source code smells
description: Reflections about experiences
date: 2020-12-29 10:00:00 +00:00
image:
    src: /img/cards/posts/not-only-source-code-smells/cover.jpg
---

I cannot forget that project...

I joined when it was almost one year old.

After a few days digging deeper into the product and trying to solve some issues, I proposed to start building the product from the beginning.

What?

Yes, I did it ;)

Oh, a young and daring person!!!

There wasn't a trend to follow Agile methodologies then and it was the characteristic Waterfall project where all the decisions were made at the beginning before the product is built.

Oh, wait, that thing also happens in some "Agile" projects nowadays where all the decisions are made at the beginning to fill the backlog like there's no tomorrow.

And backlog refinement sessions for those projects are extremely chaotic.

As [Andy Hunt](https://twitter.com/PragmaticAndy) wrote in [Pragmatic thinking and learning. Refactor your wetware](https://pragprog.com/book/ahptl/pragmatic-thinking-and-learning):

> **Be comfortable with uncertainty.** Agile software development embraces the idea of working with uncertainty. Early on, you don’t know what the project end date will really be. You’re not 100 percent certain which features will be present in the next iteration. You don’t know how many iterations there will be. And that’s perfectly OK: that’s the sort of uncertainty you want to be comfortable with. You’ll find answers as you go along, and by the end, everything will have been answered.

That's one of the reasons why we talk about evolutionary architectures, for instance.

Please, let's reflect about it. You'll find a book about Agile Anti-Patterns at the end.

**Let's come back to the beginning of this story!**

A lot of meetings were needed to defend my proposal.

I didn't have too much professional experience then and several mates were asked to share their points of view.

By the end, the product was started from the beginning and we had a working product after a few weeks.

No merit.

I recognize that it's easier to create a product when a huge amount of feedback exists. Likewise new products are created and work better than other competitors.

**What happened before?**

In summary, a lot of time had been invested on irrelevant features and they had been thought too complex. It's known as [accidental complexity](https://wiki.c2.com/?AccidentalComplexity).

At the same time, the most important features that gave meaning to the product, the core of the product, what defined the product, ... those features hadn't been taken care. Not only they didn't work as expected for the client but also it was really difficult to make a change without breaking surprise things. Some Marie Kondo time was needed to organize them in a different way.

**How could that project have been different?**

I think that not only the source code has smells. All the things can have smells.

Some examples from that project:

* When having a complex data model in an initial step: did we add extra features that the client didn't request? Could it be reduced to start with a simpler step for an initial working product? Imagine those scenes where a person appears with a typewriter. That person doesn't find a good story and starts a white paper several times. A new paper into the trash and starting again. We're lucky because we're working in a profession where it's easy to delete things. However, we aren't used to deleting what we write or draw but it grows and grows.

* When having long discussions: why are they long? Every person is proposing a different solution. No agreements. It's said that one's ego plays in those discussions. I'm not sure about it. Maybe there are no agreements because any proposal could be right. Nobody knows it. What if we are discussing unknown things? What if we don't have enough data to make a decision? Maybe, instead of egos, every person is looking at their crystal ball to look at the future and find the right solution. What if we wait for having more feedback to reach that point? What if we make a decision from the things that we really know right now? What would be the first small step now? _We only know that ... now so it's necessary to ... To do that, we can start ... and then we'll decide next steps_.

Stop and think. Detect the smells. Detect what things are _telling_. Why this complex design? Why this long discussion?

## Further knowledge

* [David Tanzer](https://twitter.com/dtanzer) talks about the product backlog bankruptcy in his [Agile Anti-Patterns](https://www.quickglance.at/agile_antipatterns.html) book among other interesting reflections. It's also available in Spanish: [Antipatrones del Desarrollo Ágil](https://www.quickglance.at/agile_antipatterns_es).

* [El patadón pa'lante. Posponer decisiones](https://www.youtube.com/watch?v=vEr2xbNoUxM) by [Eduardo Ferro](https://twitter.com/eferro).

* [Duplication, you're welcome](/2018/02/27/duplication-you-are-welcome.html)

* [Coding-centered methodology](/2019/01/23/Coding-centered-methodology.html)

## Credit

Image by <a href="https://pixabay.com/users/fearscare-2010330/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=4043090">Fearscare</a> from <a href="https://pixabay.com/?utm_source=link-attribution&amp;utm_medium=referral&amp;utm_campaign=image&amp;utm_content=4043090">Pixabay</a>
