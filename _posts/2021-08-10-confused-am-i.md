---
layout: post
asset-type: post
title: Confused am I
description: Things that can be prone to misunderstandings
date: 2021-08-10 10:00:00 +00:00
last_modified_at: 2021-10-24 12:00:00 +00:00
category: [coding,reflections]
image:
    src: /img/cards/posts/confused-am-i/cover.jpg
---

Some things can be prone to misunderstandings in this profession.

I think I didn't realize about some of them until mentoring or receiving a question.

## Continuous delivery and continuous deployment

The reason for this post.

I made this mistake during a presentation in 2013:

![Wrong slides: continuous deployment appears before continuous delivery](/img/cards/posts/confused-am-i/wrong-slides.png)

It could sound good: deployment on a staging environment and delivering when publishing on a production environment. No, I was wrong!

**Continuous delivery** should be the next step after **continuous integration**.

**Continuous deployment** just happens when the automated pipeline doesn't stop on the staging environment: every change follows the entire pipeline to the production environment automatically.

Martin Fowler warned about this misunderstanding in [Continuous Delivery](https://www.martinfowler.com/bliki/ContinuousDelivery.html).

## 401 and 403

Let's see these HTTP status code that are used to represent errors on the client side:

* 401 Unauthorized
* 403 Forbidden

According to [Hypertext Transfer Protocol (HTTP/1.1): Authentication](https://datatracker.ietf.org/doc/html/rfc7235):

> The 401 (Unauthorized) status code indicates that the request has not been applied because it lacks valid authentication credentials for the target resource.

And [Hypertext Transfer Protocol (HTTP/1.1): Semantics and Content](https://datatracker.ietf.org/doc/html/rfc7231) provides the description for the second one:

> The 403 (Forbidden) status code indicates that the server understood the request but refuses to authorize it.

The first one is related to authentication and the second one to authorization.

So I would have preferred **401 Failed Authentication** and **403 Unauthorized**.

## 406 and 415

Another possible misunderstanding with HTTP status codes on the client side:

* 406 Not Acceptable
* 415 Unsupported Media Type

According to [Hypertext Transfer Protocol (HTTP/1.1): Semantics and Content](https://datatracker.ietf.org/doc/html/rfc7231):

> The 406 (Not Acceptable) status code indicates that the target resource does not have a current representation that would be acceptable to the user agent, according to the proactive negotiation header fields received in the request (Section 5.3), and the server is unwilling to supply a default representation.

> The 415 (Unsupported Media Type) status code indicates that the origin server is refusing to service the request because the payload is in a format not supported by this method on the target resource.

I would have preferred **406 Unsupported Requested Media Type** and **415 Unprocessable Request**.

## PUT and POST

_PUT for updating, POST for creating_ is repeated like a mantra mistakenly.

PUT is also used for creating a new resource.

According to [Hypertext Transfer Protocol - HTTP/1.1](https://www.ietf.org/rfc/rfc2616.txt)

> The fundamental difference between the POST and PUT requests is reflected in the different meaning of the Request-URI. The URI in a POST request identifies the resource that will handle the enclosed entity. (...) In contrast, the URI in a PUT request identifies the entity enclosed with the request (...).

I also talked about it in [RESTful thinking](/2019/07/23/restful-thinking.html).

## True and false on the command line

Look at this format of command:

```
$> <command> || <command-if-failure>
```

It works in this way:

* If the first command finishes successfully (it returns `true`), a short-circuit happens and the second command won't be executed.

* If the first command fails (it returns `false`), the second command will be executed.

I realized about the following fact when explaining it:

* The first command will return `true` if it finishes successfully.
* When a command finishes successfully, it returns 0 exit code.
* 0 usually represents `false`.

Oh!

Shells include built-in commands like `test` which is playing in this case:

> `test` returns a status of 0 (true) or 1 (false) depending on the evaluation of the conditional expression _expr_.

Finally:

```
$> <command-1> || <command-2>
```

would be equivalent to:

```
if <command-1>; then
    exit 0
else
    <command-2>
fi
```

On the other hand:

```
$> <command-1> && <command-2>
```

would be equivalent to:

```
if <command-1>; then
    <command-2>
fi
```

## int is not the only integer data type

If a programming language provides a data type named `int`, it can be thought as the only integer data type. I realized this when mentoring a friend.

Let's see the integer data types for different programming languages.

C provides `int` and a list of modifiers: `short`, `long`, `unsigned`, `signed`.

JVM-based programming languages like Java, Kotlin, and Scala provide these integer data types:

| **Integer data type** | **Range of values** |
|-|-|
| `Byte` | From -2^7 to 2^7-1. |
| `Short` | From -2^15 to 2^15-1. |
| `Int` | From -2^31 to 2^31-1. |
| `Long` | From -2^63 to 2^63-1. |

The data type names start with lowercase in Java.

What about CLI-based programming languages?

* C# provides `sbyte`, `byte`, `short`, `ushort`, `int`, `uint`, `long`, `ulong`, `nint`, and `nuint`. More details in [C#: Characteristics of the integral types](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/builtin-types/integral-numeric-types#characteristics-of-the-integral-types).

* F# provides `byte`, `sbyte`, `int16`, `uint16`, `int`, `uint`, `int64`, and `uint64`. More details in [F#: Basic types](https://docs.microsoft.com/en-us/dotnet/fsharp/language-reference/basic-types).

I like the second one when the number of bits is added together `int`.

Let's see Rust: `i8`, `u8`, `i16`, `u16`, `i32`, `u32`, `i64`, `u64`, `i128`, and `u128`. I love it! There is no room for error. More details in [Rust: Integer types](https://doc.rust-lang.org/book/ch03-02-data-types.html#integer-types).

It's also clear with Go: `int`, `int8`, `int16`, `int32`, `int64`, `uint`, `uint8`, `uint16`, `uint32`, and `uint64`. And `byte` is provided as an alias for `uint8`.

## Code Smell: Primitive obsession

When I learned this code smell that appeared in [Refactoring](https://www.refactoring.com) book, I received an example of a function with several `String` parameters:

- The code was "polluted" with the choice of `String` type for those cases. What if it was necessary to use a different type?
- The compiler couldn't know if the arguments were being properly provided in a call. The meaning was just on the parameter names.
- Those parameters had a related behavior that wasn't being encapsulated.

The fix consisted on replacing `String` type with user-defined types for those parameters.

However, the code smell is called **primitive obsession** and `String` is not a primitive type:

> The String class is not technically a primitive data type, but considering the special support given to it by the language, you'll probably tend to think of it as such. [Java: Primitive Data Types](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)

> The primitive types are Boolean, Byte, SByte, Int16, UInt16, Int32, UInt32, Int64, UInt64, IntPtr, UIntPtr, Char, Double, and Single. [C#: Type.IsPrimitive Property](https://docs.microsoft.com/en-us/dotnet/api/system.type.isprimitive)

And this code smell is widely explained with `String` type. Even [WikiWikiWeb](https://wiki.c2.com) relates [primitive obsession](https://wiki.c2.com/?PrimitiveObsession) with [NoStrings](https://wiki.c2.com/?NoStrings).

On the other hand, this code smell could apply to any built-in type of a programming language. For instance, it could happen with a built-in collection type.

So I would have preferred the name **obsession with built-in types**, primitive or non-primitive.

## DB views

`CREATE VIEW` doesn't actually create a view as could be expected but a query that will be run every time it's referrenced.

A view is actually created by `CREATE MATERIALIZED VIEW`, when supported by the DBMS, or other SQL sentences to materialize the view.

I would have preferred `CREATE QUERY` and `CREATE VIEW`, respectively.

## Editing a comment or a message

Did this situation happen to you? Receiving a notification about a comment or a message, reading the text, thinking about it, opening the corresponding tool to answer and finding an entirely different text. The user edited the text after submitting it. And sometimes the message was edited more than 5 times afterwards.

What about this other one? Reading a message, coming back after a few minutes and that message was edited with a long list of items. There is no guarantee that those additional data will be read.

I'm always warning people around me about it.

Should communication tools allow us to edit the messages?

It seems they are doing their best in this sense:

* Sending just one notification with the first version of the text.
* Allowing an option to preview the text if it's not a WYSIWYG editor.
* Noting that the text was edited.
* Allowing to see the editions history in some cases.

Could they do anything else to avoid these misunderstandings?

Maybe adding a warning message when a user is going to edit an existing message: 

> The initial message has already been read and notified. Please, consider writing a new message to avoid possible misunderstandings.

I think I understand that a tool like Twitter doesn't allow to edit the submitted tweets:

* A reply could be obsolete after editing a tweet.
* The users that retweeted it or liked it might disagree with the updated content.
* The updated content might not be read by those users.

However, it's one of the most requested features.

Why not delete the tweet and create a new one?

Maybe too many steps: copy, delete, new, paste, edit the text, and submit.

Ok, why not add a Fix button to simplify that task?

> The initial tweet will be deleted and a new tweet will be created when submitting it.

Just three steps: fix, edit the text, and submit. Internally, it would be like creating a new tweet from a template and keeping the id of the initial tweet to delete it. In other words, deleting and creating at the same time instead of updating.

> You retweeted, liked or replied these fixed tweets:

Could the communication or project management tools follow the same idea?

Does this issue come from developers because we are always thinking about CRUD operations? What if one of them isn't appropriate for a certain tool?
