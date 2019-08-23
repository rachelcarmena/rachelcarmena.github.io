---
layout: post
asset-type: post
title: Functional programming sparks joy
description: Some characteristics of functional programming
date: 2019-08-05 10:00:00 +00:00
last_modified_at: 2019-08-23 08:00:00 +00:00
image:
    src: /img/cards/posts/functional-programming-sparks-joy/cover.jpg
---

## Motivation

The title comes from Marie Kondo's recommendation about feeling if an item sparks joy to keep it with you or to discard it.

When I heard about functional programming I decided to continue learning about it. Why? Let's see some reasons.

## Introduction

I agree with [Scott Wlaschin](https://twitter.com/ScottWlaschin) when he says that functional programming is not scary but unfamiliar. It has a mathematical basis and is full of new concepts.

However, the more you know about functional programming and working examples, the more advantages you notice in the paradigm.

Which programming language am I going to use for the examples? JavaScript. It's not a purely functional programming language like Haskell but multi-paradigm, so it's suitable for talking about it.

Moreover, I think it can be interesting to start practicing with a known and non-purely functional programming language before moving to another one.

## Pure functions

One of the objectives is to have pure functions.

A pure function works as follows:

* It takes an input.
* It works with that input and no more. It doesn't access the outside in order to get more things, neither changes it the outside.
* It returns an output.

This image appears in my mind:

![](/img/cards/posts/functional-programming-sparks-joy/function.png)

So it has these properties:

* It returns the **same output** from the **same input**.
* It has **no side effects**.
* It's **referentially transparent**: a call can be replaced by the output for the present input. It's not necessary to execute the function to preserve the semantics of the program.

Referential transparency is a simple and powerful concept: Can I replace this function call by its result without altering the program behaviour? Why? Can it be simplified? Would it be necessary to compute that function call every time? Could some results be memoized?

## Declarative programming

My Dutch uncle who is now retired and always worked very near developers told me:

> I've heard that one of the problems in software development is that source code includes a lot of details and we should program at a higher abstraction level.

I think it's useful to explain this section. 

Functional programming is declarative: it doesn't reveal details of implementation.

For example, imagine that we have the following function:

```js
const isEven = number => (number % 2 === 0);
```

and we want to know if an array only contains even numbers:

```js
const onlyContainsEvenNumbers = array => {
    for (let index = 0; index < array.length; index++) {
        if (!isEven(array[index])) {
            return false;
        }
    }
    return true;
}

const numbers = [2, 4, 8, 10, 20, 11];
onlyContainsEvenNumbers(numbers); // false
```

The `onlyContainsEvenNumbers` function is an example of imperative programming: it includes a lot of details to indicate _how_ to get the goal.

However, compare it with this alternative where an expression is used to describe what to get:

```js
const numbers = [2, 4, 8, 10, 20, 11];
numbers.every(number => isEven(number)); // false

// Following the pointfree style:
numbers.every(isEven); // false
```

If fewer details are given then: less prone to error and easier to read.

In this case, less tests would be needed because the `every` function is known to work as expected.

<div class="note">
    <strong>Note</strong>: The "point" of <strong>pointfree style</strong> is not <code>.</code> but a point on a space. <code>f(x)</code> can be read as "the value of f at point x". So pointfree style consists on not specifying the parameters to avoid redundancy.
</div>

<div class="note">
    <strong>Note</strong>: The function <code>isEven</code> is an example of <strong>predicate</strong>, a function that returns a boolean value.
</div>

## Immutability

How many times have you seen a call that modifies the arguments when only an output is expected as a result of that call?

What if the immutability is ensured?

For example, we have a function to calculate the square:

```js
const square = number => Math.pow(number, 2);
```

and we want to calculate the array of squares from an array of numbers:

```js
const calculateSquares = array => {
    for (let index = 0; index < array.length; index++) {
        array[index] = square(array[index]);
    }
    return array;
}

const numbers = [2, 5, 8];
calculateSquares(numbers); // [4, 25, 64]
```

Not only a lot of details are given again but also the `numbers` array is mutated to `[4, 25, 64]`.

However, let's see the following code:

```js
const numbers = [2, 5, 8];
numbers.map(square); // [4, 25, 64]
```

In this case, we get the same result and the `numbers` array remains with the same content at the end.

This is only an example. Immutability is pursued beyond arguments.

The consequences of immutability are testable and parallelizable code.

<div class="note">
    <strong>Note</strong>: The <code>map</code> function doesn't only return an array with the same type of items. It accepts a function from the original type to any type.
</div>

<div class="note">
    <strong>Note</strong>: Moore's law established that the number of transistors on integrated circuits would double every two years. However, the limit was reached for the year 2002. Later, multicore processors appeared to keep the speed increases. Parallelizable code is the only way to take advantage of them.
</div>

On the other hand, we can find impure functions in JavaScript like `sort`:

```js
> const numbers = [100, 1, 8, 25]; 
undefined
> numbers.sort()
[ 1, 100, 25, 8 ]
> numbers
[ 1, 100, 25, 8 ]
> numbers.sort((a, b) => (a - b))
[ 1, 8, 25, 100 ]
> numbers
[ 1, 8, 25, 100 ]
```

The `numbers` array is mutated.

That impure function could be wrapped into a pure function:

```js
const sortArray = (array, compareFunction) => {
    const arrayCopy = array.slice();
    return arrayCopy.sort(compareFunction); 
}
```

```js
> const numbers = [100, 1, 8, 25];
undefined
> sortArray(numbers, (a, b) => (a - b));
[ 1, 8, 25, 100 ]
> numbers
[100, 1, 8, 25]
```

In production code, I would think about these questions: Where do I need to sort an array? Do I have a lot of functions with an array as a parameter? Should I have to create a new data type?

<div class="note">
    <strong>Note</strong>: However, programs usually change the <em>outside world</em>. In that case, what if mutations are isolated in a specific part of the source code?
</div>

## Higher-order functions

In JavaScript, a function is a first-class citizen: 

* It can be the argument to another function.
* It can be the output of another function.

A **higher-order function** is a function that takes another function as an argument or returns another function (or both).

I included examples of `every` and `map` so far. Let's see examples with `filter` and `reduce`:

```js
const isEven = number => (number % 2 === 0);

const numbers = [4, 2, 11, 20, 7];
numbers.filter(isEven); // [4, 2, 20]
```

```js
const add = (accum, value) => accum + value;

const numbers = [4, 10, 1, -10];
numbers.reduce(add); // 5

// Good habit: indicating an initial value
numbers.reduce(add, 0); // 5
```

The power of having functions as first-class citizens and creating higher-order functions promotes the separation of responsibilities and readability.

<div class="note">
    <strong>Note</strong>: When <code>reduce</code> doesn't include an initial value (second parameter), the first item from the array is used as the initial value for the accumulator and skipped. In the included example, it's not necessary to indicate an initial value, because the first item can be used as the initial value and skipped. However, I talked about a <em>good habit</em> to avoid problems with empty lists.
</div>

<div class="note">
    <strong>Note</strong>: Some programming languages differentiate between <code>reduce</code> (without providing an initial value) and <code>fold</code> (providing an initial value). Others have just <code>fold</code> for both options.
</div>

## Function composition

Functions can be composed into a new one.

When following the definition of composing two functions, the functions appear from right to left because the output of the first function is the input of the following one.

![](/img/cards/posts/functional-programming-sparks-joy/function-composition.png)

For example, the `sumOfSquares` function:

```js
const square = array => array.map(number => Math.pow(number, 2));
const sum = array => array.reduce((accum, value) => (accum + value), 0);

const sumOfSquares = numbers => sum(square(numbers));

const numbers = [2, 4];
sumOfSquares(numbers); // 20
```

However, there are other two ways of composing functions where the functions appear from left to right: pipe or chain.

![](/img/cards/posts/functional-programming-sparks-joy/pipe.png)

For example, let's see the `sumOfSquares` function as a pipe:

```js
const square = array => array.map(number => Math.pow(number, 2));
const sum = array => array.reduce((accum, value) => (accum + value), 0);
const pipe = (f, g) => (...args) => g(f(...args));

const sumOfSquares = numbers => pipe(square, sum)(numbers);

// Following the pointfree style:
const sumOfSquares = pipe(square, sum);
```

or as a chain:

```js
const square = number => Math.pow(number, 2);
const sum = (accum, value) => (accum + value);

const sumOfSquares = numbers => numbers.map(square)
                                       .reduce(sum, 0);
```

<div class="note">
    <strong>Note</strong>: I only included examples of composing two functions for simplicity though there is no limit.
</div>

## Tail recursive functions

In functional programming, iteration is usually programmed with recursion so it's important to control the growth of the call stack. 

How? Reusing the call frame instead of adding a new one.

It's known as **tail call optimization** or **proper tail calls**.

Given a recursive function, that optimization is possible if it calls itself as its last action. That is, it's a **tail recursive function**.

Let's see a **non-**tail recursive function:

```js
const factorial = number =>
    number === 0
        ? 1
        : number * factorial(number - 1);
```

The stack trace for `factorial(4)`:

```js
factorial(4)
4 * factorial(3)
4 * (3 * factorial(2))
4 * (3 * (2 * factorial(1)))
4 * (3 * (2 * (1 * factorial(0))))
4 * (3 * (2 * (1 * 1)))
4 * (3 * (2 * 1))
4 * (3 * 2)
4 * 6
24
```

On the other hand, the same function as a **tail recursive function**:

```js
const factorial = (number, accumulator = 1) =>
    number === 0
        ? accumulator
        : factorial(number - 1, accumulator * number);
```

The stack trace for `factorial(4)`:

```js
factorial(4)
factorial(3, 4)
factorial(2, 12)
factorial(1, 24)
factorial(0, 24)
24
```

That's the reason why it's possible to reuse the call frame: there is no need to remember the previous calls.

However, the last `factorial` function could be called with an argument for the `accumulator` parameter from the beginning:

```js
const WRONG_ARGUMENT = 5;

factorial(4, WRONG_ARGUMENT); // 120
```

So let's prevent that error and create an alternative with only one parameter and a **closure**:

```js
const factorial = number => {
    const fact = (number, accumulator = 1) =>
        number === 0
            ? accumulator
            : fact(number - 1, accumulator * number);
    return fact(number);
}
```

## Currying

Currying consists of converting a function with several parameters into nested unary functions (_unary_ = one parameter).

For example, we have this function with two parameters:

```js
const log = (level, message) => `[${level}] ${message}`;

log("ERROR", "Undefined variable"); // "[ERROR] Undefined variable"
log("INFO", "New post created");    // "[INFO] New post created"
```

It could be transformed into two nested functions:

```js
const log = level => message => `[${level}] ${message}`;

const logError = log("ERROR");
const logInfo = log("INFO");

logError("Undefined variable"); // "[ERROR] Undefined variable"
logInfo("New post created");    // "[INFO] New post created"
```

Notice the improvement in readability: `logError`, `logInfo`.

Moreover, the need of writing `"ERROR"` and `"INFO"` every single time disappears.

I tried to write my own `curry` function to convert any function into those nested unary functions automatically. The original function can only be called when having all the arguments, so I needed to accumulate the arguments recursively (_arity_ = number of arguments expected by a function):

```js
const curry = fn => {
    const arity = fn.length;
    const _curry = (...args) => 
        args.length === arity
            ? fn(...args)
            : arg => _curry(...args, arg);
    return _curry();
}
```

Following the previous example:

```js
const log = (level, message) => `[${level}] ${message}`;

const curriedLog = curry(log);

const logError = curriedLog("ERROR");
const logInfo = curriedLog("INFO");

logError("Undefined variable"); // "[ERROR] Undefined variable"
logInfo("New post created");    // "[INFO] New post created"
```

<div class="note">
    <strong>Note</strong>: My own version doesn't work like the <code>curry</code> function that can be found in libraries such as Lodash or Ramda which add more capabilities.
</div>

<div class="note">
    <strong>Note</strong>: In languages such as Haskell or F#, all functions are considered curried.
</div>

## Partial application

Partial application consists of doing a _projection_: specifying only some arguments in function application, producing another function with the remaining parameters.

For example, let's play with the `partial` function from Lodash, using an underscore for the unknown arguments:

```js
var _ = require('lodash');
const { log } = console;

const greet = (name, place, message) =>
    `Hello ${name} from ${place}! ${message}`;

const greetFromWonderland = _.partial(greet, _, "Wonderland", _);

log(greetFromWonderland("Mike", "Have a good day!"));
// Hello Mike from Wonderland! Have a good day!
```

Partial application allows us to make progressive calls as we have the arguments.

<div class="note">
    <strong>Note</strong>: Beyond the included examples, currying and partial application are useful to be able to compose functions.
</div>

## Another mindset

Last but not least, all of these things (and many more!) make us to think in a different way:

* Fewer details. We program at a higher abstraction level.
* It forces ourselves to separate responsibilities in building blocks and then to combine them.
* Side effects under control. We are more aware of mutations.
* I didn't talk about functional data types but I could say that [Primitive Obsession smell](http://wiki.c2.com/?PrimitiveObsession) can be eradicated with this paradigm.

A new mindset is needed to embrace functional programming.

## Vocabulary

Some words which weren't used here although they can be useful to understand other articles:

* **Domain**: Set of possible inputs to a given function.
* **Codomain**: Set of possible outputs to a given function (the prefix "co" is used to refer to the opposite).
* **Total function** (vs. **partial function**): It returns a valid output for every possible input. They are just known as **functions**.
* **Polymorphic function**: In functional programming, polymorphism is also known as **parametric polymorphism**. A polymorphic function operates on values without depending on their type. It's valid for any type.

## Further knowledge

* [Talk: Tail Call Optimization: The Musical!!](https://www.youtube.com/watch?v=-PX0BV9hGZY) by Anjana Vakil & Natalia Margolis
* [Post: Functors, Applicatives, And Monads In Pictures](http://adit.io/posts/2013-04-17-functors,_applicatives,_and_monads_in_pictures.html) by Aditya Bhargava
* [Online book: Structure and Interpretation of Computer Programs](https://mitpress.mit.edu/sites/default/files/sicp/index.html) by Harold Abelson, Gerald Jay Sussman and Julie Sussman 
* [Playlist: MIT 6.001 Structure and Interpretation, 1986](https://www.youtube.com/playlist?list=PLE18841CABEA24090) by Hal Abelson and Gerald Jay Sussman
* [Book: Category Theory for Programmers](https://github.com/hmemcpy/milewski-ctfp-pdf) by Bartosz Milewski
* [Talk (Spanish): Better types = fewer tests](https://www.youtube.com/watch?v=TScwxX62uig) by Raúl Raja
* [Talk: Domain Modeling Made Functional](https://www.youtube.com/watch?v=Up7LcbGZFuo) by Scott Wlaschin
* [Specification: Fantasy Land Algebra](https://github.com/fantasyland/fantasy-land)
* [Why Functional Programming Matters](https://www.cs.kent.ac.uk/people/staff/dat/miranda/whyfp90.pdf) by John Hughes
* [Book: Haskell Programming from first principles](http://haskellbook.com)
* [Reflection: Functional programming is deep](https://purelyfunctional.tv/issues/purelyfunctional-tv-newsletter-337-functional-programming-is-deep/) by Eric Normand
* [Articles: PragPub Magazine #38](https://magazines.pragprog.com/2012/pragpub-2012-08.pdf)

## Acknowledgments

Special thanks to these old colleagues:

* [Christian Panadero](https://twitter.com/panavtec) for giving me the first master classes about functional programming and category theory. They were the best _ice-breaker_ classes.

* [Carlos Morera de la Chica](https://twitter.com/CarlosMChica) for being the best travel companion together with Christian during several editions of [Lambda World Conference](http://www.lambda.world/).

* [Richard Wild](https://twitter.com/richardjwild) for providing me a lot of reflection moments with his series about [The Functional Style](https://codurance.com/2018/08/09/the-functional-style-part-1/).

And thanks to:

* [Eduardo Sebastian](https://twitter.com/esebastian) for his pull request to fix some typos.
* **Christophe Riolo Uusivaara** for his valuable feedback about _tail call optimization_. It's not only related to recursive functions.

<hr>

# Let's continue

Before adding more concepts, I would like to share a reflection.

I think that object-oriented programming and functional programming are such different paradigms that they are not comparable. However, I find a similar feeling.

When I discovered object-oriented design patterns, I realized that we weren't doing anything special. Our problems were widespread.

The only difference between our development project and others could be the business domain.

What if we step forward? What if we can model the domain with two kinds of pieces? 

When I was a child, I didn't have LEGO bricks but TENTE with smaller pieces.

I still remember my helicopter of the forest brigade:

![Helicopter](/img/cards/posts/functional-programming-sparks-joy/helicopter.png)

I assembled it and disassembled it hundreds of times.

However, it had more than two kinds of pieces.

What if we only need two kinds of pieces for creating software?

What if there is a branch of mathematics that tries to generalize things with two kinds of pieces and can be moved to computer programming?

I'm talking about **category theory** where a **category** is a collection of:

* Objects
* Relationships (also known as morphisms or arrows) between the objects

Functional programming is based on a **category of sets** where:

* The objects are **types** (sets of values)
* The arrows are **functions**

Just two kinds of _pieces_ and the **power of composition** with all the **abstractions** defined and proved matematically.

As [Bartosz Milewski](https://twitter.com/BartoszMilewski) wrote:

> One of the important advantages of having a mathematical model for programming is that it’s possible to perform formal proofs of correctness of software.

Let's review the previous concepts:

* If functions were impure, it would be very difficult to "play" with them and to compose with each other.
* Mathematically, the common needs with types and functions are defined. We only have to use them, so we'll program in a higher abstraction level.
* Immutability is also essential to compose functions. Otherwise, the results couldn't be anticipated.
* If functions are composed, they will have to be input or output as well. Every function also has a type.
* Recursion will appear when defining types or functions.
* Currying and partial application are some of the techniques to be able to compose functions. Think about having an output that can be the input of the following function.

Finally, think about the business domain you are working on, the state machines, the transformations, the processes, ... how do they fit types and functions?

## About the examples

So far, I've used plain JavaScript and an example with Lodash library.

However, to continue explaining functional programming, I'll include examples in [PureScript](http://www.purescript.org), a strongly-typed functional programming language that compiles to JavaScript.

I would have had a clear choice with other programming languages: 

* [Arrow](https://arrow-kt.io) for Kotlin
* [Cats](https://typelevel.org/cats/) for Scala
* [VAVR](https://www.vavr.io) for Java

I think it's good to have libraries which add functional capabilities to non-purely programming languages. It's a way of extending a language more quickly and with the support of the developers community.

However, I had a lot of alternatives in JavaScript:

* **Libraries**: Lodash, Underscore, Rambda, etc.
* **Languages which compile to JavaScript**: TypeScript, PureScript, Elm, ClojureScript, Reason, OCaml (the last two options thanks to BuckleScript), etc.

Why PureScript? I made the decision when trying to explain composite types:

* Libraries such as Lodash or Underscore don't allow to create sum types.
* Ramda library provides Either, though it's for doing an OR of function results.
* I found a library for creating sum types: [Daggy](https://github.com/fantasyland/daggy). However, this alternative involved making more decisions later.
* TypeScript uses the pipe to represent the choice between basic types or the intersection of properties between objects.
* I found composite types in Reason, though I didn't find other capabilities.
* What about the rest of options? I reviewed PureScript and it provided the characteristics I was looking for.

My only purpose is explaining functional programming. PureScript is only a choice for it.

## Composite types

<div class="note">
    <strong>Note</strong>: Initially I wrote <em>type composition</em> as section title. It wasn't right because it could be confused with <em>composition</em> from <strong>function composition</strong>.
</div>

Types can be combined to create a new type.

The new type is also known as an **algebraic data type** (ADT). Why _algebraic_? Because we can "play" with them on equations and symbols (I didn't cover it here although it's fun!).

There are two common kinds of composite types: **product types** and **sum types**.

Let's see what they are and some examples and then I'll explain a curiosity that can be useful to understand the reason of their names.

**To be continued...**
