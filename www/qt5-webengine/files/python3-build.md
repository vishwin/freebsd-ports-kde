# Building Qt5-WebEngine with Python3

> This file lives deep in the bowels of a fork of the FreeBSD Ports repository
> because that's where I developed it. I hope it applies elsewhere, too.

You will need:
 - `python3-build.diff` (the actual Python3 bits)
 - `patch-configure.pri` (patches configure to accept Python3)
 - **possibly** `patch-*.py` from this directory; those are the
   FreeBSD patches to the Python bits that are needed to get it
   to work / build with Python2 on FreeBSD. It's possible that
   parts of the Python3 patch assume that these other patches are
   already applied.
   
You will also need:
 - Python 3 (I test with Python 3.7)
 - patience
 
## Approach

> The FreeBSD ports file (`Makefile` in the parent directory, along
> with the whole machinery of the FreeBSD ports system) does this
> automatically; others will need to adapt some:

 - make sure you have Python3 installed, and no Python2
 - extract, patch, and run configure for WebEngine
 - then apply the `python3-build.diff` patch; it might patch things
   that are generated during configure
 - then do the build itself
 
## TODO

> While everything **builds**, the resulting WebEngine is only partly-
> usable. Some Javascript functions are not available, and that means
> that many websites don't work well. Plain sites, or those that happen
> not to use the broken bits, are fine and it is possible to load up
> kde.org with any WebEngine-using browser after a Python3 build.

 - I haven't checked if the changes to the build still work with Python2;
   this would be convenient to cross-check that the results are the same
 - In some places, sorting has been abandoned (e.g. in generated C++ code
   where templates are defined alphabetically), which makes the delta
   from Python2 larger than necessary
 - There's one gross hack that re-introduces `keywords.h` into the includes
   of interfaces: it gets lost somewhere in the rest of the machinery.
 - At least two Javascript methods are missing

