---
layout: post
asset-type: post
title: The power of accessibility
description: It's not only related to people with disabilities
date: 2018-11-11 12:00:00 +00:00
last_modified_at: 2021-09-12 12:00:00 +00:00
category: talks
image:
   src: /img/cards/posts/power-of-accessibility/cover.jpg
---

## Slide deck

<iframe title="Slides: The power of accessibility" src="//www.slideshare.net/slideshow/embed_code/key/3liBRVTtqf0Kfw" width="100%" height="485" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe>

## Video

<iframe title="Talk: The power of accessibility" width="100%" height="315" src="https://www.youtube.com/embed/MdmFy_zls1g" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

Captions weren't generated automatically and it's not possible to contribute with them, so the transcript is included in the next section.

## Transcript

### [Text on screen: Thanks]

Let's start!

I like to start with the most important thing: showing gratitude.

Firstly, thanks to Carlos Blé who encouraged me to participate in this event.

Thanks to the organization for all the facilities to be here.

And last but not least, thanks to everyone for being here with me.

### [Text on screen: About me]

I'm just gonna tell you one thing about me. The thing I'm most proud of.

Nowadays, we're used to seeing a lot of initiatives for encouraging women towards STEM careers.

However, I decided to study Computer Engineering because of a near female reference: my mother.

My mother programmed in Cobol during the 70s. Punch cards were used then and she still keeps one of those cards.

I'm sure that's the reason why I'm working in this profession.

### [Text on screen: Why this talk?]

I'm not a specialist on accessibility. However, I consider that all of us should have awareness of accessibility regardless of being generalist or specialist ones.

Without that awareness, we could introduce barriers into software content, applications, etc.

Not only into software development.

For instance, who of you has ever spent time formatting a piece of source code for a post or a presentation?

Yeah, it's very common. Me too.

And who of you after spending too much time has decided to create an image? A screenshot or a tool that formats it with colours.

Yeah, me too.

If we create a post with images for source code, assistive technology will just notice the text around without the source code.

I wasn't aware about it until I read a complaint at Twitter by a person with vision impairment who couldn't solve his current problem despite finding a post with the solution. The source code appeared on images.

More things happened to me.

When reviewing a screencast that I recorded a long time ago, I realized that it had wrong auto-generated captions. Oh no, if someone tried to follow the screencast with those captions!

YouTube allows to fix those captions and also has an option to be open for community contributions.

More things.

I shared some slides via SlideShare and I realized that the transcript with the included text appeared below and the number of slides didn't match. Why? Because I usually include a lot of slides without text, just images.

What could I do? An idea could be including a hidden text box in those slides.

More things!

Another thing that I saw at Twitter: a composed hashtag should be written in upper camel case for pauses with the screen readers.

On the other hand, tweets with just plain images or gifs are invisible for screen readers. Twitter includes an option to be able to provide an image description.

So I thought: why do we make so many mistakes? Because of a lack of empathy.

And why that lack of empathy? Because of a lack of knowledge.

So I decided to talk about this subject.

### [Text on screen: Goals]

I have 3 goals with this talk.

Firstly, providing enough knowledge to develop empathy.

Secondly, providing a mind map to be able to browse the accessibility guidelines afterwards.

Thirdly, motivating you to promote this subject. I'll share my slides and they can be used for it.

### [Text on screen: What's accessibility?]

I think it's important to have a clear understanding of the concept because it's commonly only associated to people with visual impairment and screen readers.

Regarding assistive technology, there are more things beyond screen readers: voice recognition tools, mouth sticks, head pointers, braille keyboards, single-switch access mouses, eye tracking, among others.

Regarding disabilities, beyond visual impairment: auditory, speech, physical, neurological, cognitive, ... and any of us could have a temporary disability because of an accident.

On the other hand, accessibility is not only useful for people with disabilities. All of us will have benefits from accessibility when getting older. It's not necessary to wait for it to see those benefits:

* If we are in an environment under hard lighting conditions, we can continue reading a page if it has a good contrast.
* Mobile applications that allow voice commands are useful when driving.
* Video captions are very useful when learning a language.
* Alternative texts for images are very useful at low coverage areas to avoid failure icons and to be able to keep track of the content.
* Multimedia files aren't indexable. A transcript is indexable.
* Search engines not only index the content but also the structure via the headers.

Finally, if we pursue easy-to-understand and easy-to-use applications, it will impact on the quality.

### [Text on screen: Concepts]

Accessibility term can be found as `a11y` because there are 11 characters between `a` and `y`. It's a numeronym like `i18n` (internationalization) and W3C (World Wide Web Consortium).

The initiative from W3C that is focused on accessibility: Web Accessibility Initiative (WAI).

Under WAI, accessibility guidelines are organized according to the target:

* Tools to generate web content (like CMS tools).
* Web content.
* Tools to show web content (browsers and multimedia tools).

All the accessibility guidelines will finish with `AG`.

Following the previous list, the accessibility guidelines are, respectively:

* `ATAG`: Authoring Tool Accessibility Guidelines.
* `WCAG`: Web Content Accessibility Guidelines.
* `UAAG`: User Agent Accessibility Guidelines.

I'll be focused on `WCAG` during the rest of the talk.

And one more thing: `WAI-ARIA` (Accessible Rich Internet Applications).

By the way, `ARIA` is preceded by `WAI` because ARIA may be confused with an aria by Johann Sebastian Bach. Sorry, just kidding.

`WAI-ARIA` provides attributes which add semantics to HTML elements.

Just an example. A `div` element as a checkbox:

```
<div class="checkbox checked">
    I want to receive additional offers.
</div>
```

It uses 2 classes:

* `checkbox` to be displayed as a checkbox.
* `checked` to be selected by default.

After DOM is interpreted, the `div` element is seen as:

* Role: a text.
* Value: `I want to receive additional offers`.

`WAI-ARIA` to the rescue:

```
<div role="checkbox" aria-checked="true">
    I want to receive additional offers.
</div>
```

`role` and `aria-checked` are attributes provided by `WAI-ARIA` despite that `role` is not preceded by `aria` prefix.

Then, it's seen as:

* Role: a checkbox.
* Name: `I want to receive additional offers`.
* State: checked.

Great! Oh, wait! Doesn't an `input` element with `checkbox` type exist?

```
<label>
    <input type="checkbox" checked>
    I want to receive additional offers.
</label>
```

Why to use the previous `div`?

As Rob Dodson said:

> The first rule of ARIA is: don't use ARIA. If you can avoid it, just don't use it.

Here the links of this rule:

* [Video: What's new in web accessibility](https://www.youtube.com/watch?v=wkvslBGkhZY)
* [Document: First rule of WAI-ARIA](https://www.w3.org/TR/2018/WD-using-aria-20180927/#firstrule)

I'd recommend all the content by Rob Dodson.

In summary, `WAI-ARIA` is useful for those cases in which semantic meaning must be provided. For instance, think about a user selection that impacts on another part of the page: assistive technology should know that change happened to be able to warn the user.

### [Text on screen: Accessibility Principles]

About content and user interface:

* Perceivable
* Operable
* Understandable
* Robust

Let's see specific cases about every principle.

#### [Text on screen: Perceivable]

All the elements of the web content must be perceivable.

The most common case is about adding an alternative text to an image.

`alt` attribute for `img` HTML element:

* Used to describe the image.
* Avoid line breaks.
* Empty if decoration or to avoid duplication.
* Don't begin with "picture of ..." or "photo of ..." to avoid redundancy because it's an `img` element. Information overload can be as uncomfortable as a lack of information.

Another case, the contrast. [The website by Léonie Watson](https://tink.uk) includes a lot of content about accessibility and an option to use a dark theme.

#### [Text on screen: Operable]

To be able to interact with the content.

Headings are really important. One of the first things that a person with disabilities makes after a page is loaded: listing the headings to know what information it includes. 

[Accessibility of the new Services page](https://dataingovernment.blog.gov.uk/2015/03/17/accessibility-of-the-new-services-page) shows how a screen reader provides the list of the headings together with the correspondent level.

About headings:

* Meaningful sequence, a logical order.
* Don't use them to make text bigger or bold. Oh, I did it a long time ago!!
* Only for headings!
* Try to have just one `h1` per page.
* Don't focus! It's already a heading.

About how to write good links:

* Don't use "here" but add more text like "Buy the most amazing treehouse here". If "here" is only used and the links are listed, "here, here, here, ..." won't provide useful information.
* Don't use "more" or "learn more". Use more text on the link or add a link on the heading.

Let's play a game! Button or link?

[Image on screen: The text "Next lesson" in a box with round corners]

It looks like a button but it says "Next lesson". It's just useful to go to other content. It doesn't imply an action. So it's a link.

[Image on screen: The text "Add to cart" with the style of a link]

It looks like a link but it's a button. It implies an action to add an element to the cart.

Don't interchange buttons and links. Don't use a `button` HTML element for a link just to get its style.

I found this note at [w3schools.com](https://www.w3schools.com):

> If you use the `<button>` element in an HTML form, different browsers may submit different values. Use `<input>` to create buttons in an HTML form.

About focus:

* Any control a user can interact with or provide input to should be focusable.
* By default:
    * Form elements.
    * Buttons.
    * Links.
* Not headings!
* If an element doesn't acquire the focus and it's necessary for its meaning, it should be provided.
* To make a custom control focusable: `tabindex=”0”`.
* To remove an element from natural tab order: `tabindex=”-1”`. Then, it can be focused by Javascript.
* And no more! Avoid controls with `tabindex` greater than 0.
* Be careful with CSS. Elements could be visualized in a different order to the DOM content. Let's follow a correspondence between what you see and what appears in the DOM.

About links:

* Don’t remove the visible indication. Oh, I also removed it!
* So don't use `:focus { outline: none; }`.
* Alternatives:
    * Style the outline.
    * Style the element when focused.
    * Remove outlines for mouse users only (be careful).

#### [Text on screen: Understandable]

Maybe the value is not placed on the `lang` attribute for the `html` element. However, it's useful for:

* Search engines.
* Screen readers.
* etc.

Use a clear language:

* Avoid dashes between numbers. For instance, it's better to read `1 to 3` instead of `1 dash 3`.
* Avoid abbreviations. For instance, don't use `Feb` instead of `February`.
* Avoid slang words or use the `abbr` element. For instance:
```
<abbr title="Greatest Of All Time">
    GOAT
</abbr>
```

#### [Text on screen: Robust]

To receive the same content or to interact in the same way regardless of the tool or assistive technology.

All the interactive elements must be identified by:

* Role (or type).
* Name (title or label).

And, if applicable, by:

* Value.
* State.
* etc.

### [Text on screen: Checking the accessibility conformance]

How can I know if my web application is accessible?

Sorry, there is no silver bullet. I cannot provide just a single tool to check it.

Let's see the use of the Audits option in Chrome. I recorded this [Chrome audit in action](https://www.youtube.com/watch?v=eKhCrmD5NAw) to show how the results always include "Additional items to manually check".

So, what can we do? Let's see some ideas.

Try to navigate with the keyboard:

* Using tab to move to the elements that must receive the focus, spacebar to make a selection into a checkbox, enter to submit and arrow keys for a combobox, for example.
* Is there a logical order?
* Is focus visible?
* Is there a way to skip long sections like a navigation menu?

For instance, [Introduction to Web Accessibility by W3C](https://www.w3.org/WAI/fundamentals/accessibility-intro/) has a long upper menu and sidebar menu. Imagine that you must wait to listen to all the menu entries until the text of the page. So it appears the `Skip to Content` option as the first focusable element to go to the text directly.

Even there are pages where that option is hidden and it appears when clicking the tab key.

Besides, does the heading list make sense?

This code can be copied and pasted into the browser console to show the indented list of headings and to know if it makes sense:

```
for (var i = 0, headings = $$('h1, h2, h3, h4, h5, h6'); i < headings.length; i++) {
    headingLevel = headings[i].tagName.substr(-1);
    console.log("\t".repeat(headingLevel) + " " + headingLevel + ". " + headings[i].textContent.trim());
}
```

It can be tried on [Wikipedia: Tenerife](https://es.wikipedia.org/wiki/Tenerife).

More ideas:

* Try it with a screen reader to know the experience.
* Include tools during the continuous inspection phase of the continuous integration. I included some tools at the end.
* Create an accessibility lab. [Accessibility lab Involving Users in Evaluating Web Accessibility](https://www.w3.org/WAI/test-evaluate/involving-users) explains how to do it.

### [Text on screen: Recommendations]

* Consider accessibility from the start of a project. If we try a tool at the end, we'll get frightened with the results!
* Look for accessibility tools on your Javascript framework. I included links at the end as well.

### [Text on screen: Curiosities]

[Felienne](https://www.felienne.com) made the keynote [How does code sound?](https://www.youtube.com/watch?v=q5wJtk5Afck) at [Lambda World](https://www.youtube.com/c/LambdaWorld/featured) a few days ago. I should mention it in this talk, I thought. Why? Look at these pictures.

```python
class Person:
    def __init__(self):
        ...
```

The method for class instantiation in Python would be read by a screen reader as `def underscore underscore init underscore underscore`.

Oh, I can't believe it!

Another example, when accessing to the attribute of an object:

```python
harry.name
```

It would be read as `harry pause name` because the dot is a pause.

Felienne said that she did some experiments with colleagues and a simple thing like an assignment of a value to a variable was read in many different ways. So she said that we should agree on code phonology. Goosebumps! There is much to be done!

More curiosities! This is the [Screen Reader User Survey](https://webaim.org/projects/screenreadersurvey7) from last year. Look at the top 5 of the problematic items:

1. **CAPTCHA.**
2. **Unexpected changes.** Do you remember that WAI-ARIA could help with the changes that impact on other parts of the page?
3. **Links or buttons without sense.** Do you remember the game about links and buttons?
4. **Flash content.** Oh, it still exists.
5. **Lack of keyboard accessibility.** So it's not possible to navigate with the keyboard.

From my point of view, I'd also place CAPTCHA at the first place! Even for a newsletter subscription! Oh, I made a mistake, I selected the wrong box!

Another curiosity, the [Accessibility Club](https://accessibility-club.org). It started in 2014. A group of developers had a meeting with a person with a visual impairment to see their experience with the web content.

Another one! Oh, I love this one! [The A11Y Project](https://a11yproject.com). Look at its principles:

* **Digestible**. A big barrier could be found because of the amount of documentation and guidelines. These initiatives are necessary to make the accessibility documentation digestible.
* **Up-to-date**. Because accessibility is continuously progressing.
* **Forgiving**. I love this principle. They know that all people make mistakes because of a lack of knowledge and there is no reason to give up and to stop encouraging people with this subject.

### [Text on screen: Accessibility to the power]

Tim Berners-Lee said:

> The power of the Web is in its universality. Access by everyone regardless of disability is an essential aspect.

I don't know if you follow Tim Berners-Lee. He took a sabbatical from MIT, reduced his involvement with the W3C, and created a new company with an interesting initiative.

So everyone should bear accessibility in mind.

Otherwise, we can create barriers in the technological world as well.

Not for equality but equity. Let us not exclude anybody. Everyone should use the right tools to get the same functionality.

The more you know about it, the more empathy is possible.

Thank you so much!

## Acknowledgments

Thanks to:

* [Carlos Blé](https://twitter.com/carlosble) for his trust to participate as a speaker at [JS Day Canarias 2018](https://jsdaycanarias.com).
* The awesome organizers of the event, [Dailos R. Díaz Lara](https://twitter.com/dDiaLar) and [Iván Bacallado Trujillo](https://twitter.com/Ivanbtrujillo), for all the facilities to be there.

## Errata

I've included an additional slide about "only one h1 per page". It's not a Success Criterion. It's a recommendation.

On the other hand, I've found several articles about this recommendation. It was said that it just made sense before HTML5. However, [HTML5 document outline is not implemented](http://html5doctor.com/computer-says-no-to-html5-document-outline) by assistive technology. You can read the advice and requirements about headings in [HTML5 specification](https://www.w3.org/TR/html/sections.html#the-h1-h2-h3-h4-h5-and-h6-elements).

Thanks to Steve Faulkner, George Kerscher, Katie Haritos-Shea, Phill Jenkins, Michael Wayne Harris and Morten Tollefsen for their answers in [WAI Interest Group Discussion list](https://lists.w3.org/Archives/Public/w3c-wai-ig/2018OctDec/0106.html).

## Resources

W3C:

* [Web Accessibility Initiative (WAI)](https://www.w3.org/WAI)
* [Web Content Accessibility Guidelines (WCAG) Overview](http://www.w3.org/WAI/intro/wcag)

Developers sites:

* [MDN web docs](https://developer.mozilla.org/en-US/docs/Web/Accessibility)
* [Google Web Fundamentals - Accessibility](https://developers.google.com/web/fundamentals/accessibility)

WebAIM resources:

* [WebAIM’s WCAG 2 Checklist](https://webaim.org/standards/wcag/checklist)
* [WAVE Evaluation tool and extension](http://wave.webaim.org)
* [Color contrast checker](https://webaim.org/resources/contrastchecker)

Training:

* [A11ycasts by Rob Dodson](https://www.youtube.com/playlist?list=PLNYkxOF6rcICWx0C9LVWWVqvHlYJyqw7g)
* [Udacity course, Web Accessibility by Google](https://eu.udacity.com/course/web-accessibility--ud891)

Some tools related to frameworks:

* [Angular](https://github.com/angular/protractor-accessibility-plugin)
* [Polymer and Web Components](https://github.com/Polymer/web-component-tester#a11ysuite)

Some tools for continuous inspection:

* [Lighthouse](https://github.com/GoogleChrome/lighthouse/blob/master/docs/readme.md#using-programmatically)
* [AXE](https://www.deque.com/axe)
* [AccessLint](https://github.com/accesslint/accesslint.js)

Some screen readers:

* Windows: Narrator, NVDA.
* Mac: VoiceOver.
* Linux: Orca.

## Valuable feedback after the talk

Shared by [ladyCircus](https://twitter.com/ladyCircus):

* About a11y: She found a complaint about the word “a11y”, because it can be confused with “ally”.
* [Quick tip: a11y and a brief numeronyms primer](https://a11yproject.com/posts/a11y-and-other-numeronyms)

Shared by [nixerebo](https://twitter.com/nixerebo):

* Avoid justified text: The uneven spacing between words in fully justified text can cause "rivers of white" space to run down the page making reading difficult and in some cases impossible.

Shared by [Jorge C.](https://twitter.com/_jcortesa):

* [Storybook addon to make UI components more accessible](https://github.com/storybooks/storybook/tree/master/addons/a11y)

Shared by [Joan León](https://twitter.com/nucliweb):

* About w3schools.com: The site derives its name from the World Wide Web (W3), but is not affiliated with the W3C.
* [Accessibility boilerplate](https://github.com/jbmoelker/a11y-boilerplate)
* Accessibility with React:
    * [Code Linter](https://www.24a11y.com/2017/reacts-accessibility-code-linter)
    * [List of React a11y components and projects](https://github.com/jeffprinty/awesome-react-a11y)
* [Static AST checker for accessibility rules on JSX elements](https://www.npmjs.com/package/eslint-plugin-jsx-a11y)
* [A desktop app to automatically detect accessibility issues on web pages](http://open-indy.github.io/Koa11y)
* [CSS file to warn about possible risks and mistakes in HTML code](http://ffoodd.github.io/a11y.css)
* [Improving the Accessibility of 24 ways](https://css-tricks.com/improving-accessibility-24-ways)
* [More accessibility resources](https://docs.google.com/document/d/1w9yPZRUKOBLVo8kV1rA7LnDJSz-x8vcHD7eri1ApMuk/edit#heading=h.yx09n0saeyai)

More feedback:

* [Accessibility in Bootstrap that uses WAI-ARIA attributes](https://getbootstrap.com/docs/4.1/getting-started/accessibility)

When you give a talk, you receive more than you give. Thank you!

## More resources

* [Accessibility Scotland](https://accessibility.scot).
* [5 Tools For Automated Accessibility Audits](https://benrobertson.io/accessibility/tools-for-website-audits) by [Ben Robertson](https://twitter.com/banquos_ghost).
* [Reviews of accessibility resources](https://a11y.reviews).
* [An accessibility analysis of the top 1,000,000 home pages](https://webaim.org/projects/million/).
* [How does your website "sound" like?](https://www.youtube.com/watch?v=yKYA-7tczuk) by [Adrián Bolonio](https://twitter.com/bolonio).
* [Accessibility examples](https://codepen.io/collection/XJNepY) by [Adrián Bolonio](https://twitter.com/bolonio).
* [tota11y: a toolbar to point out errors and ways to fix them](https://khan.github.io/tota11y/). Add it as a bookmark!
* [Vision simulator for Chrome](https://accessgarage.wordpress.com/2013/02/09/458/).
* [How to make images accessible](/2018/12/18/how-to-make-images-accessible.html).
