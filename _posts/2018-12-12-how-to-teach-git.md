---
layout: post
asset-type: post
title: How to teach Git
description: An alternative way to teach Git
image:
   src: /img/cards/posts/how-to-teach-Git/cover.jpg
---

## The problem I found

Some of my professional experiences have involved participating in cross-functional areas, so I knew all my colleagues' way of working. I remember a company which just started using Git a few weeks before I joined.

I found post-its on screens with 3 steps: first `add`, second `commit`, third `push`. 

<center>
<img src="/img/cards/posts/how-to-teach-Git/post-it.png" alt="">
</center>

They didn't know the reason why those steps. They only knew that they should follow them in order not to get into trouble. However, problems happened frequently, so I decided to prepare a workshop about Git.

## The idea

I love to have maps in my mind. I don't write "mind maps", because they are a well-known type of diagrams. Now I'm talking about having frames, structures or any kind of graphical representation in the mind. For example, I start learning addition by imagining dice in my mind.

So I prepared some drawings. It's not necessary to be able to see the drawings to understand this post. I include an explanation for each of them, because of my awareness with accessibility.

Furthermore, in this case, it's very important to teach the vocabulary. Otherwise they won't understand the messages from Git. The drawings are a good way to introduce them that vocabulary.

## A distributed version control system

<center>
<img src="/img/cards/posts/how-to-teach-Git/general-drawing.png" alt="">
</center>

The general drawing contains 4 areas distributed as follows:
* The development environment with:
    * Working directory
    * Staging area or index
    * Local repository
* A server with:
    * Remote repository

At that time, you can explain the benefits of a distributed version control system.

## Cloning a repository

<center>
<img src="https://raw.githubusercontent.com/rachelcarmena/how-to-teach/master/git/clone.png" alt="">
</center>

When cloning a repository, the data from the remote repository travel to 2 areas:
* Working directory
* Local repository

## Making changes in the working directory

<center>
<img src="https://raw.githubusercontent.com/rachelcarmena/how-to-teach/master/git/tracked-untracked.png" alt="">
</center>

There are 2 types of files in the working directory:

* **Tracked**: files that Git knows about.
* **Untracked**: files that have still not been added, so Git doesn't know about.

## Updating the remote repository

<center>
<img src="https://raw.githubusercontent.com/rachelcarmena/how-to-teach/master/git/add-commit-push.png" alt="">
</center>

As changes are ready in the **working directory**, they must be added in the **staging area**. 

When there is a set of changes with a single purpose in the **staging area**, it's the time to create a commit with a message about that purpose in the **local repository**.

When there are one or several commits in the **local repository** ready to be shared with the rest of the world, they must be pushed to the **remote repository**.

At that time, you can talk about the different states of a file in the development environment: **modified**, **staged** and **committed**.

<center>
<img src="https://raw.githubusercontent.com/rachelcarmena/how-to-teach/master/git/states.png" alt="">
</center>

Furthermore, you can explain:
* how to show the changes of a file in the **working directory**: `git diff`
* how to show the changes of a file in the **staging area**: `git diff --staged`
* how a file can be changed in the **working directory** after being added to the **staging area**
* etc.

## Updating the development environment

### Fetching

<center>
<img src="https://raw.githubusercontent.com/rachelcarmena/how-to-teach/master/git/fetch.png" alt="">
</center>

When executing `git fetch`, the data from **remote repository** only travel to the **local repository**.

### Pulling

<center>
<img src="https://raw.githubusercontent.com/rachelcarmena/how-to-teach/master/git/pull.png" alt="">
</center>

When executing `git pull`, the data from **remote repository** travel to 2 areas:
* To **local repository**: `fetch`
* To **working directory**: `merge`

If you take care the commit history, consider the use of `git pull --rebase`. 
Instead of `fetch + merge`, it consists of `fetch + rebase`. 
Your local commits will be replayed and you won't see the known _diamond shape_ in commit history. 

<center>
<img src="https://raw.githubusercontent.com/rachelcarmena/how-to-teach/master/git/pull-rebase.png" alt="">
</center>

## Next steps

You can add another area in the development environment to explain stashing: **dirty working directory**.

If people internalize these concepts, it will be easier for you to go a step further with branches, commit history, rebasing, etc. because you will have built a solid basis.

## Friendly reminder 

I've worked with other version control systems (Visual SourceSafe, TFS and Subversion) and, in my humble experience, a lack of knowledge can be harmful with both an old tool and a new one. Don't only focus on choosing a tool, but also on mastering it.
