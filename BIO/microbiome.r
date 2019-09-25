library(BiocInstaller)
source("http://www.bioconductor.org/biocLite.R")
useDevel()
biocLite("microbiome")

# Data from 
# http://www.nature.com/ncomms/2014/140708/ncomms5344/full/ncomms5344.html
data(atlas1006) 
atlas1006
## phyloseq-class experiment-level object
## otu_table()   OTU Table:         [ 130 taxa and 1172 samples ]
## sample_data() Sample Data:       [ 1172 samples by 10 sample variables ]
## tax_table()   Taxonomy Table:    [ 130 taxa by 2 taxonomic ranks ]

## https://github.com/microbiome/microbiome/
install.packages("remotes")
remotes::install_github("microbiome/microbiome")

# alpha diversity
library(microbiome)
library(knitr)
data(dietswap)
pseq <- dietswap
