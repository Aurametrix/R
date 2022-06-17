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

#### read xlsx workbook

library("openxlsx")

df1 <- read.xlsx(xlsxFile = "demo_data.xlsx", sheet = 1, skipEmptyRows = FALSE)
df1

# OR
require(readxl)
library(readxl)

data <- read_excel("file.xlsx")

#specify sheet by its name
data <- read_excel("my_file.xlsx", sheet = "sheetname")
# specify sheet by its index
data <- read_excel("my_file.xlsx", sheet = 2)

#OR 
library("xlsx")
data <- read.xlsx(file.choose(), 1)  # read first sheet
data <- read.xlsx(“file.xlsx”, 1)  # read first sheet
data <- read.xlsx(“file.xlsx”, sheetName=”Sheet1”)  # read the data contains in Sheet1

# with tidyverse
install.packages("tidyverse")
# NOTE: it is not a core tidyverse package loaded via library(tidyverse)
install.packages("readxl")
Or install the development version from GitHub:

# install.packages("devtools")
devtools::install_github("tidyverse/readxl")

read.xlsx(
   xlsxFile,
   sheet = 1,
   startRow = 1,
   colNames = TRUE,
   rowNames = FALSE,
   detectDates = FALSE,
   skipEmptyRows = TRUE,
   skipEmptyCols = TRUE,
   rows = NULL,
   cols = NULL,
   check.names = FALSE,
   sep.names = ".",
   namedRegion = NULL,
   na.strings = "NA",
   fillMergedCells = FALSE
)


# installing the required libraries 
library(readxl)
library(tidyverse)
  
# specifying the path for file
path <- "/Users/myself/Desktop/"
  
# set the working directory 
setwd(path)
  
# accessing all the sheets 
sheet = excel_sheets("file.xlsx")
  
# applying sheet names to dataframe names
data_frame = lapply(setNames(sheet, sheet), 
                    function(x) read_excel("file.xlsx", sheet=x))
  
# attaching all dataframes together
data_frame = bind_rows(data_frame, .id="Sheet")
  
# Rio package
install.packages("rio")
# importing the required library
library(rio)
  
path <- "/Users/myself/Desktop/file.xlsx"
# reading data from all sheets
data <- import_list(path , rbind=TRUE)
  
# print data
print (data)                  
                    
###


# concatenate
x1<-rpois(20,5)
y1<-rpois(20,5)
z1<-rpois(20,5)
a1<-rpois(20,5)
df1<-data.frame(x1,y1,z1,a1)
df1
