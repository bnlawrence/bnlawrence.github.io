---
layout: page
title: Talks and Seminars
permalink: /talks/
---

Since 2006 I've been recording my significant talks here.
<div class="talks">
{% for post in site.categories['talks'] %}
<div class="meeting">
<h1 class="theader"> {{ post.title }}</h1>
<h1 class="tdetails">{{ post.location }}, {{ post.when }}</h1>
{{ post.content }}
</div>
{% endfor %}
</div>
