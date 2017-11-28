---
layout: page
title: Welcome
---

_Currently under construction, as I migrate information from my [old blog](http://home.badc.rl.ac.uk/lawrence)!_

This is my blog and website. You can find out more about it and me [here](/about/). My main research interests are climate science and the necessary underpinning software engineering, data science, computer science, and compute and storage architectures.

## Blog

My last few blog items were:
<ul class="listing">
{% for post in site.posts limit:6 %}
	{% unless post.categories contains "talks" %}
  	<li class="summary-item">
	    <h2>
	    <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
        - <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time></h2>
        {{post.excerpt}}
        <p>... <a class="more" href="{{post.url}}" title="{{post.title}}">more</a></p>
  	</li>
	{% endunless %}
{% endfor %}
</ul>
See also my [blog page](/blog/) or my [feed](/feed.xml). You
may also be interested in my [projects pages](/projects/), or the talks below.


## Talks

My last few signifant talks were at the following events :
<ul class="listing">
{% for post in site.categories['talks'] limit:4 %}
  {% capture y %}{{post.date | date:"%Y"}}{% endcapture %}
  <li class="listing-item">
    <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
	({{post.date|date:"%Y-%b"}})
  </li>
{% endfor %}
</ul>
More on the [talks page](/talks/)!
