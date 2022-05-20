# plug in your API key
> myapikey <- "YOUR API KEY"

# the url path to the service
> URL <- "https://api.data.gov/ed/collegescorecard/v1/schools?"

# GET(): download all available data for Emory University
> get.data <- GET(URL, query=list(api_key=myapikey,
                                  school.name="Emory University"))

# content(): extract the content from the query
> emory.data <- content(get.data) 
> class(emory.data) # it's a list object

## [1] "list"

# what's in emory.data
> names(emory.data) # contains two components: metadata, results

## [1] "metadata" "results"

# what's inside the results component
> names(emory.data$results[[1]])

##  [1] "2008"     "2009"     "2006"     "ope6_id"  "2007"     "2004"    
##  [7] "2013"     "2005"     "location" "2014"     "2002"     "2003"    
## [13] "id"       "1996"     "1997"     "school"   "1998"     "2012"    
## [19] "2011"     "2010"     "ope8_id"  "1999"     "2001"     "2000"

# see available dev-categories for 2013 data
> names(emory.data$results[[1]]$`2013`)

## [1] "earnings"   "academics"  "student"    "admissions" "repayment" 
## [6] "aid"        "cost"       "completion"

# available variables under the cost category for 2013 data
> names(emory.data$results[[1]]$`2013`$cost)

## [1] "title_iv"      "avg_net_price" "attendance"    "tuition"      
## [5] "net_price"

# elements of the tuition variable
> names(emory.data$results[[1]]$`2013`$cost$tuition)

## [1] "out_of_state" "in_state"     "program_year" 
