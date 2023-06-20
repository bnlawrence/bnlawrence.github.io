---
layout: page
title: Welcome
---

This is my blog and website. You can find out more about it and me [here](/about/). My main research interests are climate science and the necessary underpinning software engineering, data science, computer science, and compute and storage architectures. Keep up to date using my [feed](/feed.xml).

## Blog articles and Talks

My last few blog items and talks are listed below. A complete list of 
blog articles is [here](/blog/) with a complete list of talks [here](/talks/).

<ul class="listing">
{% for post in site.posts limit:10 %}
  {% if post.categories contains "talks" %}
    {% capture y %}{{post.date | date:"%Y"}}{% endcapture %}
    <li class="talk-item"> 
    <h2>Meeting: <a href="{{post.url}}">{{post.title}}</a>, {{post.location}}, {{post.when}}</h2>
    <table><tr>
    <td><img src="{{post.image}}"/></td>
      <td>{{post.excerpt | strip_html}} ... <a class="more" href="{{post.url}}" title="{{post.title}}">more</a>
      {% for talk in post.talks %}
      <p><span class="talk-title">Talk: {{talk}}</span></p>
      {% endfor %}</td>
     </tr></table>
    </li>
  {% else %}
    <li class="blog-item">
    <h2>Article: <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a> - 
    {{ post.date | date: "%d %b, %Y" }}</h2>
      <table><tr>
      <td><img src="{{post.image}}"/></td>
      <td><p>{{post.excerpt | strip_html}}
      ... <a class="more" href="{{post.url}}" title="{{post.title}}">more</a></p>
     </td></tr></table>
    </li>
  {% endif %}
{% endfor %}
</ul>