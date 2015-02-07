## Not run:
library(Matrix)
f <- function(v) as.numeric(A %*% v) # Convert Matrix object back to vector
tf <- function(v) as.numeric(tA %*% v) # Convert Matrix object back to vector
e <- new.env()
assign("A", USCounties, e)
assign("tA", t(USCounties), e)
environment(f) <- e
environment(tf) <- e
m <-extmat(f, tf, nrow(USCounties), ncol(USCounties))
system.time(v1 <- propack.svd(m, neig = 10))
# user system elapsed
# 0.252 0.007 0.259
system.time(v2 <- propack.svd(as.matrix(USCounties), neig = 10))
# user system elapsed
# 8.563 0.027 8.590
## End(Not run)
