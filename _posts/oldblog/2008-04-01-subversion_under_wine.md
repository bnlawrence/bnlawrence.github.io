---
layout: post
title: Subversion under WINE
last_modified: Tuesday 01 April, 2008
categories: computing
tags: UML
---
Today's task. Trying to get Enterprise Architect working
with subversion.

[Enterprise Architect](http://www.sparxsystems.com.au/) runs under [CrossOver Office](http://www.codeweavers.com/products/cxoffice/) on linux ([Wine](http://www.winehq.org/)) and getting it to work with subversion is not as straightforward as one might like (but the folks at sparxsystems are very helpful!)

The first step is to verify that we can use subversion within
crossover office.

I installed the standard windows 32 bit binary into my EA bottle.

The two repositories I am interested in working with
are available via https:// and svn+ssh://, and neither worked straightforwardly (I think the sparxsystems folk have only worked with regular svn:// repositories thus far).

To test access, I created simple batch files of the form:
<pre>
"C:\Program Files\Subversion\bin\svn.exe" checkout "https://url-stuff" &gt; svnlog.log &amp;2&gt; svnlog-err.log
</pre> and
<pre>
"C:\Program Files\Subversion\bin\svn.exe" checkout "svn+ssh://url-stuff" &gt; svnlog.log &amp;2&gt; svnlog-err.log
</pre>
which I put in my /home/user/.cxoffice/ea/drive_c/ directory with names something like *batfile.bat*. (In both cases, the repositories already exist and work fine with linux subversion).

We can then run those windows bat files with a unix script like this one:
<pre>
/home/user/cxoffice/bin/wine --bottle "ea" --untrusted --workdir "/home/user/.cxoffice/ea""/drive_c" -- "/home/user/.cxoffice/ea/drive_c/batfile.bat"
</pre>
Neither work. The two error messages I got were:
* (https:) svn: Network socket initialization failed
* (svn+ssh:) svn: Can't create tunnel: File not found

I haven't made much progress with the former. Googling yielded [this query](http://www.winehq.org/pipermail/wine-users/2008-January/028662.html) to the wine list. The author got no response and currently has no solution (I checked with him personally).

However, I made real progress with the latter. The best advice I found was [this](http://subclipse.tigris.org/servlets/ReadMsg?list=users&amp;msgNo=3334), but there were enough things to think about for the wine environment that it's worth documenting here.
1. I spent some fruitless time trying to install tortoiseSVN into my EA bottle under crossover. (It seems to work, but under a win2000 bottle, and EA needs a win98 bottle). I then tried Putty ... which installed fine. You'll need the lot (make sure you download the installer not the simple .exe).
1. You will need a public key and private key set up so that the batch files run by EA (and you in testing) can work, so we get that done first.
1. On my laptop, I used
<pre>
ssh-keygen -t rsa
</pre> to get a public and private key pair ([thanks](http://silenceisdefeat.org/wiki/index.php/SSH_Key_Authentication)). For the moment I'm using no passphrase (the laptop disk itself is encrypted).
1. Now I had a pair of keys sitting in my laptop ~/.ssh/ directory.
1. The repository I want to get to lives on *server*, so I log into *server*, so the public key needs to be there. I changed directory into my .ssh directory there, and     
    1. created an empty file authorized_keys (just "touch authorized_keys")     
    1. opened that file up, and copied in the public key from my laptop directory.     
    1. Then I tested that key pair from the command line (under linux, ssh you@*server*). Fine.
1. Then putty has to be encouraged to use that private key.     
    1. Putty doesn't understand the openssh private key file we've just generated, so we need to convert it.
         1. A copy visible to windows is needed (i.e. copied away from the hidden .ssh directory).
         1. Run puttygen from the crossover office run windows command (browse to the executable in the Putty Program Files directory).
         1. Now click on File&gt; Load Private Key and load the file, then save the private key out as .ppk file. Delete the copy of the private key, and move the .ppk file somewhere special on your drive_c in your windows partition.
1. Now you need to make sure that ssh is configured to use your putty. So, that means putting <pre>
ssh = "C:\Program Files\PuTTY\plink.exe" -i "C:\\yourdir\\yourfile.ppk"</pre> in your subversion config file (which lives in <pre>
.cxoffice/yourEABottle/drive_c/Windows/Application Data/Subversion
</pre>
And now at least I can checkout a working copy ...

I'll try and integrate that with EA another day, and the https problem will have to wait too. That lot took more than twice the time I allocated for it ...

#### trackbacks (1)
*[More on the windows subversion client under wine.]({% post_url oldblog/2008-04-16-more_on_the_windows_subversion_client_under_wine%}) (from "Bryan's Blog" on (on Thursday 17 April, 2008)*

... by way of notes wrt to the https problems ...
