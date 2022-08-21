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
install.packages("haven")  # only need this if haven is not installed
library(haven)  # load the read_dta function
url <- "https://github.com/acwatt/stataDataFiles/raw/main/auto.dta"
auto <- read_dta(url)
```

## Julia
For loading in Julia, first get the url for the .dta file (see the [R section](https://github.com/acwatt/stataDataFiles/tree/main#r) above). Then use the following code to load the file from the web:
```
using Pkg
Pkg.add(["StatFiles", "FileIO", "DataFrames"])  # only need these two lines if not installed 
using StatFiles, DataFrames, Downloads
url = "https://github.com/acwatt/stataDataFiles/raw/main/auto.dta"
file = last(split(url,"/"))
download(url, file)
df = load(file) |> DataFrame
rm(file)
```
*Note: there might be a way to load a dta files from url, but I was not able to find it in the StatFiles documentation. `download()` by default creates a temporary file, but `StatFiles.load()` was unable to determine that the temporary file (which has the .tmp extension instead of .dta) was a stata file. There seems to be a way to pass the file type directly to `StatFiles.load()`, but was not well documented and I could not find the correct syntax. Downloading the file locally, loading, and then deleting seems to be the most straight-forward way of loading from a url.
