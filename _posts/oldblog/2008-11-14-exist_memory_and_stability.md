---
layout: post
title: exist memory and stability
last_modified: Friday 14 November, 2008
tags: badc
categories: computing
---
Within [ceda](http://www.ceda.ac.uk) we are producing more and more xml documents, and the obvious tool for most of them is an xml database. At the moment there appears to be only
one candidate in the opensource world that has something approaching the necessary
reliability and scalablity: [eXist](http://exist-db.org/). Colleagues who have used or are using Berkeley xml database and xindice have been pretty scathing about their experiences, and I'm not aware of other options (although something interesting may be happening in the [mysql](http://www.oreillynet.com/xml/blog/2007/12/xml_moves_to_mysql.html)and [postgres](http://cafe.elharo.com/xml/the-state-of-native-xml-databases/#comment-247929) worlds). We're not overly impressed with the reliability of eXist either, which is what I want to document here, but that said, we still believe it's the way forward (e.g.[in 2007](http://cafe.elharo.com/xml/the-state-of-native-xml-databases/) it was compared with MySQL circa 1997, which implies reasonable prospects).

We initially installed eXist in a tomcat container some years ago, and we've upgraded exist and tomcat a few times along the way. It's only been this last year that we've started to get upwards of thousands of documents in exist, and it's only in the last year that we've started to have
major stability problems, with many tomcat and eXist restarts necessary, and several restores from backup. We have observed problems with consistency when large document insertions via xquery over xmlrpc have been interupted, resulting in the necessity to rebuild collections. We have also seen the problems with collection indexes reported in [email](http://exist.markmail.org/message/2wnwwdsz5xfu26i6) to the exist list.

A couple of weeks ago, we decied to reinstall exist in the jetty container, and see if we could identify what the problems were. Doing so has been a bit hairy. eXist is pretty well documented, but even so, the multitude of ways that eXist can be deployed (standalone database server, embedded database, or in the servlet engine of a Web application), leads to a considerable amount of ambiguity in documentation, and most importantly, signfiicant difficulties in working out which files are associated with the various memory [configuration options](http://exist-db.org/configuration.html) (because which files control the memory depend on the deployment option). We're pretty confident that at least some of our problems are memory related, and maybe where not the only folk in the same boat.

Anyway, herewith is what we think we need to do to control eXist when deployed as a service via the *tools/wrapper/bin/exist.sh* wrapper. Firstly, there are at least two places we think that the memory available to the processes can be configured:
* **tools/wapper/conf/wrapper.conf** where we (now) find the process memory configuration<pre>
# Initial Java Heap Size (in MB)
wrapper.java.initmemory=64
# Maximum Java Heap Size (in MB)
wrapper.java.maxmemory=512</pre> and
* **conf.xml**, where we find the db-connection configuration<pre>
&lt;db-connection cacheSize="256M" collectionCache="124M" database="native"
        files="/disks/databases/exist" pageSize="4096"&gt;</pre>
where we are warned that 
    * *the cacheSize should not be more than half the size of the
JVM heap size*, which is not in this case, set (directly) by the JVM -Xmx parameter but by the
wrapper. Just that one misconception alone tooks us ages to track down, and;
    * wrt collectionCache, *...if our collections are very different in size, it might be possible that the actual amount
of memory used exceeds the specified limit. You should thus be careful with this setting.*
Huh? So how do I be careful? What should I look for? 

We think the setting we have 
should be ok because we have seen the eXist developers saying this should be ok
in [other emai](http://exist.markmail.org/message/wf6ez3eva5z2fvdn)l. But ... we're not happy with not knowing ... is this a failure mode or a performance problem setting?

Then, and worryingly, because some of our problems seem to occur in processing xqueries, we find in (old) [email](http://markmail.org/message/vtb54545ki4rvsss) from an eXist developer (in an interesting thread) that<blockquote>cacheSize just limits the size of the page cache, i.e. the number of data file pages cached in memory. This does not include the base memory needed by eXist (and the libraries it uses) for XML processing and querying. 
</blockquote>

which is probably why they recommend not having it larger than half. But what happens when those libraries blow out their memory requirements?

We haven't yet resorted to turning off full text indexing, because we want that, but we could try the upgrade mentioned in the eXist developer email. We're currently on 1.2.4-rev:8072-20080802.

At this point we haven't yet set a java expert on our problems, but I guess we might have to (following the sort of thing done [here](http://exist.markmail.org/message/vct6erw5rho26kfy)).  Meanwhile, this post is by way of notes for later (and maybe a brief for such an expert).
