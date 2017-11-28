---
layout: post
title: Dr Matt Jones
categories: academic
tags: teaching hpc_io
---

A good day for any academic - when one of her or his students passes their viva (oral examination) for their doctorate.

Today, Matt Jones defended his thesis: _Parallel Data Analysis for Atmospheric Science_. Congrats Matt!

## Matt's Abstract

Data sizes are growing in atmospheric science, as climate models increase to higher resolutions
to improve the representation of atmospheric phenomena, and larger numbers of ensemble
members are used as to better capture the variability in the atmosphere. New methods
need to be developed to handle the increasing size of data – traditional analysis scripts often
inefficiently read and process data, leading to excessive analysis times. Research into large
data analysis often focuses on providing solutions in the form of software, or hardware, rather
than providing quantitative results on what factors can reduce performance in an application.
This thesis quantitatively investigates these factors in the software-hardware stack, in order
to make decisions of how to handle the large data sizes during application development and
data management. This is done in the context of an atmospheric science workflow in a high performance
computing environment.

A major bottleneck in analysis in atmospheric science is reading data. Two of the primary
factors which are commonly known to affect the read rate are the read pattern, and the read
size. These factors are found in this work to reduce the read rate by up to 10-50 times for poor
combinations. Other factors which could affect the read rate for atmospheric analysis include:
the programming language, the libraries used, and the file layout.

NetCDF4 is one of the most commonly used data formats in atmospheric science, and the
Python library netCDF4-python is one of the main interfaces used. As part of the NetCDF4
file format, there are options for chunking (multidimensional tiling), and inbuilt compression,
which can be used to improve read and write performance from the files. It was found that
at peak performance the netCDF4-python library performs 40% worse than the underlying C
NetCDF4 library. With respect to chunking and compression, poor combinations of chunking,
and inbuilt compression, were found to reduce the performance by over 100 times.

One solution to reduced performance, or a way to reduce analysis times on large datasets,
is to run applications in parallel. It is important to understand how, on a particular platform,
application relevant parallel reads will scale in order design an efficient application. The parallel
scaling of the JASMIN super-data cluster was analysed. The investigation methodology,
and conclusions from the investigation can be applied to other platforms.
A case study was used to apply the results from this work in a real atmospheric science
workflow – a space-time spectral analysis technique. It confirmed that these results do indeed
apply to real workflows.
