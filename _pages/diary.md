---
layout: page
title: Diary
permalink: /diary/
---

#### Diary related blog posts 

<ul class="listing">
{% for post in site.categories['diary'] %}
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
