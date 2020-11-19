# Code of Conduct

Please note that the StringTools project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.


# StringTools

<!-- badges: start -->
<!-- badges: end -->

StringTools is a package meant to provide miscellaneous tools to work with strings. The first and currently only function is getDecimal, which converts alphanumeric strings to decimal integers. Future versions could include a greater variety of functions to handel different kinds of strings.

I used create_package to make the package repo, uploaded it to a github repo with use_git() and use_github(), directly edited the description file in Rstudio. I then instlled the package using install(), added a license via use_mit_license("Conor Morrison"). I made the getDecimal function using use_r(). I started a vignette using use_vignette("getDecimal)", "Convert Alphanumeric to Decimal") and then installed the vignette using install(build_vignettes=TRUE). To set up the testing document, I used use_test("getDecimal") to make the document, I wrote out the tests, and then used test() to run the tests - all of which were successful. I used use_code_of_conduct() to make the code of conduct.

## Installation
Run:

``` r
install.packages("clmorrison/StringTools")
```

## Example

You can convert a string, letting the algorithm detect the base as in the first example below, or you may specify the base as in the latter example:

``` r
library(StringTools)
## basic example code
getDecimal("10") #will detect binary
getDecimal("10",base=3) #will use trinary (base 3)
```

