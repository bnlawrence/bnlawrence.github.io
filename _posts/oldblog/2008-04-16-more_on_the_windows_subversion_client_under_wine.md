---
layout: post
title: More on the windows subversion client under wine.
last_modified: Monday 21 April, 2008
categories: computing
tags: UML
---
I reported my problems [earlier]({% post_url oldblog/2008-04-01-subversion_under_wine %}).

This post is by way of notes wrt to the https problems.

Firstly, the detail of the error (with thanks to [Rafael Coninck Teig?o](http://www.winehq.org/pipermail/wine-users/2008-January/028662.html):

<pre>
Running just the client from the command line gives me this:
/tmp/svn-win32-1.4.6/bin$ export WINEDEBUG='-all,+winsock'
/tmp/svn-win32-1.4.6/bin$ wine svn.exe update ~/development/e-dj/
trace:winsock:DllMain 0x7eda0000 0x8 (nil)
trace:winsock:DllMain 0x7eda0000 0x1 0x1
trace:winsock:WSAStartup verReq=2
trace:winsock:WSAStartup succeeded
trace:winsock:WSAStartup verReq=202
trace:winsock:WSAStartup succeeded
svn: Network socket initialization failed
trace:winsock:DllMain 0x7eda0000 0x0 0x1

The excerpt o code within SVN that's returning this error is at session.c:
  /* Can we initialize network? */
  if (ne_sock_init() != 0)
    return svn_error_create(SVN_ERR_RA_DAV_SOCK_INIT, NULL,
                            _("Network socket initialization failed"));
</pre>
and the following note are from the [SVN redbook](http://svnbook.red-bean.com/en/1.0/ch08.html):
<blockquote>The libsvn_ra_dav library is designed for use by clients that are being run on different machines than the servers with which they communicating, specifically servers reached using URLs that contain the http: or https: protocol portions. To understand how this module works, we should first mention a couple of other key components ... the Neon HTTP/WebDAV client library.
</blockquote>
<blockquote>Subversion uses HTTP and WebDAV (with DeltaV) to communicate with an Apache server. ... When communicating with a repository over HTTP, the RA loader library chooses libsvn_ra_dav as the proper access module. The Subversion client makes calls into the generic RA interface, and libsvn_ra_dav maps those calls (which embody rather large-scale Subversion actions) to a set of HTTP/WebDAV requests. Using the Neon library, libsvn_ra_dav transmits those requests to the Apache server.
</blockquote>

Hmmm, Neon Library and WebDav under Wine ... Hmmm.

(Update 17-04-2008: NB, this is a problem with both http and https, and it really is that subversion can't initialise the network library and I've not found any useful advice on the net. My guess is that I'd need to build my own binary of subversion with neon linked in different way than the default, or that there's some subtle wine configuration I don't know about. Either way I'm stymied!)

(Update 21-04-2008: I've raised this as a [ticket](http://www.codeweavers.com/support/tickets/browse/?ticket_id=625046) with [the Cross Over Office Folks](http://www.codeweavers.com) since I need them to run EA anyway.)

#### trackbacks (1)

*[EA and Subversion, Resolved]({% post_url oldblog/2008-05-24-ea_and_subversion_resolved %}) (from "Bryan's Blog" on (on Saturday 24 May, 2008)*

The good folks at CodeWeavers have resolved my problems with the subversion client under Wine (which I needed to get working for use from within Enterprise Architect). All kudos to Jeremy White!
