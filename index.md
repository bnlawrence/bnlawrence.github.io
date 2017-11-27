---
layout: page
title: Welcome
---

_Currently under construction, as I migrate information from my [old blog](http://home.badc.rl.ac.uk/lawrence)!_

This is my blog and website. You can find out more about it and me [here](/about/). My main research interests are climate science and the necessary underpinning software engineering, data science, computer science, and compute and storage architectures.

The main blog is available from the blog menu item, but you may also be interested in my [talks page](/talks/) or my [projects pages](/projects/).

My last few signifant talks were at the following events :
<ul class="listing">
{% for post in site.categories['talks'] limit:4 %}
  {% capture y %}{{post.date | date:"%Y"}}{% endcapture %}
  <li class="listing-item">
    <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
	( <time datetime="{{ post.date | date:"%Y-%m" }}">{{post.date|date:"%Y-%m"}}</time>)
  </li>
{% endfor %}
</ul>
... more on the [talks page](/talks/).

My last few blog items were:
<ul class="listing">
{% for post in site.posts limit:5 %}
	{% unless post.categories contains "talks" %}
  	<li class="listing-item">
	    <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time>
	    <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
  	</li>
	{% endunless %}
{% endfor %}
</ul>
... more on my [blog](/blog/) or from my [feed](/feed.xml).

See also my [publications page](/publications/).
