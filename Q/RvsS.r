a <- c(2,3,4) 
b <- c(1,2)

#What is the value of the vector d, which is defined as follows:
d <- a*b

# Answer : 2 , 6 , 4
# R language does vectorized operations. ‘a’ and ‘b’ are two vectors with different length. 
# By process, R multiplies the first element of a with 1st element of b, than second element of a with that of b, and so on. 
# But in this case, after the second multiplication R hits the end of vector “b”. 
# In such cases R, starts with the first element of smaller vector till each element of 
# longer vector is exhausted. The vectorized operation always leads to a vector of length 
# equal to that of longer vector.

y <- 3
f <- function(x) {
                            y <- 2
                            y ^ 2 + g(x)
                            }
g <- function(x) {
                             x * y
                             }

# What is the value of f(6)?
