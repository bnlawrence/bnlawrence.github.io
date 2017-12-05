---
layout: page
title: "Browse and/or Search"
search_omit: true
sitemap: false
---

<h2> Browse </h2>

<p>
| {% for tag in site.tags %}
<a style="font-size: {{ tag | last | size | times: 100 | divided_by: site.tags.size | plus: 70 }}%" href="/tags/{{ tag | first | slugize }}/">{{ tag | first }}</a> |
{% endfor %}
</p>


<hrule>
<h2> Simple Search</h2>

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
