 library(rpud) 
ds <- rpudlCreateDataSource( 
      data.format="cifar10", 
      data.dir="data/cifar" 
 )
 
 rpudl.path <- file.path(path.package(package="rpud"), "rpudl") 
 model <- rpudl( 
       file.path(rpudl.path, "cifar10_quick_train.prototxt"), 
       data.source=ds 
 )
 
  system.time(model <- rpudlTrain( 
       model, batch=100, iter=4000)) 
       
# resume with smaller learning rate 

  system.time(model <- rpudlTrain( 
       model, batch=100, iter=1000, learning.rate=0.0001) 
       ) 
       
# extract 12 samples from the testing data, and run prediction against the trained model (for demo only)

 num <- 12 
 obj <- rpudlGetTestingDataSamples(ds, c(1, num)) 
 res <- predict(model, obj$x) 
 sum((obj$y) == res) 
 
 library(ggplot2) 
 costs <- model$cost.log 
 qplot(1:length(costs), costs, geom="smooth")
 
 
 weights <- rpudlGetLayerWeights(model, "conv1") 
 rpudlPlotLayerWeights(weights)
 
 message Datum { 
    required bytes data = 1; 
    required uint32 label = 2; 
}
