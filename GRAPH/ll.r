# a linked list in R can be represented as a vector, typically a list. 
# no need to write special code to reference the next and previous items, because of R's indexing

# To add a new item to the list, just keep track of its length and assign to the next in line.

lst <- list() # creates an empty (length zero) list
lst[[1]] <- 1 # automagically extends the lst
lst[[2]] <- 2 # extends the list 

# better to create the list in advance, and assign their contents as they become available.

lst <- list(1, 2, 3, 4, 5)    # a list of 5 items

lst <- vector("list", 10000)  # 10000 NULLs
lst[[1]] <- 1
lst[[10000]] <- 10000  # lst now contains 1, NULL, ..., NULL, 10000

# Deleting an item from the list can be accomplished with negative indexes.

lst <- list(1, 2, 3, 4, 5)
lst <- lst[-2]  # now contains 1, 3, 4, 5

# A tree is just a list containing other lists.

tree <- list(list(1, 2), list(3, list(4, 5)))

# left child: list(1, 2)
tree[[1]]

# right child
tree[[2]]

# right child of right child:list(4, 5)
tree[[2]][[2]]
