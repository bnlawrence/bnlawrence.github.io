---
layout: page
title: CLADDIER
---

## CLADDIER: Citation, Location, and Deposition in Discipline and Institutional Repositories

{% include image.html url="/assets/images/claddier_logo_small.png" width=172 align="right" %}
The CLADDIER project was funded by the JISC for support under the Call for Projects in Digital Repositories (March 05), and ran for two years.


#### Posts about CLADDIER

<ul class="listing">
{% for post in site.tags.claddier  %}
  <div class="post_info">
    <li class="listing-item">
         <time datetime="{{ post.date | date:"%Y-%m-%d" }}">{{ post.date | date:"%Y-%m-%d" }}</time> <a href="{{ post.url }}" title="{{ post.title }}">{{ post.title }}</a>
    </li>
    </div>
  {% endfor %}
</ul>


#### Original Project Abstract

The University of Southampton and CCLRC institutional repositories are exemplars of institutional repositories in the UK. The British Atmospheric Data Centre (BADC), likewise, is an exemplar of a discipline based data archive. This two-year project will build and deploy a demonstration system linking publications held in the institutional repositories with data holdings in the BADC. As well as the demonstration system, a workshop disseminating information about the project will be held for the environmental science community, and four significant reports will be produced:

1. User Experience of the CLADDIER System (written by active environmental scientists based on their experiences, see WP8)
1. Identifier Migration Issues for Repositories (see WP11)
1. Recommendations for data/publication linkage (based on lessons learned, and a review of the literature, see WP9)
1. Methodologies and Practices for Data Publication (see WP4 and WP5).

The result will be a step on the road to a situation where active environmental scientists will to be able to move seamlessly from information discovery (location), through acquisition to deposition of new material, with all the digital objects correctly identified and cited. The lessons learned will be of applicability for the relationships between other discipline based repositories and institutional repositories, addressing the scholarly knowledge cycle defined by UKOLN , within the JISC e-Research environment supporting research and learning and teaching.
