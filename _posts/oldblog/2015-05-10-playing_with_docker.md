---
layout: post
title: playing with docker
last_modified: Sunday 10 May, 2015
---
From time to time I get a very short opportunity to try and do some science, and I find the context switching harder and harder. To that end, I want to make more use of ipython-notebook.

Nowadays my compute environment is a macbook pro running mavericks, and I have two VMS built: a JASMIN analysis platform (JAP) image (based on Centos, for science) and a Linux Mint image (primarily to give me a route to reliable LibreOffice - unlike the version running on the Mac). Both can run ipython notebook, but I couldn't work out how to get that visible to browsers running in my Mac environment (which is what I wanted this time).  

I could probably have worked that out, but  I thought, it's about time I got some hands on experience with docker, since everyone is raving about it, and folks in my team are also starting to use it ... so why not try that route?

Herewith a couple of hours on a Saturday afternoon and another hour or so on a Sunday morning:

I got boot2docker working, and then  I thought I'd try out the continuumio anaconda image ... but I immediately discovered that it didn't have netcdf4 and basemap by default (and that matplotlib  was broken), so herewith my first dockerfile:
<pre>
# aims to run basemap, and eventually, cf-python
# the anaconder base image is itself based on debian
FROM continuumio/anaconda
MAINTAINER Bryan Lawrence &lt;bryan.lawrence@ncas.ac.uk&gt;

# as of May 10, 2015 the base image needs this to work with matplotlib:
RUN apt-get -y install libglib2.0-0

# now the stuff we want
RUN conda install netcdf4
RUN conda install basemap</pre>
I was able to build that using
<pre>
docker build -t bnlawrence/cfconda .</pre>
and run it using:
<pre>
docker run -it  -v $(pwd):/usr/data -w /usr/data -p 8888:8888 bnlawrence/cfconda</pre>
(from within a directory on the mac where I wanted my notebooks to reside.)
I then have to run <pre>
ipython notebook --ip=0.0.0.0 --no-browser</pre>
inside the container, whereupon, as if by magic, I can access my notebooks on the mac at <pre>
http://192.168.59.103:8888/tree</pre>
(I would have liked to have run the notebook directly on the end of the docker run statement, but when i do that, the notebook kernel seems to be really unstable and repeatedly crash. I don't know why.)

Now, hopefully I can start using ipython notebook during my working week ...
