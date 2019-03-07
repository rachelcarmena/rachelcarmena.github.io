---
layout: post
asset-type: post
title: A possible next step
description: Our profession is evolving continuously
date: 2019-02-19 12:00:00 +00:00
image:
    src: /img/cards/posts/a-possible-next-step/cover.jpg
---

Our profession is evolving continuously. Let's see some steps done over last years.

During the 70s, there were problems of space and costs so the solution was creating more monolithic programs. Nowadays, those problems don't exist and there is a trending goal about replacing highly coupled monoliths by _Microservices_ in order to facilitate scalability and maintainability.

With the advent of multi-core processors, the paradigm of _Functional Programming_ walked through the door from universities to private companies and it's becoming more and more popular, because it makes concurrency much safer.

After a lot of discussions about layered architectures, _Hexagonal Architecture_ helped us to postpone decisions about the things that an application was going to interact with.

The emergence of _Agile Methodologies_ caused a need for integrating and deployment continuously, as well as being ready to deliver as soon as possible, so _CI/CD pipelines_ appeared to facilitate it.

Infrastructure was more and more complex and it took a lot of time to prepare it, so _Infrastructure as Code_ appeared in order to automate its creation.

There are things that aren't possible to test in a staging environment like choosing the most engaging page or determining the maximum number of users, so strategies of _Testing in Production_ appeared.

We need to improve our skills continuously, so _Communities of Practice_ emerge within the companies during working hours.

There are many more improvements, but I would like to mention just another one that is not particularly technical, but it's also related to our profession. The term _Culture Fit_ is moving to _Culture Add_, looking for candidates that can provide an additional value, keeping the cultural identity of the companies. These diverse environments will create solutions to a wider target audience.

## A small proposal

I would like to propose another improvement. It's not comparable with those mentioned above. It's a very small detail, but I think it can be very useful.

It emerges from my experience as an attendee at the [European Testing Conference](https://europeantestingconference.eu) a few days ago.

It happened again:

> Hi Rachel! I didn't know you changed to tester

It's not the first time that I attend a testing event and I'm asked the same question. 

I don't consider myself as a tester, but I often use testing frameworks and strategies. Furthermore, I think that knowing what other roles usually do can help me to be a person with greater awareness, empathy and ideas to work together collaboratively.

European Testing Conference was a different testing event for me. Not only I met attendees with different roles, but also there were some talks more related to development or systems. And that's great, because all of us are working to create software solutions that must be run on systems correctly.

After some talks and conversations during the event, I had the following desire: **stopping the use of DEV and TEST columns on boards**. And in other tools that are representing the same.

Why?

* It's showing a message: development, then testing.
* Testing can be seen as less important than development because of appearing after.
* Although a good slicing exists and the cycle is short can be seen as a _mini_ waterfall model.
* It can lead to have separated teams.
* It doesn't promote the collaborative working.

I'm thinking in a _world_ without:

* Developers uncomfortable with the things identified by testers.
* Testers complaining about problems created by developers.

and with:

* Developers that feel responsible of the quality (TDD, pairing, code reviews, integration testing, etc).
* Testers that spot the gaps left by developers (other perspectives when thinking about the solutions, performance, difficult integrations, production observability, etc).
* Developers who sit with testers to know what they do and vice versa (_Oh! I can help you with..._, _Oh! I can teach you a way for ..._, etc).
* Developers and testers who work together from the beginning to the end.
* Developers and testers who grow together.
* Developers and testers who complement and cooperate with each other.
* Developers and testers who are equally considered, because all of them have particular skills and provide value.

Stopping the use of DEV and TEST columns on boards, can it lead to all of those things?

I don't know, but I'm sure that the separation doesn't help to get it.

### The alternative

I'd reflect about the context of the project and I'd design a specific alternative.

I'm thinking about columns that represent different moments of collaboration between roles (although other _unplanned_ collaborations could happen). 

> Software construction is a creative process - Fred Brooks 

## Friendly reminder

I remember when I was reviewing design principles with a colleague.

I thought that having a list could be boring, so I prepared small papers with the names of the design principles and they were folded to be chosen randomly. 

I included a paper with: 'The design principle that you create'.

I was trying not only reviewing the design principles, but also encouraging not to be limited to the known things.

Not always the known things can fit our problems and we can need to improve them or to create new ones.

## Acknowledgments

I will be eternally grateful to the organization of [European Testing Conference](https://europeantestingconference.eu) for the opportunity of attending that awesome event, which provided me new friends, interesting conversations, knowledge, reflection moments and more things that I will be aware of them in the next days.

I met a lot of awesome people, but the most involved person in the reflections of this post is [Francisco Moreno](https://twitter.com/morvader) (maybe another cousin that I find in a conference, because we have similar origins). He's working as a QA Lead and he gave me the confidence to talk about the current situation openly.

## Received feedback

In [Twitter](https://twitter.com/bberrycarmen/status/1097833633275105282):

<blockquote class="twitter-tweet" data-conversation="none" data-lang="en"><p lang="da" dir="ltr">DevTestOps ;-) ?</p>&mdash; amisai (@amisai) <a href="https://twitter.com/amisai/status/1097845674870222851?ref_src=twsrc%5Etfw">February 19, 2019</a></blockquote>

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Knowing her was my top <a href="https://twitter.com/hashtag/ETCMoment?src=hash&amp;ref_src=twsrc%5Etfw">#ETCMoment</a> </p>&mdash; Francisco Moreno (@morvader) <a href="https://twitter.com/morvader/status/1097858160856125441?ref_src=twsrc%5Etfw">February 19, 2019</a></blockquote>

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">So much this!! Love it. </p>&mdash; Elisabeth Hocke (@lisihocke) <a href="https://twitter.com/lisihocke/status/1097924838503731204?ref_src=twsrc%5Etfw">February 19, 2019</a></blockquote>

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">It’s about testing not testers. </p>&mdash; Maaret Pyhäjärvi (@maaretp) <a href="https://twitter.com/maaretp/status/1097959283512274945?ref_src=twsrc%5Etfw">February 19, 2019</a></blockquote>

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">Great words and better advice! I felt the same and I was not able to express it correctly. &#39;You made it, you test it, you deploy it&#39;. Having a separate QA team is an antipattern. All should be considered to be in the same team and work in parallel from the beginning of the project</p>&mdash; Fran Climent (@fraclipe) <a href="https://twitter.com/fraclipe/status/1098090551981813762?ref_src=twsrc%5Etfw">February 20, 2019</a></blockquote>

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">&quot;I think that knowing what other roles usually do can help me to be a person with greater awareness, empathy and ideas to work together collaboratively.&quot; <a href="https://twitter.com/hashtag/ThatsItThatsAll?src=hash&amp;ref_src=twsrc%5Etfw">#ThatsItThatsAll</a> 😉</p>&mdash; Cutre Scrum (@q3scrum) <a href="https://twitter.com/q3scrum/status/1098113142759063553?ref_src=twsrc%5Etfw">February 20, 2019</a></blockquote>

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I’m thinking in a world without:<br><br> Developers uncomfortable with the things identified by testers.<br><br> Testers complaining about problems created by developers. <a href="https://twitter.com/hashtag/EuroTestConf?src=hash&amp;ref_src=twsrc%5Etfw">#EuroTestConf</a> </p>&mdash; Ben Linders (@BenLinders) <a href="https://twitter.com/BenLinders/status/1098221135668363264?ref_src=twsrc%5Etfw">February 20, 2019</a></blockquote>

<blockquote class="twitter-tweet" data-lang="en"><p lang="en" dir="ltr">I love Rachel’s idea of changing our board columns to better reflect everyone on the team collaborating to build quality in. Let’s try it! </p>&mdash; lisacrispin (@lisacrispin) <a href="https://twitter.com/lisacrispin/status/1101463721099051008?ref_src=twsrc%5Etfw">March 1, 2019</a></blockquote>

<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
