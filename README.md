R
=
named partly after the first names of the first two R authors and partly as a play on the 
name of S, used for statistical computing and graphics

a dialect of the S language, developed by John Chambers at Bell LAbs as an internal 
statistical analysis environment, originally as Fortran Libraries, later rewritten in C
S-plus - GUI

comprehensive set of packages for data access, cleaning, analysis, reporting
 - CRAN (about 5200 packages), Bioconductor Project

available.packages() function shows what's available on CRAN

q <- qvailable.packages()  # or use R studio interface

head(rownames(a), 3)

install.packages("slidify")  #package name as argument, in the R console

find.package("devtools")

install.packages("slidify", "ggplot2", "devtools") 


source("http://bioconductor.org/biocLite.R")

biocLite()

biocLite(c("GenomicFeatures", "AnnotationDbi"))

http://www.bioconductor.org/install/

The library() function is used to load packagesi nto R
library(ggplot2)  # do not use quotes

-- R tools (under Windows)
http://cran.r-project.org/bin/windows/Rtools/

find_rtools()  # should return true

library(devtools)


### ML cheatsheet

How heterogeneous is your problem?

Some algorithms which can readily model discontinuous or highly heterogeneous data

-Decision Trees
-Regression Trees
-Nearest Neighbour algorithms 

Some algorithms which cannot (using these algorithms it might be advisable to build multiple models from different groups of data)

-Generalized Linear Models including all fancy derivations of Least Squares Regression:
-Logistic Regression
-Power Regression
-Least Absolute Deviations
-Lasso
-Ridge Regression
-Elastic Net
-Reduced Major Axis Regression

Is a probabilistic approach suitable?

Some algorithms which embody probabilistic assumptions

-Naïve Bayes
-Generalized Linear Models (see above)
-Most Neural Networks (yes, including the "Deep" the variety)

Some distinctly non-probabilistic algorithms

-Support Vector Machines
-Decision Trees
-Various Nearest Neighbour algorithms

Does your data contain high-order variable interactions?

Some algorithms which can natively discover high-order variable interactions

-"Deep" Neural Networks
-Many "Kernelized" algorithms

Some algorithms which are strongly limited by independence assumptions

-Naïve Bayes
-Most Generalized Linear Models

### Biomedical

+ [microbiome package](http://microbiome.github.io/microbiome/)
+ [16S RNA analysis]([https://github.com/microsud/Tools-Microbiome-Analysis])
+ [microbiome tutorials](https://microbiome.github.io/tutorials/)
+ [COVID-19 symptom progression](https://github.com/j-larsen/Stochastic_Progression_of_COVID-19_Symptoms) -- [paper](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7438535/)
+ [Omicron neutralising antibodies after COVID-19 vaccination](https://github.com/EdjCarr/Crick-HD-Omicron-2021-12)
+ [Interrupted time series](https://github.com/kingqwert/R/blob/master/ARIMAITS_DS/fuzzyARIMAITS.R) applied to COVID-19 pandemic analysis [paper](https://bmcmedresmethodol.biomedcentral.com/articles/10.1186/s12874-022-01662-1)
+ [PBPK model for fluvoxamine](https://github.com/Open-Systems-Pharmacology/OSP-PBPK-Model-Library/tree/master/Fluvoxamine)

## Data Science
+ [tidyverse](https://www.tidyverse.org/)
     + [Tidyverse tips and tricks](https://oliviergimenez.github.io/tidyverse-tips/)
     + [Tidy Tuesday: Analyzing crossword puzzles](https://www.youtube.com/watch?v=T11WKngDEGQ)
+ [R for data science](http://r4ds.had.co.nz/)
+ [Texnets](https://github.com/cbail/textnets) - R package to perform automated text analysis using network techniques
+ [wiseR](https://github.com/SAFE-ICU/wiseR) - learning and extending Bayesian networks into Decision Networks
+ [Data Science in R and Python](https://www.anotherbookondatascience.com/)
+ [Development and Data Science Platform](https://github.com/WLOGSolutions/RSuite)
+ [Intro to Data Science](https://rafalab.dfci.harvard.edu/dsbook-part-1/)

## Other

+ [Mathic](https://mathics.github.io/) - alternative to Mathematica
+ [Maxima](http://maxima.sourceforge.net/)
+ [wrappers for production](https://www.rplumber.io/)
+ [music](https://flujoo.github.io/en/generate-accompaniment-progression/)
+ [ggplot book](https://ggplot2-book.org/)
+ [Utility theory](https://lindeloev.github.io/utility-theory/): [code](https://github.com/lindeloev/utility-theory)
+ [PT](https://mran.microsoft.com/snapshot/2014-09-08_1746/web/packages/pt/vignettes/pt_vignette.pdf) - an R package for prospect theory
+ [Array Languages](https://jcarroll.com.au/2023/07/07/array-languages-r-vs-apl/) - R vs APL
+ [Formatted Spreadsheets can still work in R](https://luisdva.github.io/rstats/problematic-spreadsheets/)

+ [Tiny grammar of graphics](https://observablehq.com/@joshpoll/vvt-gog); see also [Wickham's paper](https://byrneslab.net/classes/biol607/readings/wickham_layered-grammar.pdf)
+ [Using R in Python]([http://www.webarray.org/softwares/PypeR](https://sourceforge.net/projects/rinpy/) - 
+ [Convert between R and Python](https://www.rdocumentation.org/packages/reticulate/versions/1.24/topics/r-py-conversion)
+ [R equivalent of Pandas operations](https://towardsdatascience.com/r-equivalent-of-7-common-pandas-operations-76b632fc801b)

+ [Radian](https://github.com/randy3k/radian), an R console
+ [Shiny](https://shiny.rstudio.com/) - webapps
+ [R 4.0](https://stat.ethz.ch/pipermail/r-announce/2020/000653.html)
+ 
