# R has a native uicksort function sort() written in C

# example of quicksort by recurson
qs <- function(x) {
 if (length(x) <= 1) return(x)
 seed <- x[1]
 rest <- x[-1]
 sv1 <- rest[rest < seed]
 sv2 <- rest[rest >= seed]
 sv1 <- qs(sv1)
 sv2 <- qs(sv2)
 return(c(sv1,seed,sv2))
}
