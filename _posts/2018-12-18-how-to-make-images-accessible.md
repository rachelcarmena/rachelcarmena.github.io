---
layout: post
asset-type: post
title: How to make images accessible
description: Considering different types of images
image:
   src: /img/cards/posts/how-to-make-images-accessible/cover.jpg
---

## Introduction

We make mistakes about accessibility, because of a lack of empathy. And we lack that empathy, because a lack of knowledge.

Juanjo Montiel is a developer who is always complaining about the use of images to insert source code in posts, because the text within images is invisible to screen readers. When another developer apologized for it, he said:
> Don't worry! You never imagined that a blind person read your code, didn't you? That's it, really!

There are alternatives to have source code within images, like formatting the text or using [Gist](https://gist.github.com). I don't know if the content of a Gist snippet is easily accessible, but it provides a link to view the raw content.

However, what if we have source code within images? Could we provide an additional element to make that content accessible? This is the question that Juanjo Montiel tried to answer. I admire he was looking for it, respecting the use of the image, in other words, respecting the development behind the functionality of getting images with colored and formatted source code.

At the beginning, he thought about the use of a visually hidden aside. However, that solution is not recommended for universal accessibility. For example, a user with low vision needs to enlarge the text.

## According to the image

For simplicity, we could identify three types of images:
* Decorative images
* Images that can briefly be described
* Images that need an extended description

If an image is decorative, it must be marked with an empty alternative text (`alt=""`) and the presentation role (`role="presentation"`).

If an image can briefly be described, we can write that description in the `alt` attribute.

If an image needs an extended description, we could think about options which have the lowest impact on the visual layout:
* **Near the image**: an HTML Details Element, which content is only visible when it's toggled into an "open" state. In this case, it's important to check if the scrolling view or the paginated view behaves correctly when expanded.
* **In another place**: it's necessary to provide a way to take the user back to the same location.

That extended description would be linked to the image with `aria-details` attribute. It's important to consider the use of text hyperlink or image hyperlink until `aria-details` attribute is widely supported.

## Source code within images

The option of adding an HTML Details Element could satisfy what we are looking for. Furthermore, it offers the possibility of copying the source code.

Therefore, if you use images, please, consider adding another element with the source code as text.

## Related topic: graphics

SVG (Scalable Vector Graphics) offers some features to make graphics accessible: it's scalable, it can store structural information about graphical shapes, it can provide an alternative equivalent, etc.

I love the definition about SVG from MDN web docs:
> SVG is essentially to graphics what HTML is to text.

If text organized with HTML is accessible, could an image in SVG format be accessible in the same way? I'm thinking about interpreting the content of a SVG file automatically. Something like SVG-to-text. Dreams can come true ;)

## Further reading

* [MDN web docs - The Details disclosure element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details)
* [MDN web docs - SVG](https://developer.mozilla.org/en-US/docs/Web/SVG)
* [WAI Tutorial - Images Concepts](https://www.w3.org/WAI/tutorials/images)
* [EPUBTEST 0340 - Extended Descriptions Accessibility Tests](http://epubtest.org/testsuite)
* [Accessibility Features of SVG](https://www.w3.org/TR/SVG-access)
* [Thread in WAI IG Discussion list](https://lists.w3.org/Archives/Public/w3c-wai-ig/2018OctDec/0128.html)
* [Contributions to warn about the use of images with source code](https://github.com/dawnlabs/carbon/commits?author=rachelcarmena)

## Acknowledgments 

* [Juanjo Montiel](https://twitter.com/kastwey), a .NET developer and the main character of this post. I still haven't met him personally, but I can tell you one thing that impressed me. He's blind and I chatted with him, before listening to him give a talk. He communicates with words much more than anyone else I've met. I'm not only talking about the message, but also about him. When I listened to him, he was exactly like I imagined.
* David Woolley
* [Jonathan Avila](https://www.levelaccess.com/leaders/jonathanavila/)
* [George Kerscher](http://kerscher.montana.com)
* [The working group on accessibility of EPUB](http://epubtest.org)

