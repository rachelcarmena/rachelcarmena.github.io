---
layout: post
asset-type: post
title: Software as a craft
description: Talk
image:
   src: /img/cards/posts/sw-as-a-craft/cover.png
   thumbnail: /img/cards/posts/sw-as-a-craft/thumb.cover.png
---

## Slide deck

This is the slide deck of my talk. There is no video, so it includes some extra slides as intertitles in the same way as a silent film.

<iframe src="//www.slideshare.net/slideshow/embed_code/key/KeEqhuD4utcPKg" title="Slide deck of Software as a craft talk" width="595" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe>

This talk happened at the University of Tarragona (URV) with a lot of students as attendees. It encourages to strive for a learning culture and being better professionals in software development.

[I published these slides at Codurance website](https://codurance.com/videos/2018-02-23-software-as-a-craft).

## Transcript

### [Text on screen: ONCE UPON A TIME]

It began when I was 12 years old and my mother, programmer in COBOL on punch cards in 70s, encouraged me to attend a course in the back office of a printers shop. It was called ‘Soft-Hard academy’.

6 years later, I had my first computer with a Linux distribution. My first computer!!! Those were other times. 

5 years later, I participated in my first project following the waterfall method.

According to the WikiWikiWeb by Ward Cunningham, "the (pure) WaterFall method is arrogant in its confidence":

* Requirements phase: "we will identify all relevant requirements, and correctly"
* Analysis and design phases: "we will interpret the requirements correctly, and produce an implementable architecture and design which will not need changes"
* Coding phase: "we will interpret the design correctly and make no significant mistakes"
* Testing phase: "we will test correctly, and (sufficiently) exhaustively"

Not only a lack of humility, but also developers are not expected to think. 

Experienced developers are promoted to think and they lose their expertise in programming.

What happens if we focus on developers? 

* Humility
* No separation between coding and quality
* Continuous integration, deployment and delivery
* Master and apprentice together
* Postponed decisions
* Evolutionary design
* Fast feedback
* Everybody thinks
* Spikes

Software craftsmanship focuses on getting better professionals in software development.

From Manifesto for Software Craftsmanship:

> As aspiring Software Craftspeople we are raising the bar of professional software development by practicing it and helping others learn the craft.

There are two pillars:

* Practice
* Master/apprentice relationship

### [Text on screen: PRACTICE]

There are a lot of available code katas to practice and to experiment with principles, patterns, architectures, among others.

From Wolfram Kriesing:

> Remember that a kata or coding dojo is a space for practicing, so you are allowed to go to extremes you would normally not go to. Push the limits to know how far you really wanna go in real life.

There is a format of event in which the same code kata is done with different constraints during a whole day: coderetreat. A coderetreat is a volunteer-based, globally coordinated effort to improve software developer's skills.

You can practice alone or with a pair.

In 1998, Carlos Sainz had a mechanical problem a few meters from the finish. His co-driver shouted him:

> ¡Trata de arrancarlo Carlos! ¡Trata de arrancarlo!

(Try to start it, Carlos! Try to start it!)

Until then, I haven’t heard about Luis Moya, his co-driver.

A co-driver is very important for a rally driver, because it’s difficult to become aware of everything when you are handling controls. The same thing happens to us with a computer. So it’s very useful to have a navigator when programming.

Some recommendations when pair programming:

* Respect
* ‘Let’s try your idea first’
* DRIVER: Thinking out loud
* NAVIGATOR: 10-second rule
* Don’t worry if it feels awkward at first

What can we practice? Evolutionary design? There is a design discipline: Test-Driven Development (TDD).

Kent Beck says that he ‘rediscovered’ TDD in an ancient book about programming:

> It said you take the input tape, manually type in the output tape you expect, then program until the actual output tape matches the expected output.

If we start programming production code and then tests, we’ll focus on implementation.

If we start programming test code and then production code, we can focus on behaviour. And a step about refactoring can be added, improving the code, keeping the behaviour.

Refactor? Production code & Test code. What are the things we can rely on? 4 rules of Simple Design. Kent Beck wrote these rules after having a bad 
experience when accepting this advice:

> Design for the future. Change is expensive. Make it cheap by anticipating it.

4 rules of Simple Design:

* Pass all the tests
* Reveal intention
* No duplication
* Fewer elements

Although I prefer:

* Pass all the tests
* Reveal intention
* No **knowledge** duplication
* Fewer elements

But we can rely on other things:

* S.O.L.I.D.
* 4RSD
* S.o.C.
* Connascence
* DDD
* Cohesion
* K.I.S.S.
* Coupling
* GoF Patterns
* P.O.L.A.
* Y.A.G.N.I.
* Screaming Architecture
* Clean architecture
* Law of Demeter
* D.R.Y.

And some people tend to think that they can make it run and right at the same time. 

Be humble, wait for listening to the code after green and then refactor. It will surprise you.

From Gojko Adzic: 

> to anyone who complains that TDD can still lead to crap code: TDD does not lead to good design, it can lead away from bad design. It just makes it painfully obvious that a design choice is bad because tests hurt. You still need brains & design skills to act on that signal.

A side benefit: coverage.

Does it make sense only to focus on a high coverage? Does it guarantee a good safety net?

Let’s imagine balls are mutations of production code (replacing + by -, reversing conditions, …) and tests discover/kill those mutations when failing.

There are tools to mutate source code and to execute tests in order to detect ‘not-covered’ code.

### [Text on screen: MASTER/APPRENTICE RELATIONSHIP]

Having a mentor is a great experience.

You can find a mentor in your team or people from who to learn.

Or you can find them in communities at https://softwarecrafters.slack.com

Or events like SoCraTes, Software Craftsmanship retreat for open-minded craftspeople who want to improve their craft.

Or social networks.

And you can learn a lot when reading books. I find it more interesting to read books about “our history” (those who don’t know history are doomed to repeat it) and fundamentals, rather than about specific languages or frameworks. For example:

* Clean Code by Robert C. Martin
* Code Complete by Steve McConnell
* Design Patterns by GoF
* The Mythical Man-Month by Fred Brooks
* Extreme Programming Explained by Kent Beck
* Understanding the 4 Rules of Simple Design by Corey Haines
* The Software Craftsman by Sandro Mancuso
* Growing Object-Oriented Software, guided by tests by Steve Freeman and Nat Pryce
* Refactoring by Martin Fowler
* Working effectively with legacy code by Michael Feathers
* The Pragmatic Programmer by Andrew Hunt and David Thomas
* Don't make me think by Steve Krug 

Not only reading, but also sharing what you learn. When you explain what you read, that knowledge changes for you. It helps you to comprehend it better.

And you can find small treasures in the first chapters:

* About the author
* Preface
* Foreword
* Acknowledgements

All of this requires time, so strive for a learning culture at your work: katas, book club, ...

And remember:

> Master is also apprentice

And maintain a balance for a meaningful life.

[questions and feedback time]

END OF TRANSCRIPT
