> calclda <- function(variables,loadings)
  {
     # find the number of samples in the data set
     as.data.frame(variables)
     numsamples <- nrow(variables)
     # make a vector to store the discriminant function
     ld <- numeric(numsamples)
     # find the number of variables
     numvariables <- length(variables)
     # calculate the value of the discriminant function for each sample
     for (i in 1:numsamples)
     {
        valuei <- 0
        for (j in 1:numvariables)
        {
           valueij <- variables[i,j]
           loadingj <- loadings[j]
           valuei <- valuei + (valueij * loadingj)
        }
        ld[i] <- valuei
     }
     # standardise the discriminant function so that its mean value is 0:
     ld <- as.data.frame(scale(ld, center=TRUE, scale=FALSE))
     ld <- ld[[1]]
     return(ld)
  }
