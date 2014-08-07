#
# PCA is a dimensionality reduction method in which a covariance analysis between factors takes place
# It remaps data into a new coordinate system based on variance within the data
# It transforms possibly correlated variables into a smaller number of uncorrelated variables
# usage: princomp(..); predict(object, newdata, ...)
#
#

# visualization
require(graphics)
 
summary(pc.cr <- princomp(USArrests, cor = TRUE))
loadings(pc.cr)
plot(pc.cr)
biplot(pc.cr)

# sample data can be downloaded from letor site
data=read.table("sample.data",sep=",")
summary(pc.cr <- princomp(data[,2:46]))
loadings(pc.cr)

library(lattice)
pc.cr$scores
pca.plot <- xyplot(pc.cr$scores[,2] ~ pc.cr$scores[,1])
pca.plot$xlab <- "First Component"
pca.plot$ylab <- "Second Component"
pca.plot
