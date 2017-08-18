# Let's use the example data from the pasilla package
library( DESeq2 )
library( pasilla )
data( "pasillaGenes" )

# Create a DESeq2 data object from the pasilla data
dse <- DESeqSummarizedExperimentFromMatrix(
   counts(pasillaGenes), pData(pasillaGenes)[,c("condition","type")],
   ~ type + condition )

# Perform a standard DESeq2 analysis
dse <- DESeq(dse)

# The log2 fold changes are found here
beta <- results(dse)$log2FoldChange

# Just to make the following clearer, I should point out that the
# "results" accessor is just a short-cut for this access to the rowData:
all( beta == mcols(rowData(dse))$conditionuntreated, na.rm=TRUE )
# (returns TRUE)

# The log fold change estimates all come with standard error information
# which we find in the rowData (maybe we should copy this to the
# 'results', too)
betaSE <- mcols(rowData(dse))$SE_conditionuntreated

# Internally, the Wald test is implemented as a simple two-sided
# z test of beta/betaSE. Two demonstrate this, we to the test
# manually and compare
pvalDE <- 2 * pnorm( abs( beta ), sd = betaSE, lower.tail=FALSE )
all( abs( pvalDE - results(dse)$pvalue ) < 1e-15, na.rm=TRUE )
# (returns TRUE)

# This was the test for DE, of course, i.e., small pvalDE means that
# the gene's expression change (the true value of beta) is not zero

# What we want is the opposite, namely find gene, for which abs(beta)
# is smaller than some threshold, theta
theta <- .3

# So, we do our two one-sided tests. For a one-sided z test, we
# simply use tail probabilities from the normal distribution.

# First, the test of H0_A: true_beta > thr
pA <- pnorm( beta, thr, betaSE, lower.tail=TRUE )

# Next, the test of H0_B: true_beta < -thr
pB <- pnorm( beta, -thr, betaSE, lower.tail=FALSE )

# The overall p value is the maximum, because we want to reject H0_A
# and H0_B simultaneously
pvalTOST <- pmax( pA, pB )


# Let's adjust our two p values with BH:
sigDE <- p.adjust( pvalDE, "BH" ) < .1
sigSmall <- p.adjust( pvalTOST, "BH" ) < .1

# And make an MA plot, with sigDE in red and sigSmall in green
plot(
   rowMeans( counts(dse,normalized=TRUE) ), beta,
   log="x", pch=20, cex=.2,
   col = 1 + sigDE + 2*sigSmall )
# Plot is attached.
