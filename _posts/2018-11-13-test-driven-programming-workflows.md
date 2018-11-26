---
layout: post
asset-type: post
title: Test-driven programming workflows
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

## The comparison

The last version of the diagram includes a comparison between:

* Test-driven development (TDD) without constraints
* Using `test && commit || revert` (TCR)
* Using 'Taking Baby Steps' by Adrian Bolboaca

<a href="/img/cards/posts/test-driven-programming-workflows/workflows.png">You can find the last version of the test-driven programming workflows here</a>.

Or <a href="https://raw.githubusercontent.com/rachelcarmena/tips/master/tdd/programming-workflows.svg">you can download the diagram as a SVG file</a>.

And I recorded this short video to explain the diagram, because it's invisible for some people with disabilities:

<center>
<iframe width="100%" height="315" src="https://www.youtube.com/embed/uHyHZzyhxAs" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>

The video doesn't have one detail between writing the test code and writing just enough code to pass the test, which is included in the last version of the diagram. With TDD without constraints and Taking Baby Steps constraint, the following check is done after writing the test code:

- Result of running tests? 
    - RED: Go to the next step, writing just enough code to pass the test
    - GREEN: Rethink the test

However, the result of running tests is not checked with TCR, between writing the test code and writing just enough code to pass the test.

## Acknowledgments

Thanks **Software Crafters Community** for all the received feedback: <a href="https://twitter.com/DaveSchinkel" target="_blank">Dave Schinkel</a>, <a href="https://twitter.com/fran_reyes" target="_blank">Fran Reyes</a>, <a href="https://twitter.com/sanlaville" target="_blank">Rémy Sanlaville</a>, ...
