# Simulating fake data

x_1 <- rnorm(1000,5,7) # from a normal distribution simulate 
                       # 1000 values with a mean of 5 and
                       # standard deviation of 7
hist(x_1, col="grey")  # plot p(x)
true_error <- rnorm(1000,0,2)
true_beta_0 <- 1.1
true_beta_1 <- -0.2
y <- true_beta+0 +true_beta_1*x+1 + true_error
hist(y)                # plot p(x,y)
plot(x_1,y,pch=20,col="red")  # plot p(x,y)
