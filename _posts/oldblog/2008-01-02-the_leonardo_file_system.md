---
layout: post
title: the leonardo file system
last_modified: Wednesday 02 January, 2008
tags: pyleo python
categories: computing
---
The most difficult thing about porting leonardo is interfacing with the leonardo file system (lfs). The lfs was designed to allow multiple backends through a relatively simple interface ... of course it's not properly documented anywhere, so remembering how it works was a bit difficult.
The following piece of code shows the general principle:
~~~~~ python
from filesystem import LeonardoFileSystem
import sys,os.path
def WalkAndReport(leodir,inipath='/'):
    ''' Walks a leonardo filesystem and reports the contents in the same way
    as doing ls -R would do '''

    def walk(lfs,path):
        directories,files=lfs.get_children(path)
        for f in files:
            leof=lfs.get(os.path.join(path,f))
            #The following is the actual content at the path ... if it exists.
            #It's what you would feed to a presentation layer ...    
            content=leof.get_content()
            print '%s (%s)'%(f,leof.get_content_type())
            for p in leof.get_properties(): print '---',p,leof.get_property(p)
            #check for comments and trackbacks ... is there any other sort?
            comments=leof.enclosures('comment')+leof.enclosures('trackback')
            #comments and trackbacks are leo files ...
            for c in comments:
                for p in c.get_properties(): print '------',p,c.get_property(p)
        for d in directories:
            leod=os.path.join(path,d)
            print '*** %s ***  (%s)'%(d,leod)
            walk(lfs,leod)

    lfs=LeonardoFileSystem(leodir)
    walk(lfs,inipath)
if __name__=="__main__":
    lfsroot=sys.argv[1]
    if len(sys.argv)==3:
        inipath=sys.argv[2]
    else: inipath='/'
    WalkAndReport(lfsroot,inipath)

~~~~~

While I'm at it, I'd better document a small bug in the leonardo file system itself that manifested itself on this blog (python 2.4.3 on Suse 10) but nowhere else ... the comments came back in the wrong order. The following diff on filesystem.py fixed that:<pre>
    def enclosures(self, enctype):
+        #BNL: modified to reorder by creation date, since we can't
+        #rely on the name or operating system.
         enc_list = []
         for d in os.listdir(self.get_directory_()):
             match = re.match("__(\w+)__(\d+)", d)
             if match and enctype == match.group(1):
                 index = match.group(2)
-                enc_list.append(self.enclosure(enctype, index))
-        return enc_list
+                e=self.enclosure(enctype, index)
+                sort_key=e.get_property('creation_time')
+                enc_list.append((sort_key,e))
+        enc_list.sort()
+        return [i[1] for i in enc_list]</pre>