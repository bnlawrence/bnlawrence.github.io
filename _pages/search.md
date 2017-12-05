---
layout: page
title: "Find: Browse and/or Search"
search_omit: true
sitemap: false
permalink: /search/
---

<h2> Browse </h2>

<h4> Categories </h4>

<p>
| {% for tag in site.categories %}
<a href="/{{ tag | first | slugize }}/">{{ tag | first }} ({{tag | last | size}})</a> |
{% endfor %}
</p>

<h4> Tags </h4>

<p>
| {% for tag in site.tags %}
<a style="font-size: {{ tag | last | size | times: 100 | divided_by: site.tags.size | plus: 70 }}%" href="/tags/{{ tag | first | slugize }}/">{{ tag | first }}</a> |
{% endfor %}
</p>

<h2> Simple Search <h2>

<div class="search">

<p> This website is indexed for simple search based on title, tags, categories, and the first paragraph or so.<br/> For more comprehensive search you'll probably have to resort to Google! </p>

<!-- Html Elements for Search -->
<div id="search-container">
<p>Search: <input type="text" id="search-input" placeholder="search..."></p>
<ul id="results-container"></ul>
</div>

<!-- Script pointing to search-script.js -->
<script src="/js/simple-jekyll-search.min.js" type="text/javascript"></script>

<!-- Configuration -->
<script>
SimpleJekyllSearch({
  searchInput: document.getElementById('search-input'),
  resultsContainer: document.getElementById('results-container'),
  json: '/search.json',
  searchResultTemplate: '<li>{date}: <a href="{url}">{title}</a>'
})
</script>

</div>
