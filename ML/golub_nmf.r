data(esGolub)
esGolub
## ExpressionSet (storageMode: lockedEnvironment)
## assayData: 5000 features, 38 samples
## element names: exprs
## protocolData: none
## phenoData
## sampleNames: ALL_19769_B-cell ALL_23953_B-cell ... AML_7 (38
## total)
## varLabels: Sample ALL.AML Cell
## varMetadata: labelDescription
## featureData
## featureNames: M12759_at U46006_s_at ... D86976_at (5000 total)
## fvarLabels: Description
## fvarMetadata: labelDescription
## experimentData: use 'experimentData(object)'
## Annotation:
esGolub <- esGolub[1:200, ]
# remove the uneeded variable 'Sample' from the phenotypic data
esGolub$Sample <- NULL


## to run
# default NMF algorithm
res <- nmf(esGolub, 3)

##The result of a single NMF run is an object of class NMFfit, that holds both the fitted NMF model
##and data about the run:
res
## <Object of class: NMFfit>
## # Model:
## <Object of class:NMFstd>
## features: 200
## basis/rank: 3
## samples: 38
## # Details:
## algorithm: brunet
## seed: random
## RNG: 403L, 1L, ..., -1742836212L [1f1f4f8e4a81225c8ddcc7f5ab1945f1]
## distance metric: 'KL'
## residuals: 543535
## Iterations: 510
## Timing:
## user system elapsed
## 0.245 0.000 0.245
The fitted model can be retrieved via method fit, which returns an object of class NMF:
fit(res)
## <Object of class:NMFstd>
## features: 200
## basis/rank: 3
## samples: 38

V.hat <- fitted(res)
dim(V.hat)
## [1] 200 38
