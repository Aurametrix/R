# exclude variables v1, v2, v3
myvars <- names(mydata) %in% c("v1", "v2", "v3") 
newdata <- mydata[!myvars]

# exclude 3rd and 5th variable 
newdata <- mydata[c(-3,-5)]

# delete variables v3 and v5
mydata$v3 <- mydata$v5 <- NULL
