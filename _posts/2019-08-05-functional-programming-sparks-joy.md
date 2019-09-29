---
layout: post
asset-type: post
title: Functional programming sparks joy
description: Some characteristics of functional programming
date: 2019-08-05 10:00:00 +00:00
last_modified_at: 2019-09-20 08:00:00 +00:00
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

![](/img/cards/posts/functional-programming-sparks-joy/function_composition.png)

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

const greetFromWonderland = 
    _.partial(greet, _, "Wonderland", _);

const greetFromWonderlandWithWish =
    _.partial(greetFromWonderland, _, "Have a good day!");

log(greetFromWonderlandWithWish("Mike"));
// Hello Mike from Wonderland! Have a good day!
```

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

* [The Science Behind Functional Programming](https://www.47deg.com/blog/science-behind-functional-programming/) by Rafa Paradela
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
* [Typeclassopedia](https://wiki.haskell.org/Typeclassopedia)

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

![](/img/cards/posts/functional-programming-sparks-joy/separator.jpg)

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

**Functional programming** is based on a **category of sets** where:

* The objects are **types** (sets of values)
* The arrows are **functions**

Just two kinds of _pieces_ and the **power of composition** with all the **abstractions** defined and proved matematically.

As [Bartosz Milewski](https://twitter.com/BartoszMilewski) wrote:

> One of the important advantages of having a mathematical model for programming is that it’s possible to perform formal proofs of correctness of software.

<div class="note">
<strong>Note</strong>: Imagine more than one category. And now, imagine arrows between categories:
<ul>
<li>From objects of a category to objects of another one</li>
<li>From arrows of a category to arrows of another one</li>
</ul>
<p>Therefore, in <strong>functional programming</strong>:</p>
<ul>
<li>The objects are <strong>types</strong> and <strong>functions</strong></li>
</ul>
<p>Remember that functions are first-class citizens and can be input and output as well.</p>
</div>

It's awesome the amount of things that can be built when "playing" with only two kinds of pieces.

[Bartosz Milewski](https://twitter.com/BartoszMilewski) also wrote:

> Category theory is full of simple but powerful ideas

Let's review the other previous concepts (I already mentioned functions as first-class citizens):

* If functions were impure, it would be very difficult to "play" with them and to compose with each other.
* Mathematically, the common needs with types and functions are defined. We only have to use them, so we'll program in a higher abstraction level.
* Immutability is also essential to compose functions. Otherwise, the results couldn't be anticipated.
* Recursion will appear when defining types or functions.
* Currying and partial application are some of the techniques to be able to compose functions (an output must match with the input of the following function).

Finally, let's consider the business domain we are working on, the state machines, the processes, the transformations, the validations, ... how do types and functions fit those needs? It seems they absolutely fit them.

## About the examples

So far, I've used plain JavaScript and an example with Lodash library.

However, to continue explaining functional programming, I'll include examples in [PureScript](http://www.purescript.org), a strongly-typed functional programming language that compiles to JavaScript. It's heavily influenced by Haskell.

I would have had a clear choice with other non-purely programming languages: 

* [Arrow](https://arrow-kt.io) for Kotlin
* [Cats](https://typelevel.org/cats/) for Scala
* [Bow](https://bow-swift.io) for Swift
* [VAVR](https://www.vavr.io) for Java

I think it's good to have libraries which add functional capabilities as a way of extending a language more quickly and with the support of the developers community.

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

<div class="note">
    <strong>Note</strong>: Sometimes we think about selecting only one programming language (as I did here). However, for a real software product, we could choose different programming languages according to the needs. There are a lot of languages which compile to JavaScript, which run under JVM or which run under the CLR, among other options.
</div>

### Declaration and definition

In PureScript, as in Haskell, it's a good practice to provide type annotations as documentation though compiler is able to infer them.

The function type annotation is known as the **function declaration**. Its notation is influenced by [Hindley-Milner type system](https://en.wikipedia.org/wiki/Hindley%E2%80%93Milner_type_system) and it has the following parts:

* Function name
* `::` (= "is of type" or "has the type of")
* Function type:
    * Input type
    * `->`
    * Output type

The **function definition** is where the function is actually defined. 

For instance, the declaration and definition of `add` function:

```js
add :: Int -> Int -> Int
add x y = x + y
```

<div class="note">
<strong>Note</strong>: As in other languages such as Haskell or F#, all functions are considered curried. So the <code>add</code> function is really:
<p><code class="highlighter-rouge">
add :: Int -> (Int -> Int)
</code></p>
<p>It takes an integer (the first operand) and returns a function. That function takes the other integer (the second operand) and returns the sum.</p>
<p>This is transparent to us because the function definition and the use work like a function of 2 parameters.</p>
</div>

## Composite types

Types can be combined to create a new type.

The new type is also known as an **algebraic data type** (ADT). 

Why _algebraic_? Because we can "play" with them on equations and symbols (I didn't cover it here although it's fun!).

There are two common kinds of composite types: 
* Product types
* Sum types

Let's see what they are and some examples and then I'll explain a curiosity that can be useful to understand the reason of their names.

### Product types

This is an example of the creation of a new type with the product of two types:

```
data Money = Money {
    amount   :: Amount,
    currency :: Currency
}
```

Its values will contain both a value of type `Amount` **and** a value of type `Currency`.

Why _product_? Think about the number of different values for that type: the _product_ of the number of different values of the type `Amount` and the number of different values of the type `Currency`.

### Sum types

This is an example of the creation of a new type with the sum of two types:

```
data SendingMethod 
    = Email String
    | Address { street  :: String, 
                city    :: String, 
                country :: String }
```

The new type `SendingMethod` represents a choice between `Email` and `Address`.

The values of this new type will contain a value of type `Email` **or** a value of type `Address`.

Why _sum_? Think about the number of different values for that type: the _sum_ of the number of different values of the type `Email` and the number of different values of the type `Address`.

<div class="note">
<strong>Note</strong>: I only included examples of combining two types for simplicity though there is no limit.
</div>

<div class="note">
<strong>Note</strong>: Initially I used <em>type composition</em> as section title. It wasn't right because it could be confused with <em>composition</em> from <em>function composition</em>.
</div>

## Pattern matching

In functional programming, pattern matching is based on constructors as patterns.

Given a value, it can be disassembled down to parts that were used to construct it.

This is a powerful tool to make decisions according to types: 

```
showSendingMethod :: SendingMethod -> String
showSendingMethod sendingMethod = 
    case sendingMethod of
        Email email -> "Sent by mail to: " <> email
        Address address -> "Sent to an address"
```

## Some composite types

### Tuple

`Tuple` is an example of _product_ type that represents a pair of values.

It's defined in the module `Data.Tuple` of PureScript:

```
data Tuple a b = Tuple a b
```

where:

* The lowercase letters `a` and `b` represent any type
* The first `Tuple` is the type constructor
* The second `Tuple` is the value constructor

Let's see an example:

```
pair :: Tuple String String
pair = Tuple "spam" "eggs"
```

where:

* The type constructor `Tuple` is used in the declaration: `pair` is of type `Tuple String String`
* The value constructor `Tuple` is used in the definition: the value of `pair` is `Tuple "spam" "eggs"`

It's known as **Pair** in other languages.

### Maybe

`Maybe` is an example of _sum_ type that is used to define optional values.

It's defined in the module `Data.Maybe` of PureScript:

```
data Maybe a = Nothing | Just a
```

where:

* The lowercase letter `a` represents any type
* `Maybe` is the type constructor

`Maybe` of a type can represent one of these options:

* A missing value: `Nothing`
* The presence of a value of that type: `Just a`

Let's see an example of use:

```
showTheValue :: Maybe Number -> String
showTheValue value =
    case value of
        Nothing -> "There is no value"
        Just value' -> "The value is: " <> toString value'
```

It's known as **Option** in other languages.

### Either

`Either` is another example of _sum_ type and it's commonly use for error handling.

It's defined in the module `Data.Either` of PureScript:

```
data Either a b = Left a | Right b
```

where:

* The lowercase letters `a` and `b` represent any type
* `Either` is the type constructor

`Either` represents the choice between 2 types of values where:

* `Left` is used to carry an error value
* `Right` is used to carry a success value

Let's see an example of use:

```
showTheValue :: Either String Number -> String
showTheValue value =
    case value of
        Left value' -> "Error: " <> value'
        Right value' -> "The value is: " <> toString value'
```

## Some guidelines

### Making things explicit

It can be said that functional programming is based on making things **explicit** as much as possible.

For instance, let's think about `Maybe`. 

If a function returns an integer, a missing value is not expected.

With `Maybe`, it can be made explicit that the function returns an integer or not.

### Making illegal states unrepresentable

This is a design guideline by [Yaron Minsky](https://twitter.com/yminsky).

Let's see an example. Imagine that we have a type Course with this content:

```
data Course = Course {
    title           :: String,
    started         :: Boolean,
    lastInteraction :: Maybe Date
}
```

There is an illegal state that can be representable: `started` is false and `lastInteraction` has a date.

For instance, that illegal state could be avoided with a sum type:

```
data Course 
    = StartedCourse { title :: String, lastInteraction :: Date }
    | UnstartedCourse { title :: String }
```

<div class="note">
<strong>Note</strong>: This design guideline reminds me another one that has a wider application. It was formulated by <strong>Scott Meyers</strong>:
<blockquote>
<p>Make interfaces easy to use correctly and hard to use incorrectly.</p>
<p>Interfaces occur at the highest level of abstraction (user interfaces), at the lowest (function interfaces), and at levels in between (class interfaces, library interfaces, etc.)</p>
</blockquote>
</div>

## Typeclasses

> A **typeclass** defines a family of types that support a common interface

Typeclasses are useful to define concepts like **monoids**, **functors**, **applicative** and **monads** for all the types or types constructors, respectively.

And then, it's possible to create instances of those typeclasses for concrete types or types constructors.

I include more details about it in following sections.

## Monoids

A **monoid** is useful to explain how the values of a type are combined.

Let's see some examples with known types.

For instance, natural numbers:

* They could be combined with addition, for instance.
* Zero could be the starting point and then, add each number.
* Given 3 numbers, the result with be the same for these operations:
    * The addition of the first 2 numbers is added with the third number.
    * The first number is added with the addition of the other 2 numbers.

Or strings:

* They could be combined with concatenation.
* An empty string could be the starting point and then, concatenate each string.
* Given 3 strings, the result with be the same for these operations: 
    * The concatenation of the first 2 strings is concatenated with the third string.
    * The first string is concatenated with the concatenation of the other 2 strings.

How to express it in an easy way?

**Monoids** to the rescue!

Read the following definition together with the previous examples.

A **monoid** is a type with a binary operation (2 elements). That operation has the following properties:

* It has a neutral element (identity)
* It's associative

Did you identify each part of the definition in the previous examples?

<div class="note">
<strong>Note</strong>: I included examples with simple and known types. However, think about <strong>any</strong> kind of type and the need to define how the values of a type are combined.
</div>

### Typeclass for monoids

Let's see how to abstract the concept of **monoid** for any type and then, how to define it for concrete types.

In Haskell, the typeclass for a **monoid** includes the neutral element (called `mempty`) and the binary operation (called `mappend`):

```
class Monoid m where
    mempty :: m
    mappend :: m -> m -> m
```

However, PureScript has a previous abstraction and includes the binary operation in `Semigroup` typeclass:

```
class Semigroup a where
    append :: a -> a -> a
```

So **Monoid** typeclass extends the `Semigroup` typeclass with the neutral element: 

```
class Semigroup m <= Monoid m where
    mempty :: m
```

That's the abstraction. Now, for instance, how to define the way of combining strings?

The **monoid** for strings in PureScript (modules `Data.Semigroup` and `Data.Monoid`, respectively):

```
instance semigroupString :: Semigroup String where
    append = concatString
```

```
instance monoidString :: Monoid String where
    mempty = ""
```

The binary operation is concatenation and the neutral element is the empty string.

In this way, it's possible to combine all the strings from an array into a single string when using the `append` and `mempty` defined for strings:

```
greeting :: String
greeting = foldl append mempty ["Hello,", " ", "world!"]
-- "Hello, world!"
```

<div class="note">
<strong>Note</strong>: <code>foldl</code> folds the array from the left. In this case, the result would be the same with <code>foldr</code>.
</div>

## Functors

You already know a **functor**!!

A **functor** is a type constructor which provides a mapping operation.

Which **functor** do you know for sure?

`Array` is a **functor** which provides the `map` function.

Let's remember the included example in the first part (plain JavaScript):

```js
const square = number => Math.pow(number, 2);

const numbers = [2, 5, 8];
numbers.map(square); // [4, 25, 64]
```

The same example in PureScript:

```
square :: Int -> Int
square number = pow number 2

numbers = [2, 5, 8] :: Array Int

logShow (map square numbers)
-- [4,25,64]
```

or using an _infix_ function application (as an operator between the two arguments):

```
logShow (square `map` numbers)
-- [4,25,64]

logShow (square <$> numbers)
-- [4,25,64]
```

Graphically:

![](/img/cards/posts/functional-programming-sparks-joy/array_functor.png)

It's said that:

* The `map` function allows the function `square` to be _lifted_ over an array
* Or just, the `map` function _lifts_ the `square` function

### How to form a functor

Following the definition, a **functor** can be formed by:

* A type constructor
* A mapping function

For instance, the **functor** formed by:

* The type constructor `Maybe` (in this case, from `String` to `Maybe String`)
* The following `fmap` function:
    * From a function `(String -> String)`
    * To a function `(Maybe String -> Maybe String)`

```
repeat :: String -> String
repeat aString = aString <> aString

fmap :: (String -> String) -> Maybe String -> Maybe String
fmap f value =
    case value of
        Nothing -> Nothing
        Just value' -> Just (f value')

message :: Maybe String
message = fmap repeat (Just " bla ")
-- (Just " bla  bla ")
```

Graphically:

![](/img/cards/posts/functional-programming-sparks-joy/maybe_functor.png)

In this example, the `fmap` function _lifts_ the `repeat` function.

<div class="note">
<strong>Note</strong>: For simplicity in the examples, I included functions like <code>square</code> and <code>repeat</code> which have the same type for input and output. However, that condition is <strong>not</strong> necessary.
</div>

<div class="note">
<strong>Note</strong>: What's the purpose of <strong>functors</strong>? Let's remember the need of composing functions and the need of adapting the input and output to compose them. We've already seen some tools for it and a <strong>functor</strong> is another one. We'll see more of them in the next sections.
</div>

### Typeclass for functors

Let's see how to abstract the concept of **functor** for any type constructor and then, how to define it for a concrete type constructor.

The typeclass for a **functor** appears in `Data.Functor` module:

```
class Functor f where
    map :: forall a b. (a -> b) -> f a -> f b
```

Following the previous example, the **functor** for `Maybe` is already defined in `Data.Maybe` module:

```
instance functorMaybe :: Functor Maybe where
    map fn (Just x) = Just (fn x)
    map _  _        = Nothing
```

So it can be used to get the same result than before with less code:

```
repeat :: String -> String
repeat aString = aString <> aString

logShow (map repeat (Just " bla "))
-- (Just " bla  bla ")
```

or using an _infix_ function application (as an operator between the two arguments):

```
logShow (repeat `map` (Just " bla "))
-- (Just " bla  bla ")

logShow (repeat <$> (Just " bla "))
-- (Just " bla  bla ")
```

### Functor composition

So far I've included examples of `Array` functor and `Maybe` functor separately.

What if there are more than one functor?

What if we want to apply the `repeat` function into a `Maybe (Array String)`?

![](/img/cards/posts/functional-programming-sparks-joy/functor_composition.png)

Firstly, we use the mapping function of `Array` and then, the mapping function of `Maybe` over the result.

In other words, the mapping functions are composed (operator `>>>`):

```
logShow ((map >>> map) repeat (Just [" bla ", " ha "]))
-- (Just [" bla  bla "," ha  ha "])
```

## Applicative

There are a lot of things about **applicative**. I include the basic **applicative** abstraction also known as an **applicative functor**.

An **applicative functor** is an step further than a **functor**.

Let's see what happens if we have a function with more than one parameter.

For instance:

```
fullName :: String -> String -> String
fullName name surname = name <> " " <> surname
```

Functions are curried by default in PureScript, so in this case: the input is a `String` and the output is another function `String -> String`.

![](/img/cards/posts/functional-programming-sparks-joy/fullName.png)

What happens if instead of two strings for `name` and `surname` we have `Maybe String` for each of them?

With `map` from `functorMaybe`, we get another function from `Maybe String` to `Maybe (String -> String)`.

![](/img/cards/posts/functional-programming-sparks-joy/fullName-map.png)

In other words, the function `String -> String` is wrapped with the type constructor `Maybe`.

How can we continue?

How can we get another function from `Maybe String` to `Maybe String`? 

`apply` to the rescue!

![](/img/cards/posts/functional-programming-sparks-joy/applicative-2-params.png)

In PureScript, the applicative for Maybe is already defined so it's possible to use `apply` with that kind of type constructor:

```
logShow (apply (map fullName (Just "Rachel")) (Just "M. Carmena"))
-- (Just "Rachel M. Carmena")

logShow (apply (map fullName (Just "Rachel")) Nothing)
-- Nothing
```

or using an _infix_ function application (in this case, `<*>` is the equivalent to `apply`):

```
logShow (fullName <$> Just "Rachel" <*> Just "M. Carmena")
-- (Just "Rachel M. Carmena")

logShow (fullName <$> Just "Rachel" <*> Nothing)
-- Nothing
```

Therefore, if we have a function with more than two parameters, we'd use `<$>` (`map`) for the first parameter and then `<*>` (`apply`) for the rest of parameters.

![](/img/cards/posts/functional-programming-sparks-joy/applicative-3-params.png)

Another powerful tool to compose functions. Think about other type constructors like `Either`, form validations, etc.

Finally, after the examples, it could be easier to understand the difference between `map` from **functors** and `apply` from **applicative functors**:

```
map :: forall a b. (a -> b) -> f a -> f b
```

```
apply :: forall a b. f (a -> b) -> f a -> f b
```

Both get the same result though `map` transforms a function and `apply` transforms a function which is wrapped.

<div class="note">
<strong>Note</strong>: In this section, I didn't include the formal definition of <strong>applicative functors</strong> in PureScript and the corresponding instance for <code>Maybe</code>. They can be found in the modules <code>Control.Apply</code>, <code>Control.Applicative</code> and <code>Data.Maybe</code>. There are also instances for <code>Either</code>, <code>Array</code>, <code>List</code>, etc. 
</div>

## Monad

Let's see what happens if we have a `getUser` function from a `String` value to a `Maybe User` value:

![](/img/cards/posts/functional-programming-sparks-joy/monad-initial-function.png)

and we don't have a `String` value available to be provided to the function but a `Maybe String` value.

Then, we can think about the `Maybe` **functor** to have a `Maybe String` value as an input:

![](/img/cards/posts/functional-programming-sparks-joy/monad-problem.png)

However, the result will be a `Maybe (Maybe User)` value.

How can we get just a `Maybe User` value?

Flattening `Maybe (Maybe User)` into `Maybe User`:

![](/img/cards/posts/functional-programming-sparks-joy/monad-solution.png)

Both operations are considered together by `bind` from a **monad**:

```
bind :: forall a b. m a -> (a -> m b) -> m b
```

![](/img/cards/posts/functional-programming-sparks-joy/monad-solution-details.png)

Following the example of the `getUser` function, it's possible to get a `Maybe User` value from a `Maybe String` value, because the instance of `Monad` for `Maybe` is already available in PureScript:

```
user :: Maybe User
user = bind (Just "12345") getUser
```

or using an _infix_ function application (in this case, `>>=` is the equivalent to `bind`):

```
user :: Maybe User
user = (Just "12345") >>= getUser
```

It's said that **monads** are useful to chain dependent functions in series:

![](/img/cards/posts/functional-programming-sparks-joy/monad-chain.png)

<div class="note">
<strong>Note</strong>: The ability to wrap a value to a context is done by the <code>pure</code> function from a <strong>functor</strong>. For instance, from a <code>String</code> value to a <code>Maybe String</code> value.
</div>
