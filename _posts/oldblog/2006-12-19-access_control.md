---
layout: post
title: Access Control
last_modified: Tuesday 19 December, 2006
tags: ndg python
categories: computing
---
I've said it before, and I'll say it again. If you have high volume or high value real resources on the web, you need access control! 

Back in [August]({% post_url oldblog/2006-08-15-on_access_control %}) I introduced the simple "gatekeeper" methodology we have planned within the DEWS project. This simple idea could be used to "protect" any resource, and in particular, along with the WCS, we could use it for [OPenDAP](http://www.opendap.org).

We could do it the following way:
* Deploy [pydap.org](http://pydap.org).
* Introduce a layer of [wsgi](http://wsgi.org) middleware that called [ndg](http://proj.badc.rl.ac.uk/ndg) security and provide gatekeeping functionality directly within that application. 

We'd never have to modify pydap. But we would need to think about how the clients interacted with the pydap server. Realistically no one uses pydap with a browser: people either use bespoke [OPenDAP](http://www.opendap.org/faq/whatClients.html) clients, or they use an application linked to a client library (the most popular of which would appear to be versions of the netcdf bindings).

In either case, it's unlikely that folk would be rebuilding their applications to take advantage of ndg security, so we'd need to deal with an out of band establishment of the security context.

ndg security requires the gatekeeper to have access to a proxy certificate (to identify the data requestor) and an ndg attribute certificate (to assert what roles the data requestor has). If a browser were to contact a gatekeeper, the normal sequence of events would be to redirect to a login service, which would instantiate a session manager instance, which would get the credentials and load them into an ndg wallet instance before redirecting back to the gatekeeper with url arguments which would then be used to populate a client-side cookie with the session id and the session manager address (for future requests).

In the case of OpenDAP (or any other non-ndg specific applications which we might wish to secure with ndg security)  we need to 1) obtain the credentials independently of the data request, and 2) we need to communicate those credentials to the gatekeeper with every request without the benefit of a cookie.

We could do the first of these with an equivalent command to the grid_proxy_init concept with the globus toolkit (although our version would probably need the URI of the data object in case specific attribute certificates were required). That command, say, ndg_securitycontext_init could populate a local file based ndg wallet, but there'd still initially be no way of getting the certificates through a client application  to our gatekeeper server except via the URL. So we'd not be able to use the contents of the local wallet directly, although it could be queried to provide an token in the argument in the URL which could be intercepted by the gatekeeper.

Ideally the token would be the proxy and attribute certificate themselves, but that would make already cumbersome OPenDAP URL's horrendous. It'd probably be as easy to utilise a remote session manager instantiated by the ndg_securitycontext_init command , and simply provide the address of that wallet in the URL, although we'd have to do this with each request (no cookie remember :-).

Obviously that token would be worth intercepting by the bad guys, because if you can get it, you can pretend to be the data requestor until the token contents time out.  We could minimise the risk of this by 
insisting on using https to communicate with our gatekeeper (and pydap) server, but this would be an overhead on the data transport, which might be a problem for high volume transmissions.

Alternatively, we want to somehow make the token useless if intercepted. A lightweight way of doing this which would stop some lightweight threats would be to ensure the token includes the IP address of the data requestor.

We could also make sure that the data request itself (the URL) was signed and encrypted by the proxy certificate in the wallet, making it only possible to do replay attacks (the token wouldn't be independently available), we'd end up with a URL something like:
<pre>
http://ourgateeper.address/encrypted_data_request
</pre>
but it'd be nightmare for the user, imagine doing a sequence like the following for every transaction in a matlab or idl session (assuming we've already
instantiated our ndg_security_context):
1. identify the data uri
1. run ndg_encrypt_uri programme (which we'd have to provide)
1. copy the new cumbersome url to the application
1. get an error
1. wonder whether we got our copy and paste right 
1. realise we had the original data uri wrong (for example)
1. ...

So, that's going to be too hard for real people. We might have to live with a one time token produced by the ndg_securitycontext_init command, which can be appended to "normal" opendap urls ... 

I'm sure the real security folks wouldn't like this as much as full ndg security, as it would be possible to spoof the originating ip, and bad guys can exist on the same machine as good guys. However, in practice I think this would be a sufficient level of security for all our datasets, but it'd still be ugly!

Ideally of course the opendap folks would modify their libraries to have an access control call out which would allow any security infrastructure to be bolted in. There is a rumour that the Australian Burea of Meteorology has contracted them to do something like that, but I've yet to see any details.
(And of course ideally we wouldn't have to have our own bespoke ndg security too, but until the mainstream meets our access control needs, we'll continue to  have to roll our own!)

#### comments (1)

*[Andy Turner](http://www.geog.leeds.ac.uk/people/a.turner/) (on Friday 05 January, 2007)*

The following related organisations seem to be making good progress:

http://www.opengeospatial.org/projects/groups/securitywg

http://52north.org

Thanks :-)

