---
layout: post
asset-type: post
title: The usefulness of small 'crazy' ideas
description: Creative experiences
date: 2019-07-25 12:00:00 +00:00
category: [experiences,coding]
image:
    src: /img/cards/posts/small-crazy-ideas/cover.jpg
---

## Space invader

It wasn't the first time I met someone who was worried about GitHub contributions panel.

A friend of mine was too much worried about it. Too much...

And my words weren't useful.

I needed to come up with something to make an impact on him.

So I programmed [a small script to create a space invader in an empty year](https://github.com/rachelcarmena/space-invader/blob/master/scripts/create-space-invader.sh) or whatever he liked.

For example, I have a space invader in 2016:

![](https://github.com/rachelcarmena/space-invader/raw/master/img/space-invader-in-2016.png)

See the full script and all the details in [Space Invader GitHub repository](https://github.com/rachelcarmena/space-invader).

**Result**: It worked! It made him reflect.

<div class="note">
<strong>Note</strong>: When sharing it in Twitter, someone mentioned this project: <a href="https://github.com/gelstudios/gitfiti">gitfiti</a>. I didn't know it though I understand my idea wasn't unique. The goal is very similar although the way to get it is different and it's based on <code>GIT_COMMITTER_DATE</code> to change the date. 
</div>

## Saying goodbye to an awesome colleague

A colleague was going to leave the company.

He was a very important colleague for all of us.

I created a Slack channel as a tribute to write all the things we had learnt from him.

That Slack channel was very beautiful and I wanted him to have it forever.

So I programmed this [small tool to create a PDF from a Slack channel](https://github.com/rachelcarmena/small-tools/tree/master/SlackChannel2PDF) based on Slack API and Latex.

**Result**: He loved the idea.

## Simulating user actions from the Web Console

I was helping as an event organizer and it was necessary to schedule tens of tweets.

I was added to Tweetdeck and I thought that I could simulate the user actions to schedule all the tweets after being logged in.

I opened the Web Console and I created this function to schedule a tweet at 10:30 by default:

```javascript
function scheduleTweet(message, day, goToNextMonth) {
  $(".tweet-button").click();

  $(".js-compose-text").value = message;
  $(".js-compose-text").dispatchEvent(new InputEvent("change"));

  $(".js-schedule-button").click();
  $("#amPm").click();  // depends on the current time (default value)
  $("#scheduled-hour").value = 10;
  $("#scheduled-minute").value = 30;
  if (goToNextMonth) {
    $("#next-month").click();
  }
  $("a[href='#".concat(day).concat("']:not(.caldisabled):not(.caloff)")).click();

  $(".js-send-button").click();
}
```

And then I only had to program a script to get a list as follows:

```javascript
setTimeout(scheduleTweet, 3000, '...', 30, 0);
setTimeout(scheduleTweet, 6000, '...', 31, 0);
setTimeout(scheduleTweet, 9000, '...', 1, 1);
setTimeout(scheduleTweet, 12000, '...', 2, 0);
setTimeout(scheduleTweet, 15000, '...', 3, 0);
setTimeout(scheduleTweet, 18000, '...', 4, 0);
setTimeout(scheduleTweet, 21000, '...', 5, 0);
setTimeout(scheduleTweet, 24000, '...', 6, 0);
setTimeout(scheduleTweet, 27000, '...', 7, 0);
setTimeout(scheduleTweet, 30000, '...', 8, 0);
setTimeout(scheduleTweet, 33000, '...', 9, 0);
setTimeout(scheduleTweet, 36000, '...', 10, 0);
...
```

I wrote that list in the Web Console and after 3 seconds I saw how all the tweets were scheduled in the same way I was doing that work with the web interface (maybe it wasn't necessary to wait for 3 seconds between them).

**Result**: I had all the tweets scheduled after a couple of minutes.

## Beyond post-it notes

I was going to join another team in a client as a software craftsperson (a mix between a developer and a technical coach).

It was a special situation and I wished to have a good start.

I organized a meeting a few days before joining as a first contact to meet each other.

I wanted to know their concerns and wanted them to have an idea of all the things that we could get together.

I tried to come up with something different to the use of post-it notes in order to have a pleasant meeting and to promote the participation.

Why not to write the questions and the list of things I wanted to talk about in a long paper roll?

Oh no, that's a crazy idea!

Why not?

I didn't have time to buy a paper roll so I made it from five Din A4 sheets of paper.

I cut each sheet of paper in three pieces and I joined them with a little of adhesive transparent tape.

![Making of](/img/cards/posts/small-crazy-ideas/making-of.png)

My thoughts again. Oh no, that's a crazy idea!

Why not?

I wrote all the things in the new paper roll, leaving room to take notes.

I was ready for the meeting.

![Roll](/img/cards/posts/small-crazy-ideas/roll.png)

And the time of the meeting arrived.

I unrolled the paper. 

More than four meters of paper.

Surprised looks.

![Unrolling during the meeting](/img/cards/posts/small-crazy-ideas/meeting-agenda.png)

As we progressed on every issue, I cut the corresponding piece of paper.

![Roll after the meeting](/img/cards/posts/small-crazy-ideas/after-the-meeting.png)

And I placed it in one of the two stacks of paper: done or to review (with additional notes).

The paper roll was more and more short.

**Result**: There was an agreeable atmosphere during the meeting and I got a lot of information about the team and their concerns.

<div class="note">
<strong>Corollary</strong>: It's said that sometimes we create things from our memories. My maternal grandfather stored things from his old tailoring. A lot of paper rolls for the purchase receipts, among others. I played with those rolls a lot of times when I was a child.
</div>
