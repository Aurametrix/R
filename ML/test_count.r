### Loading time-series data
# Read the two files into two data frames.
# Convert the dates from strings into Date objects.
# Convert the two data frames into two zoo objects.
# Take the intersection of the two zoo objects.  That will create one zoo object with the observations common to both datasets.

library(zoo)            # Load the zoo package

# Read the CSV files into data frames
#
gld <- read.csv("GLD.csv", stringsAsFactors=F)
gdx <- read.csv("GDX.csv", stringsAsFactors=F)

# The first column contains dates.  The as.Date
# function can convert strings into Date objects.
#
gld_dates <- as.Date(gld[,1])
gdx_dates <- as.Date(gdx[,1])

# The seventh column contains the adjusted close.
# We use the zoo function to create zoo objects from that data.
# The function takes two arguments: a vector of data and
# a vector of dates.
#
gld <- zoo(gld[,7], gld_dates)
gdx <- zoo(gdx[,7], gdx_dates)

# The merge function can combine two zoo objects,
# computing either their intersection (all=FALSE)
# or union (all=TRUE).
#
t.zoo <- merge(gld, gdx, all=FALSE)

# At this point, t.zoo is a zoo object with two columns: gld and gdx.
# Most statistical functions expect a data frame for input,
# so we create a data frame here.
#
t <- as.data.frame(t.zoo)

# Tell the user what dates are spanned by the data.
#
cat("Date range is", format(start(t.zoo)), "to", format(end(t.zoo)), "\n")

# as.Date function assumes your date strings are formatted like yyyy-mm-dd,
#If format is mm/dd/yy, include a format specification.
#gld_dates <- as.Date(gld[,1], format="%m/%d/%y")
#gdx_dates <- as.Date(gdx[,1], format="%m/%d/%y")

# Augmented Dickey-Fuller test
library(tseries)            # Load the tseries package

# Setting alternative="stationary" chooses the appropriate test.
# Setting k=0 forces a basic (not augmented) test.  See the
# documentation for its full meaning.
#
ht <- adf.test(sprd, alternative="stationary", k=0)
cat("ADF p-value is", ht$p-value, "\n")

# The ht object contains the p-value from the ADF test.
# The p-value is the probability that the spread is NOT
# mean-reverting.  Hence, a small p-value means it is very
# improbable that the spread is NOT mean-reverting
# (got that?).
#
if (ht$p.value < 0.05) {
    cat("The spread is likely mean-reverting.\n")
} else {
    cat("The spread is not mean-reverting.\n")
}

# to read data from websites
#gld <- read.csv("http://ichart.finance.yahoo.com/table.csv?s=GLD&ignore=.csv", stringsAsFactors=F)
#gdx <- read.csv("http://ichart.finance.yahoo.com/table.csv?s=GDX&ignore=.csv", stringsAsFactors=F)