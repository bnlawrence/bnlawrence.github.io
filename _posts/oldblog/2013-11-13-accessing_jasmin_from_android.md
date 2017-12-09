---
layout: post
title: Accessing JASMIN from Android
last_modified: Wednesday 13 November, 2013
tags: jasmin
categories: computing
---
I have a confession to make. I sometimes illicitly work using my android phone and legitimately with my android tablet. Sometimes that work involves wanting to ssh into real computers, and edit files on real computers. One real computer I want to access is JASMIN, and access to JASMIN is controlled by passphrase protected public/private key pairs.

This is how I do it. None of it's rocket science, but I'm documenting it here, since there a zillions of *possible* tools, and I spent ages working out which ones I could actually use ... so this is to save you that wasted time.

Before we start a couple of words of warning though: To do this you're going to have to put a copy of your private key on your Android device. It's important to realise that means someone with access to your android device is only one step away from access to your computing accounts. In my case, to protect that key I have taken three steps: I have encrypted my android device, I have a very short time (30s) before lockdown, and I have remote wipe enabled.  If the bad guys still get access, my key still has a pass phrase! I hope those steps are enough that if I lose my phone/tablet I will realise and block access before anything bad could happen.

You might read elsewhere about how to use dropbear and your public key on your device. Right now, dropbear doesn't support keys with passphrases, so I am not using dropbear (since to do so would require me to remove the passphrase on my private key). This also means that some Android apps for terminal access which use dropbear under the hood (pretty much any that use busybox) can't exploit a properly protected public key.  You can use them for lots of things, but don't use them for JASMIN (or similar) access.

Ok, onwards.

####  Step 1: Get your Key  

Get a copy of your ssh private key onto your device. You can do this by any means you like, but ideally you'd do it in a secure way. This is the way I did it:
1. Make sure you have your private key somewhere where you can get at it by *password* protected ssh (not key protected). 1. Load an app onto your device which gives you an scp/ssh enabled terminal **to your device**. I used AirTerm (which provides a cool floating terminal, very useful on tablets especially). Note that unfortunately AirTerm is **not** suitable for JASMIN access because it appears to use dropbear under the hood, and so it can't handle our private/public key pairs.
    * (If you are using AirTerm, you will want to go to preferences and install kbox to follow what I've done.)1. Fire up AirTerm, and change working directory:<pre>
cd /storage/sdcard0</pre>1. Make a directory for your key, and change into it, something like<pre>
mkdir mystuff
cd mystuff</pre>1. Now scp your private key into that directory, something like:<pre>
scp you@yourhost.wherever:path_to_key/your_private_key .</pre>1. You may or may not need to move the copy of your your_private_key on yourhost.wherever, depending on whether it's secure there.

(You're done with AirTerm for now, but I'm sure you'll find lots of other uses for it.)

####  Step 2: Get and Configure JuiceSSH  

I use JuiceSSH to work with remote sites which use the key infrastructure. It has lots of nice properties (especially the pop up terminal keyboard) and it can manage connections and identities, and handle multi-hop ssh connections (e.g. for JASMIN, as needed to get via the login nodes to the science nodes).

JuiceSSH is pretty straightforward. Here's what you need for JASMIN.
1. Fire up JuiceSSH. You will need a password for juice itself. Select something memorable and safe ... but different from your private key passphrase!
(If you're like me, and forget these things, you might want to exploit something like lastpass to put this password in your vault).1. Add your JASMIN identity:
    * Select a nickname for this identity, give it your jasmin username, and then choose the private key option. Inside there let smart search find your public key (and then tick it). Update and save.1.  Now add a connection to jasmin-login1, the options are pretty straightforward. You can test it straight away. If it doesn't work, ask yourself if you need to use a VPN client on your phone/tablet first to put yourself in the right place for JASMIN to take an inbound connection.1.  You can add a direct connection to jasmin-sci1 (or your science machine) by using the via option in the setup. Here's an example of how to configure that.

![Image: IMAGE: static/2013/11/13/juice.png ](/assets/images/2013-11-13-juice.png)

In that example, "jasmin login" is the nickname I gave to the connection to jasmin-login1, and "bnl jasmin pk" is the nickname for my jasmin identity.

Now you can access JASMIN, but what about editing files?

####  Step 3: Get and Configure DroidEdit  

I'm using Droidedit as my tool of choice for editing on Android, although, to be fair, I'm not doing that much editing on Android yet so I'd be interested in hearing if there are other better tools. I primarily chose it because it has support for both pki and editing remote files via sftp.

Once you have DroidEdit, you need to go into settings, and to into the SFTp/FT actions "Add Remote Server". Configure with path to your private key, and save using the server address jasmin-login1.ceda.ac.uk. Ignore the fact that the test fails (note that it prompts you for a password, not a passphrase).

Then, go back out, and try and open a file on jasmin, this time you'll get prompted for a passphrase, and voila, it should just work (as before, make sure your android device has used a VPN or whatever to be "in the right place").
