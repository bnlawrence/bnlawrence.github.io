---
layout: post
title: EA and Subversion, Resolved
last_modified: Tuesday 02 June, 2009
categories: computing
tags: UML
---
The good folks at CodeWeavers have resolved my [problems]({% post_url oldblog/2008-04-16-more_on_the_windows_subversion_client_under_wine %}) with the subversion client under Wine (which I needed to get working for use from within [Enterprise Architect](http://www.sparxsystems.com.au/)). All kudos to Jeremy White!

I'd got to the point of [recommending in a support request](http://www.codeweavers.com/support/tickets/browse/?ticket_id=625046) at codeweavers that a work around might be to try and replace the call to subversion with a windows bat file that invoked linux subversion rather than trying to get windows native subversion working properly.

Jeremy was far smarter than that. Yes, we've ended up invoking linux subversion, but via a different route.

The first step we took was to replace the native subversion.exe call with a simple linux script (I had no idea that one could even do that, having assumed that from a windows cmd.exe one had to call windows stuff ... but note that the trick was to make sure the script had no filename extension, and point to it in the EA cofiguration as if it were an executable). Having done that, we could see what EA was up to, and we found a few wrinkles.

Jeremy then came up with a winelib application ([svngate](http://www.codeweavers.com/support/wiki/EAsvn)) which handles all the issue with windows paths, and also a bug in the way EA uses subversion config-dir (a bug which doesn't seem to cause problems under windows, even though it ought to).  In passing, Jeremy also fixed a wee bugette in the wine cmd.exe which was also necessary to make things work.
All the code is on the [crossover wiki](http://www.codeweavers.com/support/wiki/EAsvn).

So I'm a happy codeweavers client. I'm less happy with how Sparx dealt (commercially) with their end of this, but that's a story for another day.

(**Update 06/06/08**: I'm probably being unfair, their technical support are now taking this and running with it; their linux product will be svngate aware and *is* getting linux specific bug fixes.)

**Update 02/06/08**. There was another wrinkle I discovered after a while ... the old cr/lf unix/windows problem. This can be relatively easily fixed,as Jeremy had seen this coming. I created my own version of subversion (/home/user/bsvn) with<pre>
#!/bin/bash
svn "$*" | flip -m -</pre>
and set SVNGATE_BIN to /home/usr/bsvn!

**Update 02/06/09**. Actually that previous script doesn't quite work in all cases (i.e. where the svn content has blanks and hyphens in filenames). Better
seems to be:<pre>
#!/bin/bash
svn "$@" | flip -m -</pre>

#### trackbacks (1)

*[hollow world and svngate revisited]({% post_url oldblog/2010-03-15-hollow_world_and_svngate_revisited %}) (from "Bryan's Blog" on (on Monday 15 March, 2010)*

... This note is by way of updating my older posts on using subversion in EA ...

#### comments (6)

*Rafael Coninck Teigão (on Wednesday 18 June, 2008)*

Hey Bryan,

Great solution! Kudos for taking this matter forward. Anyway, I tried the solution proposed by Jeremy without success. The configuration goes OK and I can update to the latest packages, but when I try to open the context menu for "package control" EA just blinks.

Svngate debug log shows:
Debug started, pwd [/home/ract/development/e-dj/Artefatos/UML]
svngate argv[1]: [status|status]
svngate argv[2]: [--show-updates|--show-updates]
svngate argv[3]: [--verbose|--verbose]
svngate argv[4]: [01_Requisitos.xml|01_Requisitos.xml]
invoking [/usr/bin/svn]
Debug started, pwd [/home/ract/development/e-dj/Artefatos/UML]
svngate argv[1]: [status|status]
svngate argv[2]: [--show-updates|--show-updates]
svngate argv[3]: [--verbose|--verbose]
svngate argv[4]: [01_Requisitos.xml|01_Requisitos.xml]
invoking [/usr/bin/svn]
svngate rc 4317, errno 25, status 0x0, ifexited 1, realstat 0

Do you have any idea what could possibly be wrong?

Of note is this: when my svn server was offline, I got a message saying that the svn client could not connect to it, making me believe that on the other cases the connection is going through.

Cheers,
Rafael

*Bryan (on Wednesday 18 June, 2008)*

Hi Rafael

Short answer is no. Slightly longer answer is with a bit more playing around I found some more problems, and the folks at Sparx found even more. I believe all the known problems are fixed in release 831 (which wasn't available last time I looked, but which I hope is available now).

Cheers
Bryan

*Bryan (on Wednesday 18 June, 2008)*

I should have said that there are some things that work fine even with earlier versions, so it might be pot luck if things work or not.

*Rafael Coninck Teigão (on Tuesday 08 July, 2008)*

Almost there!

Tried the new build (831). Now it's possible to select a U*NIX svn client (EA asks whether the client is a UNIX or a Windows one).

EA somehow seems to recognize the repository, but when I try to update the packages or open the project, I get the following message several times:

Code = 0xc00ce558
Error Description = "XML document must have a top level element"

I thought that maybe this has something to do with the ^M mess, so I created a script just as you did above, to get "flip" to convert the output.

Unfortunately it didn't work, and I still get the same error.

Have you had success with this last build?

Cheers,
Rafael.

*Rafael Coninck Teigão (on Tuesday 08 July, 2008)*

Oh, and if I try to use SVNGATE, I also get an error:

Error when initializing Version Control provider:
c:\windows\svnc092.cmd

The part between "svn" and ".cmd" always changes to some 4 digits hexadecimal number.

This is the case with or without the flip thing.

Cheers,
Rafael

*Bryan (on Wednesday 16 July, 2008)*

hi Rafael

I've been on holiday, and am under a huge backlog. I'll get to trying this all out within a few days, and drop you an email as well as put a comment here.

Cheers
Bryan
