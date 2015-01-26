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
# Answer: 22

# Summarizing at each factor 

# check two race tracks: find the means of the total time taken by cars to cross the track. 
# “b” is the vector of total time taken by different cars and “a” is the vector of track on which this time is taken. The first element of the vector “b” corresponds to the first element of vector “a” (and so on).
#> a <- c(1,1,1,1,2,2,2,2,2)
#> b <- c(10,12,15,12,NA,30,42,38,40)

#How do you find the mean time of each track using split function?

# Answer
# s <- split(b,a)
# lapply(s,mean)
