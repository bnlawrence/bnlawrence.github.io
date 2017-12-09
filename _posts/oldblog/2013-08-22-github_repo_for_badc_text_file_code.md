---
layout: post
title: github repo for badc text file code
last_modified: Thursday 22 August, 2013
categories: computing
tags: curation formats
---
Some years ago, my colleagues Graham Parton and Sam Pepler developed a metadata content standard to allow the ingestion of comma separated value (csv) files of data into the BADC archive. What they wanted to do was allow folks whose primary data manipulation tool was a spreadsheet to have a viable and easy mechanism of getting their data into our managed environment.

Data in a managed environment needs to be in well known formats that can be persisted for a long time, and it has to have adequate metadata. Normal (e.g. excel) spreadsheets fail both criteria: over the years the format has changed, and has not always been well enough documented that one would have confidence that all the content could be recovered in the future (when the original software is no longer available). CSV files exported from spreadsheets can be persisted, but like their spreadsheets, don't necessarily have the right metadata.

The [BADC text file](http://badc.nerc.ac.uk/help/formats/badc-csv/) "format" (it's not really a format) was designed to address those metadata requirements with some modest mandatory information and a syntax for optional information. BADC has run a [checker](http://badc.nerc.ac.uk/cgi-bin/badccsv/badctextfileChecker-cgi.py) (so that folks can check their files comply) for some years now, but never made any code for using/manipulating these files available.

A few days ago I discovered that (since I wanted to have some files hang around on my desktop, and I've long since discovered that **I** need metadata, never mind the BADC). I could have used NetCDF, but I have a policy of trying out BADC stuff whenever I can, so I tried the text files, and wasn't happy that I couldn't find any public code.

Well there is public code now: https://github.com/cedadev/badctext!

#### comments (2)
*[Rob De Almeida](http://dealmeida.net/) (on Friday 23 August, 2013)*
Pretty cool! I wasn't aware of BADC, seems like a nice format for non-technical users to publish data. I'll definitely look into this.

One thing I wonder -- and my knowledge here is very limited -- is if we could create an Excel spreadsheet that exports to BADC, maybe with a wizard that asks the user for the metadata.

*Bryan (on Wednesday 28 August, 2013)*
Good question. I asked the same one a week ago, and no one here has the expertise ... but it should be doable, and a useful thing to get done.
