---
layout: page
title: Talks and Seminars
permalink: /talks/summary/
---

This is a list my significant talks since 2006.

See also a fuller view at my [talks page](/talks/)!

<ol>
{% for post in site.categories['talks'] %}
{% for talk in post.talks %}
<li> <span class="talk-title">{{talk}}</span><br/><span class="talk=mtg">(at <a href="{{post.url}}">{{post.title}}</a>, {{post.location}}, {{post.when}})</span></li>
{% endfor %}
{% endfor %}
</ol>
