library(stringr)
# extract a number from a string
str_locate("aaa12xxx", "[0-9]+")
#      start end
# [1,]     4   5
str_extract("aaa12xxx", "[0-9]+")
# [1] "12"

# Hadley Wickham's stringr package wraps all the existing regular expression operations
# can also use strapply in the gsubfn package
# or gsub("[^0-9]", "", "aaa12xxxx")
