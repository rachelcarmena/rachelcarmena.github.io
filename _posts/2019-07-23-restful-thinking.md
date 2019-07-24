---
layout: post
asset-type: post
title: RESTful thinking
description: Do the current called RESTful services really use the power of the Web architecture? 
date: 2019-07-23 10:00:00 +00:00
category: coding
image:
    src: /img/cards/posts/restful-thinking/cover.jpg
---

## Motivation

Working for (old) banking institutions was another world for me. I remember that the only way to integrate with their software systems was based on file transfer and it was necessary to agree on filenames, formats, directories, time schedules and dependencies.

In other projects, the integration was based on the database (DB): sometimes sharing the same DB and other times synchronizing DBs.

However, the most common way of integration was through SOAP services. We received a huge WSDL file and we used a tool to create the client from that file. Maybe I could say that it was a _smell_: a lot of details in a single file and a tool to hide the complexity of creating a web service consumer.

Then, I knew other two ways of integration which are still commonly used: RESTful services and messaging systems. Regarding the latter, I'm referring to message queues and message brokers (I write this clarification because web services also exchange messages).

Nowadays, it seems that everybody uses RESTful services although SOAP services are still used in certain contexts for enterprise services.

Despite that, is REST (Representational State Transfer) architectural style really known? Do the currently called RESTful services really use the power of the Web architecture?

## Introduction

I think that there are so many differences between SOAP and RESTful services that maybe they are not comparable.

SOAP services expose stateful operations which implement some business logic. The contract is specified via WSDL, the message format is only XML, there isn't a standard failure management and SOAP messages are only sent via HTTP POST, among others.

On the other hand, RESTful services expose resources through data. Those data can be represented in several formats (not only XML) and they are exchanged through a stateless communication. These services can be consumed by any client in a lightweight way.

In short, RESTful services follow the benefits of the Web architecture while SOAP services only use the transport protocol.

Let's see some characteristics of RESTful services.

## RESTful Web Services

### Stateless

The service provider and consumers exchange representations of **resources**.

The consumer includes all the information necessary to understand the request.

The provider doesn't answer with an explicit application state.

This characteristic promotes the simplicity, low coupling and scalability.

### Resources

I mentioned **resources**. What are they?

As Roy Thomas Fielding wrote:

> Any information that can be named can be a resource: a document or image, a temporal service (e.g. "today's weather in Los Angeles"), a collection of other resources, a non-virtual object (e.g. a person), and so on.

### Intuitive URIs

URIs don't encode operations. URIs identify resources and the purpose of a service can be inferred from the URI.

Sometimes it's interesting to pursue the opposite for security reasons. In that case it would be necessary to have a mapping between URIs and resource handlers. We'll see a way to provide the semantic to a hard-to-guess URI later.

On the other hand, URIs can be specified through templates as follows:

```
http://my-card-game.com/game/{game_id}
```

Where `{game_id}` can be replaced by a game identifier.

It's an easy way to understand, validate or create URIs.

### Only one URI for identifying a resource regardless of the representation format

URIs don't have an extension according to the representation format of the resource. For example: .json for a JSON representation or .xml for a XML representation.

A resource is identified by only one URI while the desired representation format or media type is indicated in the `Accept` request header.

Following the example, it'd be used, respectively:

* `Accept: application/json`
* `Accept: application/xml`

### HTTP methods as actions

Resources can be manipulated through HTTP methods as actions.

We are responsible to keep the semantics of these HTTP methods according to [the specification](#resources):

* **GET** for retrieving the details of a resource. 
* **HEAD** when the consumer only wants to receive the HTTP headers.
* **OPTIONS** for checking which HTTP methods a resource supports. 
* **DELETE** for deleting a resource.
* **PUT** for **creating** a resource or **updating** the state of a resource.
* **PATCH** is an alternative to **PUT** in order to apply partial modifications to a resource. The PATCH method requests a set of changes (called "patch document") on the resource identified by the Request-URI.
* **POST**. Let's see...

As Sam Ruby and Leonard Richardson wrote:

> POST is commonly used to create subordinate resources: resources that exist in relation to some other “parent” resource.

Why not to use PUT to create those resources?

> The difference between PUT and POST is this: the client uses PUT when it’s in charge of deciding which URI the new resource should have. The client uses POST when the _server_ is in charge of deciding which URI the new resource should have. (...) The POST method is a way of creating a new resource without the client having to know its exact URI. In most cases the client only needs to know the URI of a “parent” or “factory” resource.

In summary:

> Create a new resource: HTTP PUT to a new URI, or HTTP POST to an existing URI.

> Modify an existing resource: HTTP PUT to an existing URI.

For example, Amazon S3 API: 

* [PUT for creating a bucket](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTBucketPUT.html)
* [POST for adding an object to a bucket](https://docs.aws.amazon.com/AmazonS3/latest/API/RESTObjectPOST.html)

**Note**: There is a common misunderstanding about PUT and POST. In the wrong way, it's said: PUT for updating and POST for creating. Nowadays, when remembering that I made the same mistake, I don't understand the reason why it's easy to embrace that belief. There isn't a clear relationship between the meaning of the words "put", "update", "post" and "create". Maybe our mind deceives us because of **pu**t and **up**date ;)

On the other hand, it's our responsibility to meet the method properties according to [the specification](#resources):

* **Safe**: If the defined semantic is essentially read-only and a state change on the server is not expected. The GET, HEAD and OPTIONS methods are safe.
* **Idempotent**: If the intended effect on the server of multiple identical requests is the same as the effect for a single request. The PUT, DELETE and safe request methods are idempotent.
* **Cacheable**: When responses to a method are allowed to be stored for reuse. Mainly GET and HEAD methods are cacheable.

**Note**: There is also a common misunderstanding about an idempotent HTTP method. It's focused on the intended effect on the server. That's the reason why GET is idempotent although multiple GETs of the same URI can generate a response with different data.

### HTTP status codes as response codes

It's not necessary to define error types or error codes. HTTP status codes are used as response codes.

Let's see some of them.

#### Successful operations: 2xx status codes

* **200 OK**
* **201 Created**
* **202 Accepted**: It's used for asynchronous operations. The server accepts the request and provides an URI to get the result later.
* **204 No Content**: When the server has fulfilled the request but does not need to return a payload (PUT, POST o GET with an empty representation). It's also used to indicate a successful response for a DELETE request. If the response must indicate the final state of the deleted resource: **200 OK** and a full payload with the resource representation.

#### Errors on the client side: 4xx status codes

* **400 Bad Request**: It's used when returning the payload with the same received data plus a comment about the reason why it's a bad request.
* **401 Unauthorized**
* **404 Not Found**: When the client requests a resource that doesn't exist. It's also used in some responses in order not to give too many details to consumers when thinking about security.
* **405 Method Not Allowed**: It's used with the `Allow` header in order to know which HTTP action or actions are allowed.
* **409 Conflict**: For example, a requested update cannot be executed.
* **411 Length Required**: If `Content-Length` header in a request is missing, the service cannot determine if it's a huge payload to cause a DoS attack.

#### Errors on the server side: 5xx status codes

* **500 Internal Server Error**
* **503 Service Unavailable**: It's used with a `Retry-After` header.

HTTP status codes are useful to manage situations as a change of a resource URI. In that case, it can be communicated when sending the HTTP status code **301 Moved Permanently** or **303 See Other** in the response (3xx status codes = redirection).

### Entity tag value for managing the changes of the state of a resource over its lifetime

The server can associate a string token with a certain state of a resource (like a version number): an entity tag value which will appear in `ETag` header of a response.

Then, the client can indicate that entity tag value in a request header to condition the request to a particular state of the resource.

The conditional request headers are:

* `If-Match: <entity_tag_value>` = apply the request if the resource hasn't changed since the last received representation
* `If-None-Match: <entity_tag_value>` = apply the request if the resource has changed since the last received representation

Other uses:

* `If-Match: *` = apply the request if the resource exists
* `If-None-Match: *` = apply the request if the resource doesn't exist

A related HTTP status code: **412 Precondition Failed**

Advantages:

* Services perform less computation because they know the `ETag` to execute the request. Higher response time from services.
* Avoiding errors because of managing an out-of-sync resource.
* It may be cheaper for a service to compare `ETag` values rather than to generate a representation.
* Preventing race conditions between clients.

Disadvantages:

* The generation of the entity tag value in the server can be computationally expensive. It's important to select a cheap way to generate it from the state of the resource and to be unique.

### Beyond CRUD services

As URIs identify resources, there is a trend to create CRUD services. In that case, there is a high coupling with consumers as well as the services are like an interface to operate with the DB. 

Let's go beyond...

### Links in the resource state representation

Resource state representation can include links to related resources or next business steps.

This is the basis of **HATEOAS** (Hypermedia As The Engine Of Application State) from REST architectural style.

The consumer receives a resource representation with links and one of them will be chosen as the next step.

In this way, we can model state transitions or business processes when transiting links between resources.

The consumer doesn't have to depend on a big number of static URI templates or contracts. It's enough with a few URIs that act as entry points.

Therefore, the provider can evolve the internal business rules more easily.

**Note**: Links can also be used to split the resource representation in different parts. The decisions about which data to show in the representation and which data will be obtained when following a link are based on the size of the payload, performance and cacheability, among others.

**Note**: Although we are used to representing relations between entities through identifiers (think about the foreign key in a database), we don't use identifiers but URIs to address the related resources in the resource representation. If we use identifiers, the consumer would have to know how to build the URI of the related resource and it's better if that knowledge is retained in the service provider.

#### One step further

If we are using a JSON representation, an example of link could follow this format:

```json
"link": {
    "uri": "...",
    "rel": "..."
}
```
 
The URI is together another link, `rel` attribute, where there is information about the meaning or purpose of the link.

How could that information be understood by machines? How could computer-to-computer interactions be possible without the need of a human interaction to interpret and to consume it?

That's one of the goals of Semantic Web Technology, machine learning, machine-processable formats, directed labeled graphs, ontontologies to represent knowledge, etc.

## Other things

### Security

HTTPS provides **confidentiality** and **integrity** on transport layer. Besides that, we need authentication and authorization management:

* **Authentication** to identify the consumer (for example, OpenID).
* **Authorization** to control what a consumer can do (for example, OAuth).

### Postel's Law

It's said that it's followed by robust services:

> Be conservative in what you do; be liberal in what you accept from others.

In other words: be strict about the generated resource representations in responses, be permissive about the received representations in requests.

This law made me think a lot and I don't know if that lesson is really useful in all cases. I'm thinking about browsers that render content although it's wrong (lack of ending tags, lack of accessibility data, etc) or, in general, standards that are not followed.

Maybe that permissiveness is helping us to progress very quickly though we are accumulating debt because of it.

I remember when my old colleague [Erik Torres](https://twitter.com/ertorser) talked about **responsible** freedom.

Lots of thoughts...

## Resources

### Specifications

* [Hypertext Transfer Protocol (HTTP/1.1): Semantics and Content](https://tools.ietf.org/html/rfc7231)
* [PATCH Method for HTTP](https://tools.ietf.org/html/rfc5789)
* [Standard list of media types](http://www.iana.org/assignments/media-types/)

### API documentation

* [OpenAPI Specification (OAS)](https://github.com/OAI/OpenAPI-Specification)
* [RESTful API Modeling Language (RAML)](https://raml.org)

### Initiatives

* [OpenAPI Initiative](https://www.openapis.org)
* [API Directory](https://www.programmableweb.com/category/all/apis)
* [API Style Book](http://apistylebook.com)
* [The RESTful cookbook](http://restcookbook.com)

### Tools

* [OpenAPI Specification (OAS) and Swagger](https://swagger.io/solutions/getting-started-with-oas/)
* [Using curl to automate HTTP jobs](https://curl.haxx.se/docs/httpscripting.html)
* [Postman API Development Environment](https://www.getpostman.com)
* [Pact — Consumer-driven contract testing Tool](https://docs.pact.io)
* [Dredd — HTTP API Testing Framework](https://dredd.org)

## Further reading

* [Website: Enterprise Integration Patterns](https://www.enterpriseintegrationpatterns.com)
* [Paper: Architectural Styles and the Design of Network-based Software Architectures](https://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm) by Roy Thomas Fielding
* [Slides: What's the origin of REST architectural style?](https://www.slideshare.net/raquelmorenocarmena/whats-the-origin-of-rest-architectural-style) by me
* [Book: RESTful Web Services](http://shop.oreilly.com/product/9780596529260.do) by Sam Ruby and Leonard Richardson
* [Book: REST in practice: Hypermedia and Systems Architecture](http://shop.oreilly.com/product/9780596805838.do) by Jim Webber, Savas Parastatidis and Ian Robinson

