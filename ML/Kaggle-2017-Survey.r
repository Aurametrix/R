# For Data Cleaning
library(tidyverse)
library(rlang)
library(stringr)
library(car)

# For text analysis and word clouds
library(tm)
library(SnowballC)
library(wordcloud)

 Import multiple choice data
rawMCData <- read.csv('../input/multipleChoiceResponses.csv', stringsAsFactors = TRUE, header = TRUE)

# Import freeform responses
rawFFData <- read.csv('../input/freeformResponses.csv', stringsAsFactors = FALSE, header = TRUE)

# Import the actual questions asked
schema <- read.csv('../input/schema.csv', stringsAsFactors = FALSE, header = TRUE)

#import the currency conversion rates for use later

conversionRates <- read.csv('../input/conversionRates.csv', header = TRUE)

# Number of rows
nrow(rawMCData)
## [1] 16716
ncol(rawMCData)
## [1] 228

#this dataset has 16,716 rows (survey entries) and 228 columns.
# duplicate dataframe “cleanMCData” and a separate copy for the freeform responses called “cleanFFData”

cleanMCData <- rawMCData
cleanFFData <- rawFFData

# A function to analyze questions where you choose only one answer
chooseOne = function(question, filteredData = cleanMCData){
  
  filteredData %>% 
    # Remove any rows where the respondent didn't answer the question
    filter(!UQ(sym(question)) == "") %>% 
    # Group by the responses to the question
    group_by_(question) %>% 
    # Count how many respondents selected each option
    summarise(count = n()) %>% 
    # Calculate what percent of respondents selected each option
    mutate(percent = (count / sum(count)) * 100) %>% 
    # Arrange the counts in descending order
    arrange(desc(count))
  
}

# A function to analyze questions where you choose multiple answers
chooseMultiple = function(question, filteredData = cleanMCData){

  filteredData %>% 
    # Remove any rows where the respondent didn't answer the question
    filter(!UQ(sym(question)) == "") %>%
    # Remove all columns except question
    select(question) %>% 
    # Add a column with the initial number of respondents to question
    mutate(totalCount = n()) %>% 
    # Split multiple answers apart at the comma, but ignore commas inside parentheses
    mutate(selections = strsplit(as.character(UQ(sym(question))), 
                                 '\\([^)]+,(*SKIP)(*FAIL)|,\\s*', perl = TRUE)) %>%
    # Split answers are now nested, need to unnest them
    unnest(selections) %>% 
    # Group by the selected responses to the question
    group_by(selections) %>% 
   # Count how many respondents selected each option
    summarise(totalCount = max(totalCount),
              count = n()) %>% 
    # Calculate what percent of respondents selected each option
    mutate(percent = (count / totalCount) * 100) %>% 
    # Arrange the counts in descending order
    arrange(desc(count))
  
}

# data exploration

# This question only allowed users to select one answer, so we'll use the chooseOne function
chooseOne("GenderSelect")

residence <- chooseOne("Country")


residenceFilter <- residence %>% 
  filter(count >= 20)

ggplot(residenceFilter, aes(x = reorder(Country, count), y = count)) + 
  geom_bar(stat = "identity") +
  theme(axis.text.x = element_text(angle = 90, 
                                   vjust = 0.5, 
                                   hjust = 1))
                                   
                                   
                                   
 # This column needs to be read as numbers
cleanMCData$Age <- as.numeric(as.character(cleanMCData$Age))

age <- chooseOne("Age") %>% 
   # Remove values < 1 year
  filter(!Age < 1)

age

ageHist <- cleanMCData %>% 
  # Remove any rows where the respondent didn't answer the question
  filter(!Age == "") %>% 
  select(Age)

ggplot(ageHist, aes(x = Age)) + 
  geom_histogram(binwidth = 2) + 
  xlab("Age (years)") + 
  ylab("Number of Respondents")
