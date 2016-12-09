# Perform PCA on samples
pcr = prcomp(t(tissue_example$exp))

# Create gosummaries object
gs_pca = gosummaries(pcr, annotation = tissue_example$annot)

# Plot
plot(gs_pca, classes = "Tissue")

library(GOsummaries)

data(tissue_example)

# Filter genes and perform k-means
sd = apply(tissue_example$exp, 1, sd)
exp2 = tissue_example$exp[sd > 0.75,]
exp2 = exp2 - apply(exp2, 1, mean)
kmr = kmeans(exp2, centers = 6, iter.max = 100)

# Create gosummaries object
gs_kmeans = gosummaries(kmr, exp = exp2, annotation = tissue_example$annot)
plot(gs_kmeans, components = 1:2)
