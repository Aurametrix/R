\name{metabnet}
\alias{metabnet}
\title{metabnet}
\description{
Function for correlation (complete or partial) based metabolome-wide network analysis. 
Additionally, users have the option to provide a matrix of m/z features corresponding to 
chemicals of interest such as (phenylalanine, choline, etc) and/or a matrix of m/z
features corresponding to discriminatory metabolites. 
}
\usage{
metabnet(feature_table_file,target.metab.file,sig.metab.file,
class_labels_file=NA,
parentoutput_dir,
num_replicates=1,cor.method="pearson",abs.cor.thresh=0.4,
cor.fdrthresh=0.05,cor.fdrmethod="BH",target.mzmatch.diff=10,
target.rtmatch.diff=NA,
max.cor.num=200,summarize.replicates=TRUE,
summary.method="median",all.missing.thresh=0.8,
group.missing.thresh=NA,
log2transform=TRUE,medcenter=TRUE,znormtransform=FALSE,
quantile_norm=TRUE,lowess_norm=FALSE,madscaling=FALSE,
missing.val=0, networktype="complete", samplermindex=NA,
rep.max.missing.thresh=0.3,summary.na.replacement="zeros",
 net_node_colors = c("pink", "skyblue"),
 net_node_shapes = c("rectangle", "circle"),
 net_edge_colors, net_legend = FALSE, netrandseed =
 555, num_nodes = 2)
}
\arguments{
 \item{feature_table_file}{
Feature table that includes the mz, retention time, and measured intensity in 
each sample for each analyte. The first 2 columns should be the mz and time. 
The remaining columns should correspond to the samples in the class labels
file with each column including the intensity profile of a sample.
Full path required. Eg: C:/My Documents/test.txt
The feature table should be in a tab-delimited format. An example of the
input file is provided under the "example" folder.
}
 \item{target.metab.file}{
File that includes the mz and/or retention time of the targeted metabolites 
corresponding to pathways or chemicals of interest. The first column should be
the mz of the features corresponding to targeted chemicals. Retention time
information could be provided in the second column to search by both m/z and time.
See example.
}
  \item{sig.metab.file}{
File that includes the mz and/or retention time of the discriminatory metabolites.
See example.
}
 \item{class_labels_file}{
File with class labels information for each sample. Samples should be in the same order
as in the feature table. Please use the same format as in the example folder.
}
  \item{parentoutput_dir}{
Provide full path of the folder where you want the results to be written.
Eg: C:/My Documents/ProjectA/results/
}
  \item{num_replicates}{
Number of technical replicates
}
\item{cor.method}{
Correlation method. Options: "pearson", "spearman", "cor.shrink". 
Default: "pearson". Please corpcor package for more details on the 
cor.shrink function.
}
  \item{abs.cor.thresh}{
Absolute Pearson correlation coefficient for network analysis. Eg: 0.5
}
  \item{cor.fdrthresh}{
False discovery rate threshold for correlation analysis. Eg: 0.05
}
\item{cor.fdrmethod}{
False discovery rate method. Options: "BH" for Benjamini-Hochberg(1995), 
"ST" for Storey-Tibshirani (2002,2003), "none" to use raw p-values.
Default: "BH".
}
   \item{target.mzmatch.diff}{
+/- ppm mass tolerance for searching the target m/z in the current
	  feature table. Default: 10
}
  \item{target.rtmatch.diff}{
+/- retention time tolerance for searching the target m/z in the current
	  feature table. Default: NA
}
  \item{max.cor.num}{
Maximum number of correlated metabolites to be included in the network
figure. Default: 200
}
  \item{summarize.replicates}{
Do the technical replicates per sample need to be averaged or median summarized? 
}
 \item{summary.method}{
Method for summarizing the replicates. Options: "mean" or "median"
}
\item{summary.na.replacement}{
How should the missing values be represented? 
Options: "zeros", "halfsamplemin","halfdatamin", "none", "bpca"
"zeros": replaces missing values by 0
"halfsamplemin": replaces missing value by one-half of the lowest signal intensity in the
corresponding sample
"halfdatamin": replaces missing value by one-half of the lowest signal intensity in the
complete dataset
"bpca": uses the bayesian PCA imputation implemented in the pcaMethods package
"none": keeps missing values as NAs
Users are recommended to perform imputation prior to partial correlation analysis.
}
  \item{all.missing.thresh}{
What propotion of total number of samples should have an intensity?
Default: 0.8
}
  \item{group.missing.thresh}{
What propotion of samples in either of the two groups should have an intensity?
If at least x% of the samples in either group have a signal, then the feature is retained
for further analysis. Default: NA
}
  \item{log2transform}{
Data transformation: Please refer to http://www.biomedcentral.com/1471-2164/7/142
Try different combinations; such as log2transform=TRUE, znormtransfrom=FALSE
or log2transform=FALSE, znormtransfrom=TRUE
}
  \item{medcenter}{
Median centering of metabolites
}
  \item{znormtransform}{
Auto scaling; each metabolite will have a mean of 0 and unit variance
}
  \item{quantile_norm}{
Performs quantile normalization. Normalization options: Please set only one of the options to be TRUE
}
  \item{lowess_norm}{
Performs lowess normalization. Normalization options: Please set only one of the options to be TRUE
}
  \item{madscaling}{
Performs median adjusted scale normalization. Normalization options: Please set only one of the options to be TRUE
}
\item{missing.val}{
How are the missing values represented in the input data? Options: "0" or "NA"
}
 \item{networktype}{
Options: "complete" or "GGM"
"complete": performs network analysis using ordinary Pearson or Spearman correlation
statistic
"GGM": generates network based on partial correlation analysis using the 
GeneNet package
}
\item{samplermindex}{
Column index of any additional or irrelevant columns to be deleted.
Options: "NA" or list of column numbers. eg: c(1,3,4) Default=NA
}
 \item{rep.max.missing.thresh}{
What propotion of replicates are allowed to have missing values during the averaging or 
median summarization step of each biological sample? If the number of replicates with
missing values is greater than the defined threshold, then the summarized value is 
represented by the "missing.val" parameter. If the number of replicates with missing values
is less than or equal to the defined threshold, then the summarized value is equal to the 
mean or the median of the non-missing values. Default: 0.3
}
\item{net_node_colors}{
 Colors of nodes in the correlation networks. Eg: c("pink", "skyblue"), 
or ("red","green"), or ("green", "yellow")
}  
 \item{net_node_shapes}{
 Shape of nodes in the correlation networks. Eg: c("rectangle", "circle") 
}
 \item{net_edge_colors}{
 Shape of nodes in the correlation networks. Eg: c("red", "blue")
}
\item{net_legend}{
Should the network be displayed for the correlation network? eg:
TRUE or FALSE
}
\item{netrandseed}{
Random number generation eg: 555
}
\item{num_nodes}{
Number of nodes to use for parallel processing eg: 2
}
}
\details{
Function for metabolic network analysis
}
\value{
Return value: correlation matrix of metabolites
Output:
a)	Rda files for correlations
b)	Stage 1 folder: Pre-processing results
c)	Stage 2 folder: 
a.	correlation_matrix.txt -> pairwise correlations of all m/z features
b.	correlation_pvalues.txt -> p-values for all pairwise correlations
c.	correlation_FDR.txt -> FDR adjusted p-values
d.	significant_correlations_targeted_matrix_mzlabels.txt -> significant correlations 
with targeted features. The targeted features are represented in rows.
Each feature is labeled as the combination of “mz_RetentionTime”.
e.	significant_correlations_targeted_matrix_rowcolnumlabels.txt
-> significant
correlations with targeted features. The targeted features are represented in
rows (X) and all other features are presented in columns (Y). Each feature
is labeled by the row or column number.
f.	targetednetwork_plot.pdf - > PDF with network plots
(row/column labels and mz_RT labels)
}
\references{
Stacklies W, Redestig H, Scholz M, Walther D and Selbig J (2007). 
"pcaMethods – a Bioconductor package providing PCA methods for 
incomplete data.” Bioinformatics, 23, pp. 1164–1167.
Benjamini, Yoav; Hochberg, Yosef (1995). "Controlling the false discovery rate: 
a practical and powerful approach to multiple testing". Journal of the Royal 
Statistical Society, Series B 57 (1): 289–300.
Storey JD. (2002) A direct approach to false discovery rates. Journal of the Royal Statistical Society,
Series B, 64: 479-498.
Storey JD and Tibshirani R. (2003) Statistical significance for genome-wide experiments. Proceedings
of the National Academy of Sciences, 100: 9440-9445. 
J. Schäfer and K. Strimmer. (2005). An empirical Bayes approach to inferring large-scale
gene association networks. Bioinformatics 21: 754-764.
Opgen-Rhein, R., and K. Strimmer. (2007). From correlation to causation networks: a 
simple approximate learning algorithm and its application to high-dimensional plant 
gene expression data. BMC Syst. Biol. 1: 37
}
\author{Karan Uppal <kuppal2@emory.edu>}
