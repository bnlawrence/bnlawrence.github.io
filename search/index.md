---
layout: page
title: "Search"
search_omit: true
sitemap: false
---

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
