library(MASS)

gaussprocess <- function(from = 0, to = 1, K = function(s, t) {min(s, t)},
                         start = 0, m = 1000) {
  # Simulates a Gaussian process with a given kernel
  #
  # args:
  #   from: numeric for the starting location of the sequence
  #   to: numeric for the ending location of the sequence
  #   K: a function that corresponds to the kernel (covariance function) of
  #      the process; must give numeric outputs, and if this won't produce a
  #      positive semi-definite matrix, it could fail; default is a Wiener
  #      process
  #   start: numeric for the starting position of the process
  #   m: positive integer for the number of points in the process to simulate
  #
  # return:
  #   A data.frame with variables "t" for the time index and "xt" for the value
  #   of the process
  
  t <- seq(from = from, to = to, length.out = m)
  Sigma <- sapply(t, function(s1) {
    sapply(t, function(s2) {
      K(s1, s2)
    })
  })
  
  path <- mvrnorm(mu = rep(0, times = m), Sigma = Sigma)
  path <- path - path[1] + start  # Must always start at "start"
  
  return(data.frame("t" = t, "xt" = path))
}
