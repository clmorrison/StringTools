#' Decimal Format of Alphanumeric String
#'
#' This function takes an alphanumeric string - a string with only letters or numbers - and returns
#' the base ten representation of the string when treated as an integer. The base argument attempts
#' to detect binary, decimal, hex, or full alphanumeric base depending on the input. Alternatively,
#' the base argument can be specified.
#'
#' @param string The string to be converted
#' @param base (optional) The base of the input
#' @return The conversion from base \code{base} to base 10 of \code{string}
#' @export
#' @examples
#' getDecimal("10101")
#' getDecimal("1ffa5")
#' getDecimal("1ffa5",36)
getDecimal = function(string,base=NULL) {
  #remove whitespace
  string=tolower(gsub(" ","",as.character(string)))
  # get the digits and letters
  symbs=c(0:9,letters)
  # break the string into a vector
  s=strsplit(string,split="")[[1]]
  # get the string length
  n=length(s)
  # check ever character in the string
  for(i in 1:n) {
    # if the character is not a digit or letter raise error
    if(!(s[i] %in% symbs)) {
      stop("INVALID STRING")
    }
    if(!is.null(base)) {
      if(base<=(match(s[i],symbs)-1)) {
        stop('INVALID BASE')
      }
    }
  }
  # set the default base if none is provided
  if(is.null(base)) {
    if(all(s %in% symbs[1:2])) {
      # every digit in 0 to 1
      base=2
      message("Base detected = 2")
    }
    else if(all(s %in% symbs[1:10])) {
      # every digit in 0 to 9
      base=10
      message("Base detected = 10")
    }
    else if(all(s %in% symbs[1:16])) {
      # every digit in 0 to f
      base=16
      message("Base detected = 16")
    }
    else {
      # every digit in 0 to z
      base=36
      message("Base detected = 36")
    }
  }
  else {
    # we are only working with alphanumeric strings so raise error for anything else
    if(!(base %in% 2:36)) {
      stop("INVALID BASE")
    }
  }
  # get the values of the characters
  s=match(s,symbs)-1

  # start an accumulator for the result
  res=0
  for(i in 1:n) {
    # we add the decimal value of each character given the base and position in the string
    res=res+s[n+1-i]*base^(i-1)
  }

  return(res)

}
