

!* version 1.1 October 1, 2025 FB
program define plstart, rclass
	syntax, Threads(integer) Seed(integer) [force]
	parallel initialize `threads', `force'
	set seed `seed'
	local rvalues 
	forvalues i = 1/`threads' {
		while 1 {
			local new = round(runiform() * 999999)
			if strpos("`rvalues'", "`new'") == 0 {
				local rvalues `rvalues' `new'
				continue, break
			}
		}
	}
	return local plseed `rvalues'
end
