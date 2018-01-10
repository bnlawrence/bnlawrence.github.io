---
layout: post
title: browser crap
last_modified: Wednesday 15 November, 2006
tags: ndg computing
categories: computing
---
As is fairly obvious from the range of dribble that appears on this website, I dabble in many of the technologies my team work with. One of the things I've been doing is developing the interface to the new NDG discovery service (this is the sort of thing I find I can do on the train home from meetings when my brain is too addled to think properly as it's kind of mechanical: make mistake, fix it, move slowly on - it beats sudoku and patience and the other stuff I see tired folk do at the end of the day).

Anyway, this is about browser crap. The following simple piece of css is designed to support identical buttons (whether "real" buttons, or pseudo buttons which are really hyperlinks). I developed it on firefox, and then looked at how it looked under IE and konqueror. 

Oh how glad I am that I don't do interfaces for a living. 

Here's the CSS:
<pre>
a.button {border: 1px solid black; background-color: #F4F4F4; 
          padding-bottom: 3px; padding-top:3px; 
          padding-left: 4px; padding-right: 4px; 
          text-decoration:none; color:black;}

button.button {border: 2px solid black; background-color: #F4FFFF;                  
               padding-bottom: 1px; padding-top:1px; 
               padding-left: 4px; padding-right: 4px; 
               text-decoration:none; color:black;}
</pre>
And this is what we get:
* Firefox:
![Image: IMAGE: 2006/11/15/ndgCSSfirefox.jpg ](/assets/images/2006-11-15-ndgCSSfirefox.jpg)
* Konqueror:
![Image: IMAGE: 2006/11/15/ndgCSSkonqueror.jpg ](/assets/images/2006-11-15-ndgCSSkonqueror.jpg)
* Internet Explorer:
![Image: IMAGE: 2006/11/15/ndgCSSie.jpg ](/assets/images/2006-11-15-ndgCSSie.jpg)

Note the vertical alignment of the "real" button, and the font differences under IE. Yuck. As it happens I've decided I don't really want them to look alike, but I felt like bleating about how crap browsers are at consistent CSS support (and this for a *really* simple piece of CSS usage).

#### comments (2)

*Garick (on Tuesday 21 November, 2006)*

It is aweful isn't it.

There is a trick that you can do
to make the default browser CSS closer between different browsers.  Margins and paddings are the worst offenders.

Something like this helps: (untested)

* { 
  margin:0px;
  padding:0px;
}
(then explicitly set your margins and padding)

(I know this is at least as ugly as the problem itself, but ...)

Overkill I know, but it may be easier to work from that direction ....

Here is an interesting disscussion on this sort of thing.
http://meyerweb.com/eric/thoughts/2004/09/15/emreallyem-undoing-htmlcss/


P.S. I know this is at least as ugly as the problem itself ... I feel your pain.. :)

*Bryan (on Tuesday 21 November, 2006)*

Thanks for this! It looks like really good advice! I've squirreled away a copy of the link too ...
