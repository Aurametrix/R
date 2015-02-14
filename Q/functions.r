## The with( ) function applys an expression to a dataset. It is similar to DATA= in SAS.
# with(data, expression)
# example applying a t-test to a data frame mydata 
with(mydata, t.test(y ~ group))

## The by( ) function applys a function to each level of a factor or factors. It is similar to BY processing in SAS.
# by(data, factorlist, function)
# example obtain variable means separately for
# each level of byvar in data frame mydata 
by(mydata, mydatat$byvar, function(x) mean(x))


## rbind function can be used to join two data frames (datasets) vertically. 
## The two data frames must have the same variables, but they do not have to be in the same order.
total <- rbind(data frameA, data frameB)

# merge two data frames by ID
total <- merge(data frameA,data frameB,by="ID")
# merge two data frames by ID and Country
total <- merge(data frameA,data frameB,by=c("ID","Country"))

## subset() functions help to select variables and observations 
## while through sample() function you can choose a random sample of size n from a dataset.

# using subset function 
newdata <- subset(mydata, age >= 20 | age < 10, 
select=c(ID, Weight))
# select all rows that have a value of age greater than or equal to 20 or age less then 10. 
# Keep the ID and Weight columns
