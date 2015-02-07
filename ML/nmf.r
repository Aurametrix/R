###  NMF package - Nonnegative Matrix Factorization
# Install
install.packages("NMF")
# Load
library(NMF)

# retrieve all the methods that have a secondary R version
meth <- nmfAlgorithm(version = "R")
meth <- c(names(meth), meth)
meth
## brunet lee
## "brunet" "lee" "offset" "nsNMF" ".R#brunet" ".R#lee"
## offset nsNMF
## ".R#offset" ".R#nsNMF"
# load the Golub data
data(esGolub)
# compute NMF for each method
res <- nmf(esGolub, 3, meth, seed = 123456)
## Compute NMF method 'brunet' [1/8] ... OK
## Compute NMF method 'lee' [2/8] ... OK
## Compute NMF method 'offset' [3/8] ... OK
## Compute NMF method 'nsNMF' [4/8] ... OK
## Compute NMF method '.R#brunet' [5/8] ... OK
## Compute NMF method '.R#lee' [6/8] ... OK
## Compute NMF method '.R#offset' [7/8] ... OK
## Compute NMF method '.R#nsNMF' [8/8] ... OK
# extract only the elapsed time
t <- sapply(res, runtime)[3, ]

## to cite
# plain text
citation("NMF")
# or to get the bibtex entries
toBibtex(citation("NMF"))
