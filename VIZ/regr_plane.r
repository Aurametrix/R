install.packages("scatterplot3d") # Install
library("scatterplot3d") # load

data(iris)
head(iris)

# 3D scatter plot
s3d <- scatterplot3d(trees, type = "h", color = "blue",
    angle=55, pch = 16)
# Add regression plane
my.lm <- lm(trees$Volume ~ trees$Girth + trees$Height)
s3d$plane3d(my.lm)
# Add supplementary points
s3d$points3d(seq(10, 20, 2), seq(85, 60, -5), seq(60, 10, -10),
    col = "red", type = "h", pch = 8)
