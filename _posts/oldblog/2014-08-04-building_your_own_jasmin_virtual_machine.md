---
layout: post
title: Building your own JASMIN Virtual Machine
last_modified: Monday 04 August, 2014
tags: jasmin
categories: computing
---
I make a good deal of use of the JASMIN science virtual machines, but sometimes I want to just do something locally for testing. Fortunately you can build your own virtual machine using the "[ JASMIN Analysis Platform](http://proj.badc.rl.ac.uk/cedaservices/wiki/JASMIN/AnalysisPlatform)" (JAP) to get the same base files.

Here's my experience building a JAP instance in a VMware Fusion virtual machine (I have a Macbook, but I have thus far done all the heavy lifting inside a linux mint virtual machine ... but the JAP needs a centos or redhat base machine, hence this).

####  Step One: Base Virtual Machine  

We want a base linux virtual machine on which we build the JAP.
1. Start by downloading a suitable base linux installation (Centos or RedHat). Here is one I got some time ago: CentOS-6.5-x86_64-bin-DVD1.iso

####  Step Two: Install the JAP  

Following instructions from [here](http://proj.badc.rl.ac.uk/cedaservices/wiki/JASMIN/AnalysisPlatform/Installation#RPMs). There are effectively three steps plus two wrinkles. The three steps are: get the Extra Packages for Enterprise Linux into your config path; get the CEDA JAP linux into your config path; and build.  Then the wrinkles: the build currently fails! However, the fixes to make it build are pretty trivial.
1.  Open up a terminal window and su to root.
--&gt; Finished Dependency Resolution
Error: Package: gdal-ruby-1.9.2-1.ceda.el6.x86_64 (ceda)
           Requires: libarmadillo.so.3()(64bit)
...
Error: Package: grib_api-1.12.1-1.el6.x86_64 (epel)
           Requires: libnetcdf.so.6()(64bit)
...
               Not found
 You could try using --skip-broken to work around the problem
 You could try running: rpm -Va --nofiles --nodigest
exclude=grib_api*

And stand back and wait. You'll soon have a jasmin-sci-vm.