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

# pattern is by finding a set of numbers in the start and capturing them
as.numeric(gsub("([0-9]+).*$", "\\1", years))

# an alternativewith a simpler Perl-like regular expression:
as.numeric(gsub("[^\\d]+", "", years, perl=TRUE))

# pattern is to just remove _years_old
as.numeric(gsub(" years old", "", years))

# split by space, get the element in first index
as.numeric(sapply(strsplit(years, " "), "[[", 1))

