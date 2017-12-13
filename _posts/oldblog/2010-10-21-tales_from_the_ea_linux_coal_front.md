---
layout: post
title: Tales from the EA linux coal front
last_modified: Thursday 21 October, 2010
tags: computing UML
categories: computing
---
Infrequently I get to do some real work (i.e. interesting work[^1]), but it's so infrequent that every time I get to do work, my "environment" has moved on. In this case, I wanted to produce a simple model extending a couple of ISO classes to provide a different view of how we might describe a climate model. A few minute work I thought ... but it took me half a day, on and off, to get myself in a position to do that few minutes work. So this is by way of saving someone else the bother of working out how (and one of my colleagues at today's metafor meeting needs this info too).

If you use Enterprise Architect with subversion on a linux 10.04 or later system, then this might help:

My environment:
* Cross Over Office 9.1 (and subsequently 9.2)
    * (NB if your menus disappear during the upgrade, logout and login again, and they might reappear - mine did).
* Linux Mint 9 (based on Ubuntu 10.04)
* Enterprise Architect 8.0
* Trying to use [HollowWorld](https://www.seegrid.csiro.au/twiki/bin/view/AppSchemas/HollowWorld)

Remember you need to use [svngate](http://www.codeweavers.com/support/wiki/EAsvn) [if you want to be able to get to svn](http://www.sparxsystems.com/enterprise_architect_user_guide/projects_and_teams/using_subversion_with_enterpri.htm) repositories with access control (even if they're open on https like HollowWorld).
* (Remember to use both cmd.exe.so and [still]({% post_url oldblog/2010-03-15-hollow_world_and_svngate_revisited %}) the *svngate.exe.so*; and note that when EA asks you for the path to your *svnexe*, you wont see it as a choice in your directory because the type is hardwired, just type
in *svngate.exe.so* yourself! If you don't use the *cmd.exe.so* I think it still works, but with no useful error messages come back from svn.)

The problem:
* When you try and add the package version control on a model, you get the following error:<pre>
~/cxoffice/lib/libxml2.so.2: no version information available (required by /usr/lib/libneon-gnutls.so.27)</pre>
The fix:
* In ~/cxoffice/lib link your libxml.so.2 to the version in /usr/lib!
    * (It appears that the libneon stuff that handles secure access to https is newer in the latest ubuntus and depends on stuff in a version of libxml which is newer than that shipped with crossover.)

[^1]: really interesting work is actual climate science, and I get to do that even less frequently
