## Load necessary libraries
library(tidyr)
library(XML)
library(rvest)
library(plyr)
library(dplyr)
library(httr)
library(zoo)
library(gdata)
library(qpcR)
library(data.table)
library(stringr)
library(foreach)
library(curl)

setwd("D:\\Dropbox\\My Projects\\Elections\\Geogia 2016 Parliamentary\\github\\geoelections2016")

## Scrape precinct-level Proportional results
## Get URLs for each majoritarian district
mURL<-"http://results.cec.gov.ge/proporciuli.html" # Assign master page url
url <- html_session(mURL) # Get master page
urls <- url %>% # feed `main.page` to the next step
  html_nodes("a") %>% # get the CSS nodes
  html_attr("href") # extract the URLs
dfURL <- data.frame(urls = urls, stringsAsFactors = FALSE)

## Subset those districts which have data
dfURL<-as.data.frame(dfURL[grep("*olq*", dfURL$urls), ])
names(dfURL)<-c("urls")

## Loop thourgh URLs and get data tables for each majoritarian district
## Create an empty data frame for pasting precinct level results
PropData <- as.data.frame(setNames(replicate(27,numeric(0), simplify = F), letters[1:27]))


for(i in 1:nrow(dfURL)) {
  propRaw <- GET(paste0("http://results.cec.gov.ge/", (dfURL$urls[i]), sep=""), user_agent("Mozilla/5.0 (Windows NT 6.1; WOW64; rv:42.0) Gecko/20100101 Firefox/42.0")) %>% 
  read_html() %>%    
  html_nodes(xpath='//*[(@id = "table36")]')%>%
  html_table(fill=TRUE, header=TRUE)
propRaw<-as.data.frame(propRaw)
PropData<-na.omit(rbind(PropData, propRaw))
}

names(PropData)<-c("PrecinctID", "Party_1", "Party_2", "Party_3", "Party_4", "Party_5", "Party_6", "Party_7", "Party_8", "Party_10", "Party_11", "Party_12", "Party_14", "Party_15", "Party_16", "Party_17", "Party_18", "Party_19", "Party_22", "Party_23", "Party_25", "Party_26", "Party_27", "Party_28", "Party_30", "Party_41", "Protocol")

## Construct proper IDs for precincts
PropData<-PropData %>% separate(PrecinctID, c("MID", "DID", "PID"), sep = "\\.", remove=FALSE)

PropData$MID<-as.numeric(PropData$MID)
PropData$DID<-as.numeric(PropData$DID)
PropData$PID<-as.numeric(PropData$PID)
PropData$Precid<-PropData$MID*100000+PropData$DID*1000+PropData$PID
PropData<-PropData[,]
names(PropData)<-c("PrecinctID", "MID", "DID", "PID", "Party_1", "Party_2", "Party_3", "Party_4", "Party_5", "Party_6", "Party_7", "Party_8", "Party_10", "Party_11", "Party_12", "Party_14", "Party_15", "Party_16", "Party_17", "Party_18", "Party_19", "Party_22", "Party_23", "Party_25", "Party_26", "Party_27", "Party_28", "Party_30", "Party_41", "Protocol", "PrecID")

write.csv(PropData, "PropData.csv")
