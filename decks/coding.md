---
layout: default
image:
    src: /img/decks/coding.jpg
---

{% assign category = page.name | remove: ".md" %}
{% include deck.html %}
