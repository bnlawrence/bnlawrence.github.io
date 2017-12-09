---
layout: post
title: zotero, zandy, greader, evernote, and me
last_modified: Wednesday 11 September, 2013
categories: academic
tags: zotero evernote
---
Quite a while ago (i.e. years), I decided that managing my bibliographic information in a bibtex file wasn't working any longer. Back then I had a look at [Mendeley](http://www.mendeley.com/) and [Zotero](http://www.zotero.org/). I can't really remember why, but I chose Zotero (I think it was a combination of how it worked for me, I played with both, and I didn't like having to use their PDF viewr. I also had some worries about Mendeley and the software and information IPR ... when Elsevier bought out Mendeley I felt vindicated on the latter.)

Anyway, now Zotero is a pretty integral part of my working environment. I use zotero standalone on my linux laptop (which is also my desktop when it's in a docking station). I make heavy use of [zotfile](http://www.columbia.edu/~jpl2136/zotfile.html) to migrate papers to and from my Android tablet for reading (I no longer print out anything). I like being able to annotate my PDFs on the tablet, and in particular, having anything I highlighted being pulled out automagically when zotfile pulls the papers back off the tablet.

However, there are two issues with that workflow that bug me. I'd like my PDF library to be completely synchronised for offline reading on my tablet, and I'd like a fully featured native zotero client on the tablet (and my Galaxy Note phone). [Zandy](http://goo.gl/FECSh) is the only Android app for zotero, and while it has some useful functionality (it synchronises the metadata so at least one can check on the phone/tablet if something is in my library), it doesn't synchronise the attachments completely.

(I do use box.net to synchronise my attachments out from zotero standalone via webdav, which works, but one can only use it to effectively download attachments one by one to Zandy - there is no bulk download facility, and no way to annotate and upload back - it's one way sync! But you can view stuff without going to the journal which can be useful for memory jogging.)

The other thing I can't do on my Android devices, and in particular my phone, is effectively create zotero information. There are ways, I could:
* Manually enter the information in Zandy (no thanks, the whole point of zotero is to avoid manual bibliographic entry where possible). (There is a scanner option, but I'm mostly dealing with papers found on journal websites.)
* Use the [zotero bookmarklet](http://www.zotero.org/downloadbookmarklet) on chrome, well yes, that's possible, but it fails miserably on the AMS journal websites, and requires an inordinate amount of clicking and typing. (The way you use the bookmarklet is to start typing it's bookmark name into the address-bar of the page you are looking at, and if it can find a translator, it loads it into zotero.)

What I really want to do, is from a feed reader, share a journal entry straight into zotero. I can nearly do this.  However,  from [greader](http://goo.gl/MiMf59), if I
* Share to Zandy, I basically just get the paper loaded as web page, and I have to manually fix it all later. This isn't necessarily a bad option, at least I get something, but it's often not enough, unless I do that manual step. You can guess how often I do it ...
* Share to evernote, I can at least get the abstract and most of the body out of the RSS/atom straight into evernote (again the AMS journal feeds are **hopeless**). But now I have my bibliographic information in two places: abstracts in evernote, and full papers with proper references in Zotero. Searching is cumbersome.

Anyone got a better solution for (zotero based) bibliographic handling from Android (or a way of encouraging [Avram Lyon](https://github.com/ajlyon), the Zandy author, to get back into active development)?

I need it to work from Android, because it's in the nature of my job that I spend a lot of time before and after meetings, travelling etc, when being able to interact with the scientific literature on my phone and tablet would make me more productive. Indeed, I do most of my journal paper triage on my phone! (No, I am not going to consider becoming an apple fan-boy!)

(Of course most of this is pointless if the paper is invisible behind a paywall. Invective removed by the editor/author.)


#### comments (1)
*Jon Blower (on Thursday 12 September, 2013)*
I liked zoteroreader.com (although I'm not sure it does everything you want). It's available as a demo web app, but they were trying to raise funds for a native Android app. I donated but they didn't get close to their target unfortunately.

I gave up trying to create entries on my tablet - I save that job till I'm at my desktop. (Getting the PDFs from the tablet is a bit of a pain anyway because usually it requires having my University Athens/VPN/whatever login to get past the paywall.)

But I haven't tried to see if the Zotero plugin will work on Firefox on tablets - could be worth a try.

I use dropbox to temporarily store PDFs that are awaiting annotation - the annotations from the tablet (I use Adobe Reader on a Galaxy Note 10.1) get uploaded back to dropbox, then I move the files back to Zotero on my desktop when I'm done. A little clunky, I would prefer direct sync to the Zotero lib, but it's not too bad.

(By the way, I don't think it's much better in Apple-land anyway, unless something has appeared since I last used an iPad. The Galaxy Note 10.1 is far superior to an iPad for PDF annotation anyway.)
