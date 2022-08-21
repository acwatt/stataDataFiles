* Change to desktop folder where I can save dta files to
cd "C:\Users\aaron.watt\Desktop\stata datasets"
* Copied and pasted the output of `sysuse dir' below to get all the sysuse dta files
local files   auto.dta        autornd.dta     cancer.dta      citytemp4.dta   lifeexp.dta     nlsw88.dta      sandstone.dta   tsline1.dta     uslifeexp2.dta auto16.dta      bplong.dta      census.dta      educ99gdp.dta   network1.dta    nlswide1.dta    sp500.dta       tsline2.dta     voter.dta  auto2.dta       bpwide.dta      citytemp.dta    gnp96.dta       network1a.dta   pop2000.dta     surface.dta     uslifeexp.dta   xtline1.dta
* for each file, open it and save it to my directory
foreach f in `files' {
	di "`f'"
	sysuse `f'
	save `f'
}