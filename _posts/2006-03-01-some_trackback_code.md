---
layout: post
title: Some Trackback code
last_modified: Wednesday 15 March, 2006
tags: ndg computing claddier
categories: computing
excerpt_separator: "<!--more-->"

---
So I've joined up to the [trackback working group](http://www.lifewiki.net/trackback/), and I decided I'd better have a proper trackback implementation to play with ... given this is all very important for [claddier](/projects/claddier) the time investment was worth it.

<!--more-->

So here is my toy standalone implementation for playing with. I have no idea whether it is actually properly compliant, but it works for me. If folk want to point out why it's wrong I'll be grateful. But note it's only toy code, it's not for real work.

There are five files [here](/assets/misc/2006-03-01-trackback.zip):
* `NewTrackbackStuff.py` - which consists of three classes which I'll document below: a *TrackbackProvider* (handles the trackbacks), which uses the *Handler* to provide a dumb but persistent store. There is also a *StandardPing* class to help with various manipulations ... (it's really unnecessary, but helped me with debugging and thinking etc).
* `cgi_server.py` - a dumb server which runs
* `tb_server.py`  on the localhost at port 8001.
* `ElementTree.py` (part of the [fabulous package by Fredrik Lundh](http://effbot.org/zone/element-index.htm) and included here for completeness)
* `test_tb_server.py` which tests the trackback to the persistent store.


It's all pretty simple stuff, anyway, this is how you invoke trackback, assuming you have the tb_server running locally on port 8001:
~~~~~ python
import urllib,urllib2

payload={'title':'a new citing article title',
		'url':'url of citing article',
		'excerpt':'And so we cite blah ... carefully  ...',
		'blog_name':'Name of collection which hosts citing article'}

s=urllib.urlencode(payload)

req=urllib2.Request('http://localhost:8001/cgi/tb_server.py/link1')
req.add_header('User-Agent','bnl trackback tester v0.2')
req.add_header('Content-Type','application/x-www-form-urlencoded')
fd=urllib2.urlopen(req,s)
print fd.readlines()

~~~~~

There's not much to say about that. The server looks like this:
~~~~~ python
#!/usr/bin/env python
from NewTrackbackStuff import TrackBackProvider,Handler
import cgi,os
#mport cgitb
#cgitb.enable()

handler=Handler()
relative_path=os.environ.get("PATH_INFO").strip('/')
method=os.environ.get("REQUEST_METHOD")
cgifields=cgi.FieldStorage()

print "Content-type: text/html"
print

tb=TrackBackProvider(method,relative_path,cgifields,handler)
print tb.result()

~~~~~

So all the fun stuff is in NewTrackBackStuff in the TrackBackProvider:
~~~~~ python
class TrackBackProvider:
    	''' This is a very simpler CGI handler for incoming trackback pings, all it
	does is accept the ping if appropriate, and biff it in a dumb persistence
	store '''
	def __init__(self, method, relative_path, cgifields, handler):
		''' Provides trackback services
		    (The handler provides a persistent store)
		'''
		self.method=method
		self.relative_path=relative_path
		self.fields={}
		#lose the MiniFieldStorage syntax:
		for key in cgifields: self.fields[key]=cgifields[key].value
        	self.handler = handler

		self.noid='Incorrect permalink ID'
        	self.nostore='Cannot store the ping information'
        	self.invalid='Invalid ping format'
		self.nourl='Invalid or nonexistent ping url'
		self.noretrieve='Unable to retreive information'
		self.xmlhdr='<?xml version="1.0" encoding="iso-8859-1"?>'

	def result(self):
        	target=self.relative_path
            	if target=='': return self.__Response(self.noid)
		if not self.handler.checkTargetExists(target): self.__Response(self.noid)
		if self.method=='POST':
			''' All incoming pings should be a post '''
			try:
				ping=StandardPing(self.fields)
				if ping.noValidURL(): return self.__Response(self.nourl)
			except:
				return self.__Response(self.invalid+str(self.fields))
			try:
				r=self.handler.store(target,ping)
				return self.__Response()
			except:
				return self.__Response(self.nostore)
		elif self.method=='GET':
			# this should get the resource at the trackback target ...
			try:
				r=self.handler.retrieve(target)
				return self.xmlhdr+r
			except:
            			return self.__Response(self.noretrieve)

	def __Response(self,error=''):
        	''' Format a compliant reply to an incoming ping '''
        	e='<error>0</error>'
        	if error!='': e='<error>1</error><message>%s</message>'%error
        	r=''.join([self.xmlhdr,'<response>',e,'</response>'])
        	return r

~~~~~

which is mainly about handling the error returns. The persistent store, as I say is very dumb, and simply consists of an XML file for this toy, which uses:
~~~~~ python
class Handler:
	''' This provides a simple persistence store for incoming trackbacks.
	Makes no assumptions beyond assuming the incoming ping is
	an xml fragment. No logic for ids for the trackbacks etc ... this is
	supposed to be dumb, and essentially useless for real applications!!'''
	def __init__(self):
		self.xmlfile='trackback-archive.xml'
		# if file doesn't exist create it on store ...
		try:
			t=ElementTree.parse(self.xmlfile)
			self.data=t.getroot()
		except:
			self.data=ElementTree.Element("tracbackArchive")
	def checkTargetExists(self,target):
		''' check whether the target link exists '''
		for t in self.data:
			if t.attrib.get('permalink')==target: return 1
		return 0
	def urlstore(self,target,ping):
		'''stores a url encoded "standard" ping '''
		node=ElementTree.fromstring(ping)
		return self.store(target,node)
	def store(self,target,ping):
		''' stores a ping and associates it with target, quite happy for the
		moment to have duplicates - assumes the ping is already an ET instance '''
		#regrettably I think we have to test each child for the attribute name,
		#I'd prefer to use an xpath like expression ... but don't know how.
		for t in self.data:
			if t.attrib.get('permalink')==target:
				#add to an existing target element
				t.append(ping.element)
				break
		else:
			#create a new target element
			t=ElementTree.Element('target',permalink=target)
			t.append(ping.element)
			self.data.append(t)
		ElementTree.ElementTree(self.data).write(self.xmlfile)
		return 0
	def retrieve(self,target):
		''' retrieves the target and any pings associate with it '''
		for t in self.data:
			if t.attrib.get('permalink')==target: return ElementTree.tostring(t)

~~~~~

Finally, for handling the ping, I found this useful:
~~~~~ python
class StandardPing:
	''' Defines a standard trackback ping payload. Use as a toy to validate
	existing standard pings and convert to XML or urlencode ...'''
	def __init__(self,argdict=None):
		''' Instantiate with payload or empty '''
		self.allowed=('title','url','excerpt','blog_name')
		self.element=ElementTree.Element('ping')
        	for key in argdict:
			self.__setitem__(key,argdict[key])
	def __setitem__(self,key,item):
        	''' set item just as if it is dictionary, but keys are limited'''
        	if key not in self.allowed: self.reject(key)
        	e=ElementTree.SubElement(self.element,key)
		e.text=item
	def reject(self,key):
        	raise 'Invalid key in TraceBack Ping:'+key
	def toXML(self):
		''' take element tree instance and create xml string '''
		s=ElementTree.tostring(self.element)
		return s
	def toURLdata(self):
		''' take element tree instance and create url encoded payload string '''
		s=[]
		for item in self.element:
			s.append((item.tag,item.text))
		return urllib.urlencode(s)
	def noValidURL(self):
		''' At some point this could check the url for validity etc '''
		e=self.element.find('url')
		if e is None: return 1
		if e.text=='': return 1
		return 0

~~~~~

**Update: 15th March, 2006**: Use of blogname replaced with blog_name (might as well get it right :-)
