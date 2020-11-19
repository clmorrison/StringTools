#Note that, implicitly at least, the following functions also show that the conversion
#itself is correct, in addition to the other verifiation purposes these tests serve.


#This first set of tests check to see that the base detecting part of the function
#is working as expected
test_that("base detection works", {
  # Check Binary
  expect_equal(getDecimal("1010"),2+8)

  # Check Decimal
  expect_equal(getDecimal("614"),614)

  # Check Hex
  expect_equal(getDecimal("2aF"),687)

  # Check Alphanumeric
  expect_equal(getDecimal("s3"),28*36+3)

})
#now this checks to see that the base can be specified
test_that("setting different bases works", {
  # trinary
  expect_equal(getDecimal("100",3),3^2)

  # base 14
  expect_equal(getDecimal("100",14),14^2)
})

#this is checking to see whether the right errors are being raised by the function.
test_that("throws errors correctly",{
  #incorrect base
  (expect_that(getDecimal(123,base=2),throws_error()))
  #negative number
  (expect_that(getDecimal(-3),throws_error()))
  #invalid character
  (expect_that(getDecimal("$3"),throws_error()))
})

