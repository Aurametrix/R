#  Fisher’s Iris Data by Edgar Anderson available in package “datasets” 
# measurements in centimeters of the variables sepal length and width and 
# petal length and width, respectively, for 50 flowers from each of 3 species of iris.  
# The species are Iris setosa, versicolor, and virginica.

data(iris)
str(iris); summary(iris[1:4])
pairs(iris[1:4],main="Iris Data", pch=19, col=as.numeric(iris$Species)+1)
mtext("Type of iris species: red-> setosa; green-> versicolor; blue-> virginica", 1, line=3.7,cex=.8)


#To examine variability of all numeric variables
sapply(iris[1:4],var)
range(sapply(iris[1:4],var))
# maybe this range of variability is big in this context.
#Thus, we will use the correlation matrix
#For this, we must standardize our variables with scale() function:
iris.stand <- as.data.frame(scale(iris[,1:4]))
sapply(iris.stand,sd) #now, standard deviations are 1

#If we use prcomp() function, we indicate 'scale=TRUE' to use correlation matrix
pca <- prcomp(iris.stand,scale=T)
#it is just the same that: prcomp(iris[,1:4],scale=T) and prcomp(iris.stand)
#similar with princomp(): princomp(iris.stand, cor=T)
pca
summary(pca)
#This gives us the standard deviation of each component, and the proportion of variance explained by each component.
#The standard deviation is stored in (see 'str(pca)'):
pca$sdev


#plot of variance of each PCA.
#It will be useful to decide how many principal components should be retained.
screeplot(pca, type="lines",col=3)

#The loadings for the principal components are stored in:
pca$rotation # with princomp(): pca$loadings

#biplot of first two principal components
biplot(pca,cex=0.8)
abline(h = 0, v = 0, lty = 2, col = 8)


