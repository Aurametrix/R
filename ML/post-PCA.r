nPoints = 100
labels = c(rep(0, times = 0.6*nPoints), rep(1, times = 0.4*nPoints))
mus = list(mu1 = c(0, 0, 1, 3, 1), mu2 = c(1, 0, 0, 0, -2))
library(MASS)
x = t(sapply(1:nPoints, function(i) MASS::mvrnorm(1, mu = mus[[labels[i] + 1]],
Sigma = diag(1, nrow = 5, ncol = 5)))) train.set = sample.int(n = length(labels), size = 80, replace = FALSE)
x.train = x[train.set,] x.train.labels = labels[train.set] x.test = x[-train.set,] test.labels = labels[-train.set] dim(x.train)
x.train.pca = prcomp(x.train)
 x.train.logistic = glm(x.train.labels ~ pc1 + pc2,  data = data.frame(pc1 = x.train.pca$x[,1], pc2 = x.train.pca$x[,2]),  family = "binomial")
x.test.predict = predict(x.train.logistic, newdata = data.frame(pc1 = x.test.proj[ ,1], pc2 = x.test.proj[ ,2]), type = "response")
pander::pander(table(data.frame(trueLabels = test.labels,
estimatedLabel = sapply(x.test.predict, function(p) if(p > 0.5) 1 else 0))))
