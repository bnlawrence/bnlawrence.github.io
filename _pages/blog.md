---
layout: page
title: Blog
permalink: /blog/
---

My blogging is very much a case of punctuated equilibrium in recent years, long periods of quiet, followed by a bit of activity. I hope to improve that in the near future. Meanwhile, here is a list of blog posts.

_Note that this list is underpopulated as I have yet to migrate all the material over from my old blog!_


<ul class="listing">

{% for post in site.posts %}
	{% unless post.categories contains "talks" %}
      {% capture y %}{{post.date | date:"%Y"}}{% endcapture %}
      {% if year != y %}
        {% assign year = y %}
        <li class="listing-seperator">{{ y }}</li>
      {% endif %}
      <li class="listing-item">
        <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time>
        <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
      </li>
    {% endunless %}
{% endfor %}

</ul>
