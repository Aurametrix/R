# Very basic split-apply-combine functionality - aggregating by group


# Strings ain't factors
options(stringsAsFactors = FALSE)


library(plyr)
library(rbenchmark) # To see who is most fastest


# Load in some TB surveillance data
tb <- read.csv("tbdata.csv", na.string = "Suppressed")



################################################################################
################################################################################
# Sum by states
# base: lapply and sapply
# lapply applies a function to each element in a list
# That means it needs something it recognizes as a list first.  To convert the
# tb data.frame into a list, I use split():
base.lap <- lapply(X = split(x = tb$n, f = tb$state),
                   FUN = sum, na.rm = TRUE)

# sapply is a wrapper for lapply that simplifies lists to vectors/matrices/etc
base.sap <- sapply(X = split(x = tb$n, f = tb$state),
                   FUN = sum, na.rm = TRUE)

# What's it look like?
base.lap
base.sap

# What is it?
class(base.lap)
class(base.sap) # Named vector

# How to access individual elements
base.lap["Colorado"]
base.sap["Colorado"]


################################################################################

# base: by
base.by<- by(data = tb$n, 
             INDICES = tb$state, 
             FUN = sum, na.rm = TRUE
)


# What's it look like?
base.by

# ... what is that thing
class(base.by)  # Doesn't say so, but it's a list

# How to access individual elements
base.by["Colorado"]


################################################################################

# base: aggregate
# aggregate takes a formula, if that suits you - put the variable to be
# aggregated on the left, the grouping variables on the right
base.agg <- aggregate(formula = n ~ state, 
                      data = tb,
                      FUN = sum)

base.agg

class(base.agg)

# How to access individual elements - slight different, as aggregate() 
# returns a data.frame
base.agg$n[base.agg$state %in% "Colorado"]


################################################################################

# plyr
# First, a ddply - it takes in a data.frame, and gives a data.frame back
plyr.df <- ddply(.data = tb,
                 .var = "state",
                 .fun = summarise,
                 n = sum(n, na.rm = TRUE)
)

plyr.df

class(plyr.df)

plyr.df$n[plyr.df$state %in% "Colorado"]


################################################################################

# Here's a dlply, which returns a list.  Part of the beauty of plyr is that you
# can easily change the output class just by tweaking which function you use
plyr.list <- dlply(.data = tb,
                .var = "state",
                .fun = summarise,
                n = sum(n, na.rm = TRUE)
)

# Back to list-style element access
plyr.list["Colorado"]


################################################################################

# plyr has also accumulated some specialized functions over the years - if
# you're having a performance problem, it's worth checking for optimized
# functions like count(), join(), and vaggregate()
vaggregate(.value = tb$n, .group = tb$state, .fun = sum, na.rm = TRUE)
plyr.df$n


# Those are all the same... right?
base.lap["Colorado"]
base.sap["Colorado"]
base.by["Colorado"]
base.agg$n[base.agg$state %in% "Colorado"]
plyr.df$n[plyr.df$state %in% "Colorado"]
plyr.list["Colorado"]



# Time it
benchmark(base.lap = lapply(X = split(x = tb$n, f = tb$state), 
                            FUN = sum, na.rm = TRUE),
          base.sap = sapply(X = split(x = tb$n, tb$state), 
                            FUN = sum, na.rm = TRUE),

          base.by = by(data = tb$n, 
                       INDICES = tb$state, 
                       FUN = sum, na.rm = TRUE),
          base.agg = aggregate(formula = n ~ state, 
                               data = tb, 
                               FUN = sum), 

          plyr.df = ddply(.data = tb, 
                          .var = "state", 
                          .fun = summarise, n = sum(n, na.rm = TRUE)),
          plyr.list = dlply(.data = tb, 
                            .var = "state", 
                            .fun = summarise, n = sum(n, na.rm = TRUE)),

          vagg = vaggregate(.value = tb$n, 
                            .group = tb$state, 
                            .fun = sum, na.rm = TRUE),

          columns = c("test", "replications", "elapsed", "relative"),
          order = NULL
)


rm(list = ls())
