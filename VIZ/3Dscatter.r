# download https://cran.r-project.org/web/packages/scatterplot3d
# or
# install.packages("scatterplot3d", repos="http://R-Forge.R-project.org")

# test
# 3D Scatterplot
library(scatterplot3d)  # Load the package
attach(mtcars)
scatterplot3d(wt,disp,mpg, main="3D Scatterplot")
