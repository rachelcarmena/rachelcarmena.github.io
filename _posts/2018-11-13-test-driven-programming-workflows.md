---
layout: post
asset-type: post
title: Test-driven programming workflows
description: TDD, TCR, Taking Baby Steps, ...
image:
   src: /img/cards/posts/test-driven-programming-workflows/cover.jpg
---

## Once upon a time ...

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

## The goal

The goal is to see the differences between test-driven programming workflows clearly:

* Test-driven development (TDD) by Kent Beck
* Using constraints to force yourself to do small steps:
    * <a href="https://medium.com/@kentbeck_7670/test-commit-revert-870bbd756864" target="_blank">test && commit || revert (TCR)</a> by Kent Beck
    * <a href="http://blog.adrianbolboaca.ro/2013/03/taking-baby-steps" target="_blank">Taking Baby Steps</a> by Adrian Bolboaca

Recently I added 3 further workflows. They come from the idea of TCR, but trying not to miss the red step:

* <a href="https://github.com/FaustXVI/demo-tcr/blob/master/tcrdd.sh" target="_blank">RED or revert, GREEN or revert, REFACTOR (also green or revert)</a> by Xavier Detant
* TDD with TCR constraint and test fails first by <a href="https://twitter.com/DaveSchinkel" target="_blank">Dave Schinkel</a>
* <a href="https://jeffgrigg.wordpress.com/2018/11/23/test-driven-development-with-test-commit-testcodeonly-revert" target="_blank">(Test && Commit) || TestCodeOnly || Revert</a> by Jeff Grigg

## The result

The diagrams to see the differences between them:
* <a href="/img/cards/posts/test-driven-programming-workflows/workflows.png">Test-driven programming workflows (PNG)</a>
* <a href="https://raw.githubusercontent.com/rachelcarmena/tips/master/tdd/programming-workflows.svg">Test-driven programming workflows (SVG)</a>
* <a href="/img/cards/posts/test-driven-programming-workflows/workflows-with-TCR-variants.png">Test-driven programming workflows with TCR variants (PNG)</a>
* <a href="https://raw.githubusercontent.com/rachelcarmena/tips/master/tdd/programming-workflows-with-TCR-variants.svg">Test-driven programming workflows with TCR variants (SVG)</a>

And I recorded this short video to explain the diagram, because it's invisible for some people with disabilities:

<center>
<iframe title="Test-driven programming workflows" width="100%" height="315" src="https://www.youtube.com/embed/uHyHZzyhxAs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

The video doesn't have one detail between writing the test code and writing just enough code to pass the test, which is included in the last version of the diagram. With TDD without constraints and Taking Baby Steps constraint, we check the result of running tests after writing the test code:

- RED: go to the next step, writing just enough code to pass the test
- GREEN: rethink the test

However, the result of running tests is not checked with TCR, between writing the test code and writing just enough code to pass the test.

## Further reading
<a href="https://twitter.com/deniffel">Thomas Deniffel</a> wrote an awesome <a href="https://medium.com/@tdeniffel/tcr-variants-test-commit-revert-bf6bd84b17d3" target="_blank">post with a lot of TCR Variants</a>.

## Acknowledgments

Thanks **Software Crafters Community** for all the received feedback. Special thanks to <a href="https://twitter.com/DaveSchinkel" target="_blank">Dave Schinkel</a>, <a href="https://twitter.com/fran_reyes" target="_blank">Fran Reyes</a>, <a href="https://twitter.com/sanlaville" target="_blank">Rémy Sanlaville</a>, <a href="https://twitter.com/XDetant" target="_blank">Xavier Detant</a> and <a href="http://wiki.c2.com/?JeffGrigg" target="_blank">Jeff Grigg</a>.
