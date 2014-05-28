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