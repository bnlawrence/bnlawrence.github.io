---
layout: page
title: Talks and Seminars
permalink: /talks/
---

Since 2006 I've been recording my significant talks here (see also the [summary list](/talks/summary)).

<div class="talks" markdown="0">
    {% for post in site.posts %}
      {% if post.categories contains "talks" %}
        <ul class="listing">
            <div class="meeting">
                <h1 class="theader">Meeting: {{post.title}}</h1>
                <h1 class="tdetails">{{post.location}}, {{ post.when }}</h1>
                <p>Includes the following talk{% if post.talks.size  != 1 %}s{% endif %}:
                <ul>{% for talk in post.talks %}<li>{{talk}}</li>{% endfor %}</ul></p>
                {{ post.content }}
            </div>
        </ul>
        {% endif %}
    {% endfor %}
</div>