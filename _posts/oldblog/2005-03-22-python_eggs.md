---
layout: post
title: Python Eggs
last_modified: Tuesday 22 March, 2005
tags: python
categories: computing
---

One of the main complaints new users of python give is that the library dependency issue is not as clearly dealt with as it is in the perl and java communities. Today, I found out about the [python eggs](http://peak.telecommunity.com/DevCenter/PythonEggs) project via [this](http://dirtsimple.org/2005/03/eggs-are-coming.html). In the latter, eggs were described as<blockquote>An egg is to a Python as a jar is to Java
</blockquote>

and the planned usage would seem to be <blockquote>The resulting .egg file can be added to PYTHONPATH or sys.path, as long as it contains only pure Python modules, or if you have the "pkg_resources" runtime installed ... But the idea is that .egg files, unlike normal Python zipimport files, can include C extensions as well as pure Python.
</blockquote>

It sounds like some work is yet to be done (pkg_resources doesn't yet work), but if this is successful, it will make a huge difference to the ease of building and using python applications for the non-expert.