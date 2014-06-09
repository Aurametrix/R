# using subset function 

# example 1
# select all rows that have a value of age greater than or equal to 20 
# or age less then 10. Keep the ID and Weight columns.

newdata <- subset(mydata, age >= 20 | age < 10, 
select=c(ID, Weight))

# example 2
# select all men over the age of 25 
# keep variables weight through income  - all columns between them

newdata <- subset(mydata, sex=="m" & age > 25,
select=weight:income)
Random Samples

# Use the sample( ) function to take a random sample of size n from a dataset.

# take a random sample of size 50 from a dataset mydata 
# sample without replacement

mysample <- mydata[sample(1:nrow(mydata), 50,
  	 replace=FALSE),]

