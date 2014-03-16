# sort(x)       - sort the vector x
# order(x)      - list sorted element numbers of x

#By default, sorting is ASCENDING. 
#Prepend the sorting variable by a minus sign to indicate DESCENDING order.

# sorting examples using the mtcars dataset
attach(mtcars)

# sort by mpg
newdata <- mtcars[order(mpg),] 

# sort by mpg and cyl
newdata <- mtcars[order(mpg, cyl),]

#sort by mpg (ascending) and cyl (descending)
newdata <- mtcars[order(mpg, -cyl),] 

detach(mtcars)

# In stack.default(setNames(L, seq_along(L))) :
#   non-vector elements will be ignored
