library(psych)
myData <- read.clipboard.tab()
describe(myData)
headTail(myData)
# if <10 vars, SPLOM (Scatter Plot Matrix) using pairs.panels 
# outlier to detect outliers.
pairs.panels(myData)
outlier(myData)
cleaned <- scrub(myData, max=9) #e.g., change anything great than 9 to NA
# graph the data with error bars
error.bars(myData)
# Find the correlations in all the data.
### Descriptively (just the values) 
r <- lowerCor(myData)
### Graphically 
corPlot(r)
### Inferentially (the values, the ns, and the p values) 
corr.test(myData)
r <- lowerCor(myData)

corr.test(myData)
# parallel analysis
fa.parallel(myData)
vss(myData)

