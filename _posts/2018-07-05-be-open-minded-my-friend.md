---
layout: post
asset-type: post
title: "Be open-minded, my friend"
description: A journey across different technical subjects
image:
 src: /img/cards/posts/be-open-minded-my-friend/cover.jpg
---

## Summary of the talk

What's the reason why we tend to have strong opinions about certain technical subjects with no shades of gray? We experience cognitive distortions and biases. 

In this talk, I take you on a journey along different technical subjects (pull requests, branching, TDD, pair programming, OOP vs. FP, documentation, ...), because travelling opens our mind, makes us better people and helps us to consider things from new perspectives.

## Video

* **Duration**: 29 minutes without questions and feedback
* **Audio**: Spanish
* **Captions**: Spanish, English

<center>
<iframe width="100%" height="365" src="https://www.youtube.com/embed/CILmSB90swY" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

## Transcript

### [Text on screen: THANKS]

I start by thanking. First of all, thank the organization in general and all the sponsors for making this event possible. In order to calm me, I ask you to offer the organization a round of applause, because it's usually offered at the end [claps] but I think they are working hard, so it's nice at the end, but it's nice to receive a round of applause in between. Thank you also to Codurance. I'd tell you a lot of things about Codurance. I'm working with them from more than a year and if I'd have to outline something, it would be the value of the trust, because the Pygmalion Effect is really true and, since I'm there, I'm doing a lot of things that I never imagined. I invite you to join us, because we're looking for people continuously, so, if you'd like to ask me, proceed! Thank you also to you, because I wrote a insufficiently detailed summary, talking about a trip for you and you dare come here, so thank you very much. 

### [Text on screen: ABOUT ME]

About me, I'm going to tell you 2 things only, they aren't about me, but they are a reflection that I would like to share with you and I made a few days ago with Mallorca Software Crafters Community. [nervous] Despite of being from 80s, I feel identified by 70s recently. Why? 

One of them is this punch card. This punch card is in my mother's cookbook since I was a child and I think it's one of the reasons why I'm here today and I have this profession. She programmed in Cobol, in punch cards, during the 70s. 

And the other thing is that I recommended some friends to read The Mythical Man-Month. They have a reading club. When they were reading the chapter 6, they told me: "It's very dense, very old and very boring" and I feed indebted to them, because they bought the book and I told them: "Don't worry, I'm going to read the book and to guide you". I read this book during 1998, 20 years ago. A teacher recommended us when I started the university degree and I enjoyed reading it again, because I've read it as a student and I've read it after 15 years of experience and I got a very different content and now I'm reading other articles by Dijkstra, some of them are new for me. 

Why is this a reflection? What has happened from 70s? Both things have disappeared. Women who programmed and also a lot of literature about problems which we still suffer today. That's my reflection and then we can talk about it. 

### [Text on screen: WHY]

Why this talk? Why open-minded? When Pablo proposed me to come here, I didn't know the subject of my talk. When glancing his Twitter account, I saw a tweet about killing Pull Requests and I thought: "Got it! I have the subject of my talk". 

Social media are full of subjects such as Pull Request, Branching, TDD and I find it difficult to understand the reason why we must have a strong view about them. So I thought: "I'm going to talk about it". 

### [Text on screen: COGNITIVE DISTORTIONS AND BIASES]

But, why? why? Why those strong views about those subjects? Because we suffer cognitive distortions and biases. If you attended Arturo Herrero's talk, he mentioned some of them. 

For example, Polarized Thinking or ‘Black and White’ Thinking when we don't see shades of gray, but we think about absolute terms, all or nothing. 

All of these cognitive distortions are thoughts that distortion the reality. 

Another one, overgeneralization. When we take a single issue and we generalize that is true for everything and the opposite. 

The filtering when we only take the negative details from a lot of aspects and we magnify them. 

And the confirmation bias, mentioned by Arturo, when we interpret the information in a way of confirming our beliefs. 

How many of you - I'm the first one - identify yourself with these thoughts? Yes, everyone suffer them. Don't worry, because I know the cure. The solution exists. How can you recover from them? Travelling is the answer. Travelling makes us to leave our world, we have a different point of view, we know other ways of making a living, it inspires us, we can get to be free of prejudices, ... So, I thought: "I'm going to take them to a trip". 

Furthermore, I'm going to give them some cards. I'd want you to take notes on them about things provided by the trip, - it will be an intense trip - and not only something in particular, any idea, but also a reflection after listening to me. I'll tell you the reason why those cards at the end. Do you all have a card? Ok, great! 

I've prepared this trip [pointing at a shape]. Maybe you know it if you like the nature as much as I do. It's near here. And, furthermore, we are going to start the trip with Pull Requests and towards there [pointing to the left]. I'm giving a clue. I'll reveal it at the end. 

### [Text on screen: PULL REQUESTS]

Starting with this controversial topic [Pull Requests]. I've seen something like this. It’s not a Pull Request. This is a chat. There is a piece of code with a comment and a huge amount of comments after and I think: "What's happening?". Why not speak to the other person in the moment of receiving a different point of view? 

I told a friend of mine that I made something like this and he told me: "You're crazy! A Pull Request on another Pull Request? We are trying to kill the Pull Requests technique and you made a Pull Request on another Pull Request?". "Keep calm, I'm going to explain you what happened".

Someone made a Pull Request. I don't know if some of you has questioned the name, because we are used to listening to it, but it's not called Pull Request in other tools such as GitLab, where it's called Merge Request. You are asking someone to pull your changes on the central repository. - I close the parentheses of the reflexion. - Someone made a Pull Request, I wrote a comment and I received a different point of view, another colleague disagree with my proposal. Then I made the following reflection: maybe I didn't explained it correctly, maybe my colleague has spent a lot of time with this piece of source code and now he thinks: "Are you going to give me another challenge?". Or maybe - it happens a lot of times - if you don't see it, you can believe it. And I thought: "It doesn't matter. I'm going to create another branch from his and I'll program my proposal on it". As soon as I made the Pull Request, I talked to him: "Look," - you can see the changes very easily with the tool - "this is what I was trying to explain". And then, the other colleague saw it and told: "ah, right, right, source code communicates much better now". He accepted it and that's all. 

So, some people are trying to kill them, I revive them and, furthermore, Pull Request on another Pull Request. Why? Because this is only a tool. Why have a rule to make Pull Requests or not to make Pull Requests? Why not have a tool and use it when it's necessary? 

And there are people who say: "I do Pair Programming and if I do Pair Programming, I don't need a Pull Request. It doesn't make sense". Mmmm, I don't know, maybe you did Pair Programming with someone and you'd like to have a second opinion from another person. Why not? Why not do a Pull Request if you made Pair Programming? 

Finally, a Pull Request is related with a code review and you'll receive feedback, so you must willing to receive it. 

### [Text on screen: BRANCHING]

Let's continue the trip. Another controversial topic: Branching. Maybe you know the trunk-based development. In this web [trunkbaseddevelopment.com], it's explained with a lot of details. You can commit into the main branch. Branches must be very short, a couple of days as a maximum. You can have release branches, although devs cannot commit into them. If there is a bug, it's solved on the main branch and then, a cherry-pick over release branch is done. "Many publications promote Trunk-Based Development as we describe it here". "Those include the best-selling Continuous Delivery and DevOps Handbook". "This should not even be controversial anymore!" It's clear this is the only possible strategy for the use of the repository. "The largest of development organizations, like Google (as mentioned) and Facebook practice it at scale". And they also mention "Martin Fowler". Shouldn't we question what Martin Fowler writes? I question it [laughs] I said that this was controversial. I want to break the rules, because we are a litte [gesture of closed]. 

Several things about this strategy. I talked to Edu Ferro this morning and he told me that he had to do some previous tasks to reach this strategy. If you want to have so small features - no more than a couple of days - you must have a good slicing. The product will have to be in a certain status.

You don't fix errors into release branches, but they are fixed here [pointing at trunk] and then they are moved to release branches with cherry-pick. Maybe this [pointing at trunk] has a lot of activity, it mutates and you cannot fix it in an isolated way to move it to a release branch afterwards. It's done in this way, because you can forget it if you fix it in a release branch. 

And maybe there are a lot of commits and one of them doesn't break the build step here [pointing at trunk] but then, there are 2 commits which break the build step and furthermore they break it very fast, so you receive: error, error and ok. And you think: "There was an error, but it's already fixed". In other words, it's not free of problems. You must make decisions about it. 

I read a book based on a lot of articles [pointing at several references]. This subject is being studied since 1985. I read this book [pointing at "Software Configuration Management Patterns" book]. A project manager recommended me a few years ago and it's about configuration management patterns and the author explains how he realized that this profession is not only about design and programming skills, but it's also necessary to have configuration management skills. As it was a problem in all companies, he decided to write this book. It's an inspiring book, because it has a lot of ideas to manage the repository. That's the reason why I find it difficult to have only one strategy and to focus only on that strategy. One of the sentences you can find in the book: "Your configuration management changes depending on the types of systems that you are building, the size of the teams, the environment". 

When I finished the book, I thought: "does the best strategy exist?". I got 2 ideas from the book. The first one: if you want to succeed with your strategy, adapt it to your current context. And then, make your team to know the current strategy in every moment, in order to avoid having communication problems. That's enough. I would add another thing: if you want the best strategy, try to have a fast feedback from it. 

### [Text on screen: OOP vs. FP]

Let's continue the trip. Another controversial topic: object-oriented programming and functional programming. This wall exists in some place between them. I used this width, but maybe it's bigger. There are people from that paradigm [pointing at OOP] who don't want to know anything about functional programming. 

I'd question if those people from object-oriented programming are really doing object-oriented programming, because unfortunately you can program in Java, for example, without following the object-oriented paradigm. I've seen a lot of Java source code that isn't following that paradigm. 

Furthermore, some people from object-oriented paradigm think: "I don’t attend Functional Programming Conferences, because I still don’t know anything about it". No! Attend events! Lambda World will take place in October, Raul is here if you want to ask for it. It's the best way. You don't know anything, so you attend an event and you will be exposed to that knowledge. You must be willing not to understand everything during the talks, but you'll be more familiar with some concepts and that helped you to deepen afterwards more and more. So, go for it, why not? 

In some places, that wall has been reduced a little bit. And they think: "Functional programming, pure functions with the same outputs for the same inputs without changing the external world is good". "Immutability, avoiding surprises with unexpected changes, because objects have mutated". "And isolating the parts of our source code that alter the external world can be useful in the design". 

Some of them have broken down the wall and they start experimenting with another type of functions that work in another abstraction level and they realize that they don't need to specify details for common operations. 

I recommend you the talk by Richard Warbuton: "Twins: functional programming and object-oriented programming". He says: "The future is hybrid: pick the best features and ideas from both approaches in order to solve the problem at hand". There is both a talk and a book with this brotherhood between paradigms. 

### [Text on screen: DOCUMENTATION]

Let's continue the trip. The documentation. Another controversial topic. Why? Because there is a manifesto for agile software development with this sentence: "Working software over comprehensive documentation". Although we forget what appears up and down: value this one more [pointing at left], over this one [pointing at right], there is also value here. So, what happens? 

Code comments. Some teams are agile so they don't write code comments, never. I saw a tweet about code comments with several clear examples about code comments which don't contain relevant information. Or obsolete code comments. My thought about it is the following. If you have a code comment which answers to WHAT or HOW is a bad smell. Why? Because if you have a code comment which answers to WHAT, you don't have a good naming in your source code. And if it answers to HOW, you needed a comment, because source code doesn't communicate what's doing. And WHY? WHY is absolutely circumstantial. It's something only known by you in the moment of making a decision and it can be very useful when another person read your code after a week or a month. 

It also affects project management. Of course, we are agile, so we have closed issues in this way, without comments. I think it's useful to have some comments. For example, I usually write comments in the issues. If I take a break, I write the current status, the last reflection, the last conversation about it and it helps me a lot, because I have that information when coming back, or for the following day or Monday. Furthermore, while I'm writing the comment, I'm reflecting about the decisions. In the same way, I prefer an issue with a pair of comments rather than an email. We are agile, so we receive a request by email and we don't create a task. We solve it directly by email. Another reflection. If your issue grows with a lot of comments is a bad smell: "we didn't do a right slicing" or "this task is problematic". Or maybe it's useful to say: "Let's see. Let's do a small retrospective about it", "What has happened here?", "Let's make a decision about it". Documentation is not a bad thing. 

And it also affect to boards. There are offices full of post-its, all the walls are conquered by post-its and there isn't a different thing. And then I think: "ok, what are they doing here?, what are the processes?, what's the infrastructure?". It can be useful to have posters about processes, about what you do. That gives you an identity about you are doing. And it can be also useful to have discussions, because, do you know how to think on a post-it? I don't. I cannot make decisions on post-its. I need to see some drawing to make a decision. Then, documentation can be useful. 

### [Text on screen: TDD]

Another controversial topic is TDD. I found this question in Quora: "What is so wrong with TDD?". When you read the text, you realized about its intention: "I hate TDD, because the after-hours time of spending time in office, fixing bugs that keep propping every now and then is now gone", or "the opportunity to intelligent code rather than readable/maintainable code is largely reduced". 

Then, I found another questions: "Am I a bad programmer if I can't always do TDD?", "Do you always do TDD?". And I thought: "What's happening?". TDD is a practice. A practice that you need to practice it in order to know it. There are several types of TDD. As with Pull Requests, it's a tool that you might know. 

I'm only going to tell one thing about TDD, only a detail, but a lot of people told me: "Now I understand it, because it happens to me". Who of you, here [pointing at GREEN], when making the test pass, had thought for a few minutes about a variable name or method name? Don't do it, because we only must make the test pass. The minimum necessary to pass. We can break all the design principles. I listened a person doing pair programming: "I don't find a variable name now, can I write var1 and we decide a name afterwards?". Of course! You have the refactor step to make it right! Dikjstra talked about humility in several articles. We are not able to make it work and to make it right at the same time. So, let's focus on making it work and then we'll make it right, because we have a safety net to do it. 

And don't stop questioning that practice, how we are making it. Before joining Codurance, I thought that I knew to do TDD and then I notice that I didn't know it.. The more I practice, the more nuances I discover. Don't stop questioning the practice and deepen more and more. 

### [Text on screen: PAIR PROGRAMMING]

Another controversial topic is pair programming. Pair programming, what's the reason why it's controversial? Because, the common question is: "all the time?". In other words, do you do pair programming or not? Are two people together all the time or not? Why? Why not it's a practice and we use it when it's necessary? 

If we practice Pair Programming correctly, we get tired. I mean, you must make a pause from time to time or having a Pomodoro, because, first of all, the driver is thinking aloud all the time. You have to reach agreements all the time and that makes you tired. So, why not a dance with your colleague? Now together, now individually, now together again, ... Why we must be so radical with yes or no? 

And sometimes we don't need to do pair programming, we only need a duck. A duck, a colleague who listens to you. While you are talking about what's happening, that makes you to stop thinking about the solution, because you are very focused on the solution and absolutely blocked and that makes you jump and you start talking in terms of the problem. When you are talking in terms of the problem, you forget the solution and you say: "oh, I got it!" And your colleague didn't say anything, only listened to you, helped you to take distance from the solution, to think in terms of the problem and to know what was happening. 

### [Text on screen: BOOKS]

Books, another controversial topic. I have friends with a serious problem with books: buff, another book, another book, taking a note and another and another and another... They have a checklist and as they read a book, they make a check. Although it shouldn't be a check and no more. Keyvan is here. As he finishes a book, he writes a list... - don't hide [laughs] - a list of notes. While he's writing, he's getting benefit from the reading. If he only read the book and make a check, he wouldn't get anything more. Write a blog, talk about it, discuss in a book club, ... Do something more than reading it. It's not about reading and say "I've read all these books". Do they provided you something? Try to get more benefit from them. 

Furthermore, there are certain books with which it's good to make a pause. If we don't rest and make a pause, we don't have a moment to think about it, reflect about it, we don't internalize knowledge. 

There are also books that we are not ready for their content, so, if you start a book and it's difficult for you in that moment, close it and you can come back to it in another moment, don't worry, relax. 

And another thing I do and a lot of friends criticize it: "There are a huge amount of books to read and you are rereading a book, are you sure about it?". Yes, some rereadings are providing me a lot. Why not reread books? 

And another thing I like. I like to read all the pages of a book. All of those sections we skip to go to chapter 1. I read all of those sections. There are some treasures in those sections that explain the reason why the book exists. Don't miss that part. That's my reflection. 

### [Text on screen: ARCHITECTURE]

Now, the last stage of the trip [architecture]. Do you already know what's this? [pointing at a shape] More or less, because we go towards right [left to the attendees], we are in the North of Spain... It's one of the northern routes of Way of Saint James. That's the reason why I talked about the Way of Saint James during the lunchtime, because I was thinking about this. It's the shape from Irun to San Sebastian. 

For the subject of architecture. Life is very serious and I've made a funny thing in this stage. I'm going to show you a private thing of my flat in Barcelona. I know Autentia is recording this talk and other people will watch it. It's the drawer for my socks. I don't know if you notice that, ok, maybe I organized the drawer a little bit for the photo [laughs] although I have them aligned in this way. Maybe some of them is not fitted properly, although I'm very organized. What I'm trying to tell with it is that I'm not using anything to keep socks aligned. I'm not using one of these organizers for socks. What's the reflection? Beyond architectures, design patterns, design principles, ... it’s a question on being professionals and taking care of what we do. And not only the source code. 

### [Text on screen: TO CONCLUDE]

To conclude, what's the reason why the cards? I think you were a little shocked with these things that you didn't take a note on cards. The idea of card game comes from a job interview. They asked me about my silver bullets and I made a reflection about our profession, because it's like a card game for me. Every time I read a book, attend a talk, participate in a project, ... I get a new card. If I know another practice, I get another card. But I don't discard any card. I play with the cards. They are always with me. The more cards I have, the better move I'll play. And it's difficult to have a wild card that is useful for all the projects. "This card worked, so I'm going to use it for all the projects". No, play, play with the cards that you have. 

One of my favourite books is The Pragmatic Programmer and I have two sentences here: "You shouldn't be wedded to any particular technology, but have a broad enough background and experience base to allow you to choose good solutions in particular situations". The circumstance again. "We don't pretend to have all (or even most) of the answers". Then, is this good or bad? We won't always have the answers. "Nor are all of our ideas applicable in all situations". 

Have a questioning attitude. 

And continue travelling and choosing good travel companions.

Thank you very much [claps] Thank you very much, thank you very much. 

I hope you like the trip. Now I would like you not only to ask me questions, but also to give me feedback, because I reviewed a lot of subjects. So, tell me, what do you think about them? Not only questions. 

[questions and feedback time]

END OF TRANSCRIPT
