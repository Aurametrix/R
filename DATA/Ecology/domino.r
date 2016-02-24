file_names <- list.files (path=”./R_in_ecology/night_files/“,pattern=“.csv”)  
# creates a list of the files so that we can read all of them in, and not have to copy and paste all the file names, or worry about updating that list manually as the files grow in number. These data are highly subsetted files from my dissertation, and I realize that latitude typically is accompanied by longitude, but this is all I’m using for this example.  

library(tidyr)  
library(dplyr) # gives us the gift of pipes “%>%”  
library(auriel) # my personal R package, used here for the ordinal_date_con() function  
nights <- list() # creates the list into which all of our files are going to be stored  
for(i in 1:length(file_names)){  
# first I have to pull the data I need out of the file name, as I store a bunch of information there.
  dat <- as.data.frame(file_names[i]) 
  colnames(dat) <- “name”
  names <- dat %>% separate(name, into=c(“year”,”month”,”day”,”obs”,”round”,”region”,”area”,”impound”,”treat”,”night”),sep=“_”)
  names <- names %>% separate(night, into=c(“night”,”file”), sep=-5)
 # now we read in the .csv and stitch together all of the data from above with this data   frame, as well as splitting things apart into multiple columns
  int <-  read.csv(paste0(“./R_in_ecology/night_files/“,file_names[i]))
  lesscol <-  int[,c(“lat”,“name”)]
  lesscol$name <- as.character(lesscol$name)
  lesscol$name <-  ifelse(nchar(lesscol$name)==7,paste0(lesscol$name, “N”),lesscol$name)
  lesscol <- lesscol %>% separate(name, into=c(“name”,“distance”),sep=5) %>%  separate(distance, into=c(“species”,“distance”), sep=1) %>% separate(distance, into=c
  (“distance”,“flush_walk”), sep=-2)
  lesscol$distance <- as.numeric(lesscol$distance)
  lesscol$species <- tolower(lesscol$species)
  lesscol$year <- as.numeric(names$year)
  lesscol$month <- as.numeric(names$month)
  lesscol$day <- as.numeric(names$day)
  lesscol$obs <- names$obs
  lesscol$round <- names$round
  lesscol$region <- names$region
  lesscol$area <- names$area
  lesscol$impound <- names$impound
  lesscol$treat <- names$treat
  lesscol$night <- names$night
  lesscol$odat <- ordinal_date_con(lesscol[,c(“month”,“day”,“year”)])
  nights[[i]] <- lesscol # throws it back into the list in the same place it came from; some will hate this.
  }
  masterdat <- do.call(rbind, nights) #: this binds together all of the items in the nights[[]] list. This script is great because it can grow with each file.
 # now we can write this out, or do whatever needs to be done with it. 
