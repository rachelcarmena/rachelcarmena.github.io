---
layout: post
asset-type: post
title: '99% code coverage'
description: 'Do we have a good safety net to change this legacy code?'
image:
  src: /img/cards/posts/mutation-testing/cover.jpg
  thumbnail: /img/cards/posts/mutation-testing/thumb.cover.jpg
---

## Do we have a good safety net to change this legacy code?

A long time ago, I met a development team which was working under big pressure by the quality team. Personally, I don’t like this kind of differences between development and quality teams, because it leads to development teams not feeling responsible for quality and to a confrontational relationship. They should be working collaboratively towards a unified goal of delivering a quality product.

One of the requirements was to have more than 85% of code coverage to ensure code quality. The result was perverse: development team wrote tests without assertions; they only invoked methods with different arguments to reach the desired percentage. It’s clear that they didn’t follow TDD.

Code coverage only gives us information about the percentage of code lines which are executed during tests. 

Let’s see a way to verify that our current tests provide us with a safety net when we make changes to production code.

If we change the production code (for example, replacing `<` with `>=`, swapping `+` with `-` or returning a different value in a given method) test battery should detect that change. In order words, tests should fail.

There are tools to make changes in production code automatically and to run tests in order to check if those changes are detected. It is usually referred to as follow:

* **Mutators**: changes to be applied
* **Mutations**: new versions of production code after applying mutators
* **Mutations are killed**: tests fail; mutators are detected
* **Mutations survive**: tests don’t fail; mutators aren't detected

So, we should aim at killing every mutation with tests. 

When I heard about it, I thought about that game I played when I was just a teenager: _Super Pang_.

<center>
<img src="/img/cards/posts/mutation-testing/super-pang-game.jpg" alt="">
</center>

And I imagined the following situation: balls are mutations of our production code and the child tries to break those balls with tests rays. Tests must be good enough to detect the balls and to break them.

<center>
<img src="/img/cards/posts/mutation-testing//super-pang-mutation-testing.jpg" alt="">
</center>

It’s called **mutation testing** and it's a good way to make sure that you have a good safety net with your current tests to refactor production code or to add new features. It is as if you test your tests in order to get more information about their suitability.

Let’s see some examples with <a href="http://pitest.org" target="_blank">PIT</a> and a simple <a href="https://github.com/rachelcarmena/problematic-code" target="_blank">Java project</a> with problematic code.

## Example: boundaries

A boundary value could be forgotten when writing tests (even following TDD). For example, this piece of production code:

```
status arg3 = ((from.getParam1() < from.getParam2())? BLACK: WHITE);
```

If we don’t have a test which considers the same value for `param1` and `param2`, a mutation will survive when applying <a href="http://pitest.org/quickstart/mutators/#CONDITIONALS_BOUNDARY" target="_blank">_Conditional Boundary Mutator_</a>:

<script src="https://gist.github.com/rachelcarmena/99b8ee9125859ae9730b1ad2e9519152.js?file=alive-mutation.log"></script>

PIT report shows the affected line.

<center>
<img src="/img/cards/posts/mutation-testing/pit-report-boundaries.jpg" alt="">
</center>

When adding a test which considers the same value for `param1` and `param2`, the previous mutation will be killed:

<script src="https://gist.github.com/rachelcarmena/99b8ee9125859ae9730b1ad2e9519152.js?file=killed-mutation.log"></script>

## Example: equals and hashCode methods

I try to avoid having logic in _production_ code which is only used from _test_ code.

It’s common to find `equals` and `hashCode` methods in Java which are only used in _verifications_ or _assertions_. It’s easy to generate the code of these methods automatically with an IDE such as _IntelliJ IDEA_, but at the same time, it’s easy to have outdated code if we don’t remember to regenerate them when changing the involved class (or we don’t receive an alert about this fact).

For example, a property is added to a class without updating `equals` and `hashCode` methods, so PIT statistics results in:

<script src="https://gist.github.com/rachelcarmena/99b8ee9125859ae9730b1ad2e9519152.js?file=bad-statistics.log"></script>

And PIT report alerts on `equals` and `hashCode` methods.

If these methods are only used from test code, we can replace them with <a href="https://commons.apache.org/proper/commons-lang/apidocs/org/apache/commons/lang3/builder/EqualsBuilder.html#reflectionEquals-java.lang.Object-java.lang.Object-boolean-" target="_blank">`EqualsBuilder.reflectionEquals`</a> from _Apache Commons Lang_:

```
assertTrue(reflectionEquals(actualObject, expectedObject));
```

In that case, we can succeed in killing every mutation:

<script src="https://gist.github.com/rachelcarmena/99b8ee9125859ae9730b1ad2e9519152.js?file=good-statistics.log"></script>

Another option could be to use <a href="http://joel-costigliola.github.io/assertj/assertj-core-features-highlight.html#field-by-field-comparison" target="_blank">field by field comparisons</a> from <a href="http://joel-costigliola.github.io/assertj/index.html" target="_blank">AssertJ</a>. It's useful if the object under comparison has other custom objects as properties, so comparators for types can be added by <a href="http://joel-costigliola.github.io/assertj/assertj-core-features-highlight.html#field-by-field-recursive" target="_blank">`usingComparatorForType`</a>. 

Others prefer <a href="https://projectlombok.org/features/EqualsAndHashCode" target="_blank">Lombok</a> to make `equals` and `hashCode` methods available, but maybe it's not necessary if you only need to compare objects.

Regarding _verification_, <a href="https://static.javadoc.io/org.mockito/mockito-core/2.8.47/org/mockito/ArgumentMatchers.html#refEq(T,%20java.lang.String...)">`refEq`</a> is available from <a href="http://site.mockito.org" target="_blank">Mockito</a>.

## Further reading 

Take a look at <a href="https://codurance.com/2014/12/14/quality-cannot-be-measured">_Code quality cannot be measured_</a> by <a href="https://codurance.com/publications/author/sandro-mancuso">**Sandro Mancuso**</a>.

## Acknowledgments

My special thanks go to <a href="https://codurance.com/publications/author/halima-koundi">**Halima Koundi**</a>, my very good colleague, for her help in this post.

<a href="https://codurance.com/2017/09/01/do-we-have-a-good-safety-net-to-change-this-legacy-code/" target="_blank">I published this article at Codurance website</a>.
