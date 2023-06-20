---
layout: page
title: Personal
permalink: /personal/
---

#### blog posts of a personal nature

<ul class="listing">
{% for post in site.categories['personal'] %}
{% capture y %}{{post.date | date:"%Y"}}{% endcapture %}
{% if year != y %}
  {% assign year = y %}
  <li class="listing-seperator">{{ y }}</li>
{% endif %}
<li class="listing-item">
  <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time>
  <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
</li>
{% endfor %}
</ul>
