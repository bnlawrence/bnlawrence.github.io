---
layout: page
title: Academic
permalink: /academic/
---

This page provides an index into the more academic focused material on this website.

#### Pages

1. [My short CV](/cv/).
2. [My Publications List](/publications/).
3. [My talks page](/talks/) ([summary list](/talks/summary/)).
4. [Previous Graduate Students](/teaching/students) - a list of current and previous graduate students and their topics.
4. [Teaching](/teaching/) - an outline of my teaching activities.
4. [Research](/research) - an outline of my research interests.
5. [Projects](/projects) - an outline of important projects I'm engaged in.

#### Academic focused blog posts

<ul class="listing">
{% for post in site.categories['academic'] %}
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
