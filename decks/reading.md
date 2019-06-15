---
layout: default
image:
    src: /img/decks/reading.jpg 
---

{% assign category = page.name | remove: ".md" %}
{% include deck.html %}
