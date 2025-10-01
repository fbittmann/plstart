plstart: Getting parallel started
======================================================================
_plstart_ is run before parallel to create random seeds in one step.

Installation
============

``` stata
. net install plstart, from(https://raw.github.com/fbittmann/plstart/stable) replace
```

Examples
========

Setup and minimal example
-------------------------
``` stata
sysuse nlsw88, clear
plstart, threads(4) seed(123) force
di r(plseed)
parallel bs, reps(40) seed(`r(plseed)'): reg wage
estat bootstrap, bc
```

Citation
============
Thanks for citing this software as follows:

> Bittmann, Felix (2024): plstart: Getting parallel started. Available from: https://github.com/fbittmann/plstart
