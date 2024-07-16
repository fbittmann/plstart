
*Felix Bittmann, 2024

cap program drop plstart
program define plstart, rclass
	syntax, threads(integer) seed(integer) [force]
	parallel initialize `threads', `force'
	set seed `seed'
	local rvalues ""
	forvalues i = 1/`threads' {
		local new = round(runiform() * 999999)
		local  rvalues `rvalues' `new'
	}
	return local plseeds "`rvalues'"
end



/*EXAMPLE
sysuse auto, clear
plstart, threads(2) seed(454)
di "`r(rseeds)'"
parallel bs, reps(4000) seed("`r(plseeds)'"): reg mpg weight
estat bootstrap, bc
*/
