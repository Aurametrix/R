# first 5 observerations
newdata <- mydata[1:5,]

# based on variable values
newdata <- mydata[ which(mydata$gender=='F' 
& mydata$age > 65), ]

# or
attach(newdata)
newdata <- mydata[ which(gender=='F' & age > 65),]
detach(newdata)
