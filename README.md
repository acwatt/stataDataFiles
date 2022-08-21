# Contents
Stata DTA files that are in version 17's sysuse directory.

# Purpose
This is to allow easy use of example data files to compare analyses between Stata and other programs (R, Julia, Python, etc).
Below are some examples of how to load these datasets in other languages. This is an incomplete list, so please comment or make a pull request to add other methods.

# Example Usage
## Stata
These are the built-in data files for stata, so loading them in Stata is the easiest. I'll use `auto.dta` as the example dataset we want to load.
```
sysuse auto
```

## R
For loading these .dta files in R, we need to have the `haven` package installed and loaded, and need to grab the "raw data url" from the github page for the data set.
Go to the [auto dta page](https://github.com/acwatt/stataDataFiles/blob/main/auto.dta) in the list above, right click on the download button, and click "Copy link address".
For auto.dta, this will look like `https://github.com/acwatt/stataDataFiles/raw/main/auto.dta`. Also, you can just put the name of the file you want into this template url:
`https://github.com/acwatt/stataDataFiles/raw/main/[dataset name].dta`
Then the code below will load the file in R from the web:
```
install.packages("haven")  # only need this if it's not installed
library(haven)  # load the read_dta function
auto <- read_dta("https://github.com/acwatt/stataDataFiles/raw/main/auto.dta")
```

## Julia
For loading in Julia, first get the url for the .dta file (see the [R section above](
