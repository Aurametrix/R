# t.test () function produces a variety of t-tests
# T-test is the most common test in statistics and used to determine whether 
# the means of two groups are equal to each other.

# independent 2-group t-test
t.test(y~x) # where y is numeric and x is a binary factor
# independent 2-group t-test
t.test(y1,y2) # where y1 and y2 are numeric
# paired t-test
t.test(y1,y2,paired=TRUE) # where y1 & y2 are numeric
# one sample t-test
t.test(y,mu=3) # Ho: mu=3

# var.equal = TRUE option can be used to specify equal variances and a pooled variance estimate. 
# alternative="less" or alternative="greater" options specify a one tailed test.

# Use box plots or density plots to visualize group differences
