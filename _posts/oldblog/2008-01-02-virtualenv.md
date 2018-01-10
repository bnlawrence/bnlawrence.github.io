---
layout: post
title: virtualenv
last_modified: Wednesday 02 January, 2008
tags: pyleo python
categories: computing
---
One more thing to remember. I'm going to be building [pyleo](/tags/pyleo) using pylons 0.9.6.1, but the ndg stuff (also on my laptop) is using pylons 0.9.5. Library incompatibility is scary. Fortunately, we have [virtualenv](http://pypi.python.org/pypi/virtualenv) to the rescue.

Using virtualenv, I can build a python instance that is independent of the stuff build into my main python (which is a virtual-python for historical reasons). It's better than virtual-python because I get the benefits of things in my system site-packages that I've installed since I installed my virtual python.

What to remember? (I really will be forgetting things like this when there are weeks between activity ... in particular, this way I'll know which python to use!)

Well, I built my new virtualenv instance by typing<pre>
python virtualenv.py pyleo</pre>
and I can change into it any time I like with<pre>
source ~/pyleo/bin/activate</pre>
I expect I'll be able to ensure I use this python in my (test) webserver when  I get to it. It looks like I need to adjust the path to the libraries inside the outer script with<pre>
import site
site.addsitedir('/home/bnl/pyleo/lib/python2.5/site-packages')</pre>
I used virtualenv 0.9.2.

It looks like I can make ipython respect this by copying /usr/bin/ipython into my ~/leo/bin and editing it to use ~/leo/bin/python ...
