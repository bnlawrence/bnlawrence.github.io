---
layout: post
title: authkit and pylons don't quite fit 
last_modified: Sunday 17 February, 2008
tags: pyleo python
categories: computing
---
Background - I'm using genshi as my templating engine in pylons 0.9.6.1 and I want to authkit to do access control
and authentication. This is in the context of [pyleo](/tags/pyleo).

I'm following the guidance in the [draft pylons book](http://wiki.pylonshq.com/display/pysbook/Authentication+and+Authorization).

Problem of the day: wrapping the signin template in the site look-n-feel. This is slightly less than trivial because the signin template is produced by authkit, but it doesn't have easy direct access to the pylons templating system because pylons is yet to be instantiated (in the middleware stack).

The recommended way of doing it is to create a file (in pyleo's lib directory called "template") which loads what is needed to control the signin template (in a functinn called "make_template"), and point to that using
<pre>
authkit.form.template.obj = pyleo.lib.template:make_template
</pre>
in the *development.ini* file so that authkit can render a nice sign-in page.

There are a few problems in the current version of the guidance:
1. The current version of the doc wrongly has "template" instead of "make_template" after the colon in the development.ini config file.
1. For genshi, we don't want to call a template called "/signin.mako" we want to call "signin",
1. if your site banner wants to look at the c or g variable you have to do rather better than what is done 
with the State variable pretending to be c in the example template file. At the very least you need to add a __getitem__ method so that 
at least calls to *c.something* in your site templating code won't break, even if they don't work ...
You might also probably need to access to the pylons globals ...

At this stage, my template.py which provides the render function at the authkit level looks like this:
<pre>
import pylons
from pylons.templating import Buffet
from pylons import config
import pyleo.lib.helpers as h
from pyleo.lib.app_globals import Globals

class MyBuffet(Buffet):
    def _update_names(self, ns):
        return ns

def_eng = config['buffet.template_engines'][0]

buffet = MyBuffet(
    def_eng['engine'],
    template_root=def_eng['template_root'],
    **def_eng['template_options']
)

for e in config['buffet.template_engines'][1:]:
    buffet.prepare(
        e['engine'],
        template_root=e['template_root'],
        alias=e['alias'],
        **e['template_options']
    )

class State:
    def __getitem__(self,v):
        return ''
c = State()

g=Globals()

def make_template():
    ''' In the following call, namespace is a dictionary of stuff for the templating
    engine ... which is why c is a (nearly) empty class, and h is the normal helper '''
    return buffet.render(
        template_name="signin",
        namespace=dict(h=h, g=g, c=State())
    ).replace("%", "%%").replace("FORM_ACTION", "%s")
</pre>
Now it nearly works properly, but the pyleo site template currently uses the pylons *c* variable to produce a menu which is data dependent and obviously that doesn't work properly. We need to work out some way to get at that from "outside" pylons (which is where authkit lives).  While that's a problem that can wait, it's a problem that needs solving ...
