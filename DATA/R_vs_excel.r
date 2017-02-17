read_and_check <- function(file){
  out <- read.csv(file)
  if(nrow(out) == 0) {
    stop("There's no data in this file!")
  } else {
    out
  }
}


# joining two tables
library(dplyr)
library(knitr)
cars <- mtcars
colours <- data_frame(
  cyl = unique(cars$cyl),
  colour = c("Blue", "Green", "Eggplant")
)

kable(cars[1:10, ]) #kable is just for displaying the table
