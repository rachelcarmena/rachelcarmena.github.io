---
layout: post
asset-type: post
title: Test-driven programming workflows
description: TDD, TCR, Taking Baby Steps, ...
date: 2018-11-13 12:00:00 +00:00
updated: 2019-04-02 20:30:00 +00:00
image:
   src: /img/cards/posts/test-driven-programming-workflows/cover.jpg
---

Once upon a time ...

> Have you seen the last idea by Kent Beck?

> Do you understand it? 

> TCR? Must we stop doing TDD?

Those are the questions that a friend of mine asked me in a restaurant. 

I find it difficult to explain certain things without a drawing and, in this case, the last idea by Kent Beck was a new thing for me as well. 

So, I started drawing on the paper tablecloth. 

> Oh! Wait! It reminds me Taking Baby Steps by Adrian Bolboaca

After a few minutes:

> We are used to seeing the TDD diagram with the 3 steps (RED, GREEN and REFACTOR), but different things can happen between those steps

> I think it would be a good idea to have these workflows in a digital format

A few days later:

> Oh! We read too quickly. TCR was formulated by [Oddmund Strømme](https://twitter.com/jraregris), Ole Tjensvoll Johannessen and [Lars Barlindhaug](https://twitter.com/barlindh) during a code camp with Kent Beck

> It comes from the idea of "test && commit" by Kent Beck

## The goal

The goal is to see the differences between test-driven programming workflows clearly:

* Test-driven development (TDD) by **Kent Beck**
* Using constraints to force yourself to do small steps:
    * [Test && commit \|\| revert (TCR)](https://medium.com/@barlindhaug/how-to-test-commit-revert-e850cd6e2520) by **Oddmund Strømme**, **Ole Tjensvoll Johannessen** and **Lars Barlindhaug**
    * [Taking Baby Steps](http://blog.adrianbolboaca.ro/2013/03/taking-baby-steps) by **Adrian Bolboaca**

Recently I added 3 further workflows. They come from the idea of TCR, but trying not to miss the RED step:

* [RED \|\| revert, GREEN \|\| revert, REFACTOR (also GREEN \|\| revert)](https://github.com/FaustXVI/demo-tcr/blob/master/tcrdd.sh) by **Xavier Detant**
* TDD with TCR constraint and test fails first by **Dave Schinkel**
* [(Test && Commit) \|\| TestCodeOnly \|\| Revert](https://jeffgrigg.wordpress.com/2018/11/23/test-driven-development-with-test-commit-testcodeonly-revert) by **Jeff Grigg**

A new variant:

* [test && commit \|\| revert ; pending](https://blog.oddmundo.com/2019/01/27/test-commit-revert-pending.html) by **Oddmund Strømme**

## The result

The diagrams to see the differences between them:
* [Test-driven programming workflows (PNG)](/img/cards/posts/test-driven-programming-workflows/workflows.png)
* [Test-driven programming workflows (SVG)](https://raw.githubusercontent.com/rachelcarmena/tips/master/tdd/programming-workflows.svg)
* [Test-driven programming workflows with TCR variants (PNG)](/img/cards/posts/test-driven-programming-workflows/workflows-with-TCR-variants.png)
* [Test-driven programming workflows with TCR variants (SVG)](https://raw.githubusercontent.com/rachelcarmena/tips/master/tdd/programming-workflows-with-TCR-variants.svg)

And I recorded this short video to explain the diagram, because it's invisible for some people with disabilities:

<center>
<iframe title="Test-driven programming workflows" width="100%" height="315" src="https://www.youtube.com/embed/uHyHZzyhxAs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

The video doesn't have one detail between writing the test code and writing just enough code to pass the test, which is included in the last version of the diagram. With TDD without constraints and Taking Baby Steps constraint, we check the result of running tests after writing the test code:

- RED: go to the next step, writing just enough code to pass the test
- GREEN: rethink the test

However, the result of running tests is not checked with TCR, between writing the test code and writing just enough code to pass the test.

## Other things

### About missing the RED step with TCR

When Kent Beck shared this [video about an example of TCR](https://www.youtube.com/watch?v=ZrHBVTCbcE0), **Danil Suits** pointed out his way of doing the RED step at Software Crafters Slack: 

* Inverting the conditional when introducing the broken test
* Proving that the old implementation _doesn't_ pass the test

In this way, as **Danil Suits** said, "if you are wrong about the current implementation failing your new test, the test gets thrown out".

Maybe we are not missing the RED step, because we have a way of knowing that our new test is right: **if a new test is GREEN it's as bad as if the negation of the new test is RED**. 

I would like to practice this idea in order to check if it can be widely applied. Meanwhile, here the diagrams with this idea:

* [Test-driven programming workflows (PNG)](/img/cards/posts/test-driven-programming-workflows/workflows-with-an-idea-for-TCR.png)
* [Test-driven programming workflows (SVG)](https://raw.githubusercontent.com/rachelcarmena/tips/master/tdd/programming-workflows-with-an-idea-for-TCR.svg)

### My proposal of TCR variant

Besides the concern with the RED step, I would like not to miss the feedback between:

* RED: changes are reverted
* Starting again
    * GREEN: now it works, but I don't know the difference with previous step
    * or RED: it doesn't still work, I see the result of tests before reverting, but I don't know the difference with previous step

So, I'd prefer:

```
test && commit || stash
```

because `stash` implies a final `git reset --hard` as well (code will have to be written again), but we keep the feedback. 

What would be the implementation of `commit` and `stash` steps to get that feedback?

#### commit step

```
#!/bin/sh

if [ -z "$(git stash list)" ]; then
    echo "*** NO PREVIOUS STASHED SOURCE CODE ***"
else
    echo "*** DIFF WITH PREVIOUS STASHED SOURCE CODE ***"
    git stash show
    echo "*** END OF DIFF ***"
    git stash clear
fi
git add .
git commit -m "Message doesn't matter here"
```

Message doesn't matter in that step, because commits will be squashed with the right message before pushing.

#### stash step

```
#!/bin/sh

if [ -z "$(git stash list)" ]; then 
    echo "*** NO PREVIOUS STASHED SOURCE CODE ***"
    git stash
else
    echo "*** DIFF WITH PREVIOUS STASHED SOURCE CODE ***"
    git stash show
    echo "*** END OF DIFF ***"
    git stash clear
    git stash
fi
```

## Further knowledge

* [First article about TCR by Kent Beck](https://medium.com/@kentbeck_7670/test-commit-revert-870bbd756864)
* [The Hanselminutes podcast by Scott Hanselman: test and commit or revert with Kent Beck](https://hanselminutes.com/663/test-commit-revert-with-kent-beck)
* [Using TCR to solve Mars Rover Kata by Jordi Marti](https://medium.com/@itortv/i-implemented-the-mars-rover-kata-through-tcr-test-commit-revert-and-these-are-my-7e11c40983a6)
* [Post with a lot of TCR Variants by Thomas Deniffel](https://medium.com/@tdeniffel/tcr-variants-test-commit-revert-bf6bd84b17d3)
* [Reddit-community for TCR](https://www.reddit.com/r/tcrProgramming/)
* [Answers to questions shared by Thomas Deniffel](https://medium.com/@raquel.moreno.carmena/here-im-as-i-promised-after-your-call-in-twitter-b6a8c435eb25)

## Other resources

* [TCR-cli by Jordi Marti](https://github.com/jmarti-theinit/tcr-cli)
* [Workshop (scripts, slides) by Isidro López and Joe Bew](https://github.com/islomar/tcr-workshop)

## Acknowledgments

Thanks **Software Crafters Community** for all the received feedback.

Special thanks to [Dave Schinkel](https://twitter.com/DaveSchinkel), [Fran Reyes](https://twitter.com/fran_reyes), [Rémy Sanlaville](https://twitter.com/sanlaville), [Xavier Detant](https://twitter.com/XDetant), [Jeff Grigg](http://wiki.c2.com/?JeffGrigg) and [Danil Suits](https://twitter.com/VocumSineratio).

