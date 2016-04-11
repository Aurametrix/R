# download https://cran.r-project.org/web/packages/scatterplot3d
# or
# install.packages("scatterplot3d", repos="http://R-Forge.R-project.org")

# 3D Scatterplot
library(scatterplot3d)  # Load the package
attach(mtcars)
# scatterplot3d(wt,disp,mpg, main="3D Scatterplot")

with(mtcars, {
   s3d <- scatterplot3d(disp, wt, mpg,        # x y and z axis
                 color="blue", pch=19,        # filled blue circles
                 type="h",                    # vertical lines to the x-y plane
                 main="3-D Scatterplot Example 3",
                 xlab="Displacement (cu. in.)",
                 ylab="Weight (lb/1000)",
                 zlab="Miles/(US) Gallon")
    s3d.coords <- s3d$xyz.convert(disp, wt, mpg) # convert 3D coords to 2D projection
    text(s3d.coords$x, s3d.coords$y,             # x and y coordinates
         labels=row.names(mtcars),               # text to plot
         cex=.5, pos=4)           # shrink text 50% and place to right of points)
})
