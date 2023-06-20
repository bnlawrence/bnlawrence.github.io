---
layout: page
title: Ecolife
permalink: /ecolife/
---

#### blog posts relevant to reducing my own carbon footprint

<ul class="listing">
{% for post in site.categories['ecolife'] %}
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
