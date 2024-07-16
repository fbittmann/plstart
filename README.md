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
sysuse auto, clear
plstart, threads(2) seed(454)
di "`r(rseeds)'"
parallel bs, reps(4000) seed("`r(plseeds)'"): reg mpg weight
estat bootstrap, bc
```

Citation
============
Thanks for citing this software as follows:

> Bittmann, Felix (2024): plstart: Getting parallel started. Available from: https://github.com/fbittmann/plstart
