---
layout: post
title: Why is climate modelling stuck?
last_modified: Wednesday 16 January, 2008
tags: climate resolution modelling_futures
categories: environment
---
[Why is climate modelling stuck?](http://initforthegold.blogspot.com/2007/12/why-is-climate-modeling-stuck.html) Well, I would argue it's not stuck, so a better question might be: "Why is
climate modelling so hard?". Michael Tobis is arguing that a modern
programming language and new tools will make a big difference. Me, I'm
not so sure. I'm with [Gavin](http://initforthegold.blogspot.com/2007/12/why-is-climate-modeling-stuck.html#c7506314125949953910).
So here is my perspective on why it's hard. It is of necessity
a bit of an abstract argument ...
1. We need to start with the modelling process itself. We have a physical
system with components within it.  Each physical component needs to be
developed independently, checked independently ... This is a scientific, then
a computational, then a diagnostic problem.1. Each component needs to talk to other components, so there needs to be a
communication infrastructure which couples components. Michael has criticised
ESMF (and by implication PRISM and OASIS etc), but regardless of how you do
it, you need a coupling framework. This is a computational problem. I think
it's harder than Michael thinks it is. Those [ESMF](http://www.esmf.ucar.edu/) and [PRISM](http://www.cerfacs.fr/PRISM/prism.html) folks are not
stupid ...1. All those independently checked components may behave in different ways when
coupled to other components (their interactions are nonlinear). Understanding
those interactions takes time. This is a scientific and diagnostic problem.1. We need a dynamical core. It needs to be fast, efficient, mass preserving,
and stable in a computational sense. Stability is a big problem, given that
the various parameterisations will perturb it in ways that are quite
instability inducing. This is both a mathematical and a computational
problem.1. We need to worry about memory. We need to worry a lot about memory actually.
If in our discussion we're going to get excited about scalability in
multi-core environments, then yes, I can have 80 (pick a number) cores on my
chip, but can I have enough memory and memory bandwidth to exploit them? How
do we distribute our memory around our cores?1. What about I/O bandwidth? Without great care, the really big memory hungry
climate models can often get slowed up and be waiting spinning empty CPU
cycles waiting for I/O. This is a computational problem.

Every time we add a new process, we require more memory. The pinch points
change and are very architecture dependent. Every time we change the
resolution, nearly every component needs to be re-evaluated. This takes time.

At this point, we've not really talked about code per se. All that said, the
concepts of software engineering do map onto much of what
is (or should be) going on. Yes, scientists should build unit tests for
their parameterisations. Yes, there should be system/model wide tests. Yes, task
tracking and code control would help. But, every time we change
some code there may be ramifications we don't understand, not only in terms
of logical (accessible in computer science terms) consequences, but from a
scientific point of view, there might be some non-linear (and inherently
unpredictable) consequences. Distinguishing the two takes time, and I totally
agree that better use of code maintenance tools would improve things, but
sadly I think it would be a few percent improvement ... since most of the
things I've listed above are not about code per se, they're about the science
and the systems.

So, personally I don't think it's the time taken to write lines of code that makes
modelling so hard. Good programmers are productive in anything. I suspect
changing to python wouldn't make a huge difference to the
model development cycle. That said, anyone who writes diagnostic code in Fortran,
really ought to go on a time management course: yes learning a high level
language (python) takes time, but it'll save you more ... but the reason for that
is we write diagnostic code over and over. Core model code isn't written over
and over ... even if it's agonised over and over :-)

Someone in one of the threads on this subject mentioned XML. Given that there
(might be) a climate modeller or two read this: let me assure you, XML solves
nothing in this space. XML provides a syntax for encoding something, the hard
part of this problem is deciding what to encode. That is, the hard part of
the problem is the semantic description of whatever it is you want to encode (and
developing an XML language to encapsulate your model of the model: remeember
XML is only a toolkit, it's not a solution). If you want to use XML in the
coupler, what do you need to describe to couple two (arbitrary)
components? If it's the code itself, and you plan to write a code generator,
then what is it you want to describe? Is it really that much easier to write
a parameterisation for gravity wave drag in a new code generation language? What
would you get from having done so?

So what is the way forward? [Kaizen](http://www.12manage.com/methods_kaizen.html): small
continuous improvements. Taking small steps we can go a long way ...  Better coupling
strategies. Better diagnostic systems. Yes: Better coding standards. Yes: more use
of code maintenance tools. Yes: Better understanding
of software engineering, but even more importantly: better understanding of
the science ([more good people](http://home.badc.rl.ac.uk/lawrence/blog/2006/11/03/the_future_of_physics_and_science))! Yes: Couple code changes to task/bug trackers. Yes: formal
unit tests. No: Let's not try the cathedral approach.
The [bazaar](http://catb.org/~esr/writings/cathedral-bazaar/) has got us a long way ...

(Disclosure:I was an excellent fortran programmer, and a climate modeller. I
guess I'm a more than competent python programmer, and I'm sadly expert with
XML too. I hope to be a modeller again one day).

#### trackbacks (1)
*[Using more computer power, revisited.]({% post_url oldblog/2008-01-23-using_more_computer_power_revisited %}) (from "Bryan's Blog" on (on Wednesday 23 January, 2008)*)

In the comments to my post on why climate modelling is so hard, Michael Tobis made a few points that need a more elaborate response (in time and text) ...

#### comments (10)
*[Michael Tobis](http://initforthegold.blogspot.com) (on Wednesday 16 January, 2008)*

I agree with your summary of the issues and I think on the whole are approaches are compatible. However I insist you are missing my crucial point: models must be readable and modifiable by non-experts.

This is a difficult concept even to explain in our sphere when, as you point out, so many fields of expertise are involved. The underlying principle is encapsulation. To the extent possible it must be supported that only a single one of these issues needs to be considered at a time. That extent is far greater than is commonly understood; this is the bit of progress I hope to inmprt.

While I have grave doubts about ESMF, its their methods not their goals I question. I'm deliberately not looking too carefully at PRISM on the principle that independent development of ideas is potentially useful.

The short version of my approach: tighter coupling between people, looser coupling between modules. I never said this was going to be easy. I just said it's time to start over.
\
*Bryan (on Wednesday 16 January, 2008)*
"Readable and modifiable by non-experts"! Why?

I'm happy about encapsulation, that gives us unit tests (good things), but complexity can hide in the coupling between the encapsulated bits ... (I think you know this, but would your non expert?)

Happy with your half your summary: the tighter coupling between people bit :-)

*Jordan Dawe (on Wednesday 16 January, 2008)*

There are two reason code should be readable and modifiable by non-experts.  The first is that it opens the use of models to a much wider audience of scientists.  Climate researchers who are not primarily modelers will be able to run the models and more research will get done.  The second is that if it is readable and modifiable by non-experts, then reading and modification becomes trivial for experts to do.  I spend over half my time fighting with bugs and figuring out how the heck a piece of model code works.  If that could be halved, my life would be so much better and I would get much more work done.

*Bryan (on Wednesday 16 January, 2008)*
Jordan: sorry, I don't buy it. I think you're confusing the model with the code ...

1) Why stop at climate modelling? Should I be able to repeat a piece of gene manipulation from a biomedical laboratory? I think it's ok to have a role for experts.

2) It'll be a long time before non-experts should be interpretting the results of climate models they have run with no expert understanding of the science (the code doesn't matter ... as Michael has said in the past).

3) No argument about making things more readable, but there is a huge gap between existing common practise and making things readable and useable by non-experts ... perhaps we should try moving into that gap first (doing a better job of documenting what we have done) ... before we address non-experts as our audience we should get stuff readable by experts ...

*Jordan Dawe (on Wednesday 16 January, 2008)*

By "expert" I assumed you meant modeler vs experimentalist, not scientist vs layman.  I can barely get most climate models to run, and running models is all I do.  I don't see how someone who doesn't know their way around the intricacies of makefiles even has a hope.

*Andrew Charles (on Thursday 17 January, 2008)*

Absolutely agree about small steps. There is no magic language, awesome new unified physical modelling framework, or high level specification language waiting around the corner to revolutionise anything.

Sure, I would jump for joy if I was maintaining nice pythonic code instead of the mishmash of C shell scripts, Fortran 77 and IDL that come my way. But would any of this have a big impact on forecast skill, or understanding predictability? Unlikely.

*[Michael Tobis](http://pencilscience.blogspot.com) (on Thursday 17 January, 2008)*

When I say the 'code doesn't matter' (I am not sure I would have used those words, but anyway) what I am trying to say is that the extant code is replaceable even though the underlying conceptual model is valuable. This is not the impression you get from the modeling centers, and notably ESMF whose misguided mission is to get extant codes to interoperate.

Ray Pierrehumbert and his students, Isaac Held and his, that ilk, are handy enough with a makefile, but that is tragic. They are geophysics experts, not software experts. These guys should be thinking about the world and not about the computational infrastructure. The amount of time that these people should spend between conceiving a feasible experiment and setting it running should be minimized. These guys are not software experts and they should not be.

The appeal of Python to Ray is that it reduces his cognitive load out of the box. The appeal of it to me is that I can reduce it drastically more.

The core problem is that modeling efforts are being led by self-taught geophysicists, not by people who understand computation. This is not unrecognized in software circles, but it seems utterly unclear to domain experts.

Andrew Charles asks the key question "But would any of this have a big impact on forecast skill, or understanding predictability?" and answers in the negative. This recapitulates an error that has appeared constantly in the history of computing.

To understand how and why the richness of our vocabulary affects our intellectual capacity, a good place to start is Paul Graham's essays on computer languages. Consider the section entitled "The Cost of Being Average" at  http://www.paulgraham.com/icad.html which pretty much summarizes the approach in question.

The list of Lisp attributes and benefits in that article (all but #6 of which apply to Python; that being the strongest argument for Ruby) is worth thinking about much more seriously in the scientific programming world than is usually seen.

In the end, a hacker believes in rough consensus and working code. The question then is the shortest approach to something so drastically better that a skeptic will see its advantages. One can't prove these ideas in advance; one can only make a sufficient plausibility argument and hope to get the modest resources it would need to demonstrate the case.

(I can't believe I spelled 'our' as 'are'. Too much exposure to undergrads. My mind is turning to mush! Anyway, somebody smarter than me should do as I say!)

*Bryan (on Friday 18 January, 2008)*

Sorry Michael, indeed you didn't put it like that. Your clarification doesn't undermine my point which was that the code embodies the model (physics etc) and that to run the code and *interpret the results* you had better understand the model.

I  think there is an interesting question about leadership to be discussed another time.

One of the problems is your assertion that the code is replaceable: it might well be, but the replacement effort is not only to do the code conversion (formidable), but then the code validation (formidable squared). No big centre can easily afford to do this in the middle of their commitments to IPCC etc ... (but most are trying, see for example the FLUME project in the UK etc ... led by computational scientists not geophysicists per se).

*[Michael Tobis](http://pencilscience.blogspot.com) (on Saturday 19 January, 2008)*

First of all, do you think existing codes are validated? In what sense and by what method?

Code conversion is pointless; you simply get the same "model" (cluster of supported modeling behaviors, actually) written in a different syntax. It is my belief that the current codes (possibly excepting the radiation codes, which I haven't really understood) could be replaced with dynamically equivalent code that is about two orders of magnitude terser; hence on the order of 10KLOC.

That said I appreciate your other comments.

In response to your leadership issue I could reframe my position as follows.

Computational scientists do not understand the nature of climate science well enough, and they seem to be constantly importing their experiences from less unruly sciences where the fundamental theory is known but the consequences are not.

Climatologists are trying to use models to derive the fundamental theory! However, it is in the nature of the field to value the trees and hope the forest somehow comes together, even though it is the forest whose dynamics we wish to understand. That is, the value of generalization and abstraction is unappreciated, and the potential value of systematic explorations of model space is somehow almost invisible, or occasionally pursued in a naive and unsophisticated way.

I think, as a consequence, that computational scientists seek to apply the wrong abstractions, while climatologists deny the availability of powerful abstractions at all.

It strikes me that there is potential for a synthesis rather than a compromise.

It seems ridiculous for someone of my modest achievements to propose myself as a pioneer of the synthesis except that I constantly feel that I am talking to two groups of people both of which I deeply respect but neither of which manages to understand the other.

Perhaps I am wrong about what the synthesis would look like, but for now let's leave that aside. A bigger concern is that, as many participants in the conversation so far assert,  there is no way forward that is substantially better than what we have.

If not, I think the earth system modeling enterprise has reached a point of diminishing returns where further progress is likely to be unimpressive and  expensive.

It seems to me that despite his inevitable cheerleading for his effort, Gavin's claim that models cannot reasonably provide regional predictions amounts to a vote in favor of the previous proposition. If regional predictions can't be improved, global projections will remain messy, and it's time to fold up the tent and move on to doing something else. The existing software base can be cleaned up and better documented, and then the climate modeling enterprise should then be shut down in favor of more productive pursuits.

I have very serious doubts about the utility of ESMs built on the principles of CGCMs. We are looking at platforms five or six orders of magnitude more powerful than today's in the foreseeable future. If we simply throw a mess of code that wastes those orders of magnitude on unconstrained degrees of freedom, we will have nothing but a waste of electricity to show for our efforts.

*Bryan (on Monday 21 January, 2008)*
I have to do my day job for a bit. I'll write something cogent (I hope) as a blog entry reply in a few days :-)
