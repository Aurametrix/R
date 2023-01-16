#Required libraries
library(gtrendsR)
library(Rcpp)
library(data.table)

#Extracting data
#OnlineDoctor
##Global
###2019
data <- gtrends(keyword = "online doctor", 
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/0/multiTimeline(0)_19.csv")

###2020
data <- gtrends(keyword = "online doctor", 
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/0/multiTimeline(0)_20.csv")
###2021
data <- gtrends(keyword = "online doctor", 
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/0/multiTimeline(0)_21.csv")

##Australia
###2019
data <- gtrends(keyword = "online doctor", 
                geo = "AU",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/1/multiTimeline(1)_19.csv")

###2020
data <- gtrends(keyword = "online doctor", 
                geo = "AU",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/1/multiTimeline(1)_20.csv")
###2021
data <- gtrends(keyword = "online doctor", 
                geo = "AU",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/1/multiTimeline(1)_21.csv")

##Canada
###2019
data <- gtrends(keyword = "online doctor", 
                geo = "CA",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/2/multiTimeline(2)_19.csv")

###2020
data <- gtrends(keyword = "online doctor", 
                geo = "CA",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/2/multiTimeline(2)_20.csv")
###2021
data <- gtrends(keyword = "online doctor", 
                geo = "CA",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/2/multiTimeline(2)_21.csv")

##New Zealand
###2019
data <- gtrends(keyword = "online doctor", 
                geo = "NZ",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/3/multiTimeline(3)_19.csv")

###2020
data <- gtrends(keyword = "online doctor", 
                geo = "NZ",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/3/multiTimeline(3)_20.csv")
###2021
data <- gtrends(keyword = "online doctor", 
                geo = "NZ",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/3/multiTimeline(3)_21.csv")

##United Kingdom
###2019
data <- gtrends(keyword = "online doctor", 
                geo = "GB",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/4/multiTimeline(4)_19.csv")

###2020
data <- gtrends(keyword = "online doctor", 
                geo = "GB",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/4/multiTimeline(4)_20.csv")
###2021
data <- gtrends(keyword = "online doctor", 
                geo = "GB",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/4/multiTimeline(4)_21.csv")

##United States
###2019
data <- gtrends(keyword = "online doctor", 
                geo = "US",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/5/multiTimeline(5)_19.csv")

###2020
data <- gtrends(keyword = "online doctor", 
                geo = "US",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/5/multiTimeline(5)_20.csv")
###2021
data <- gtrends(keyword = "online doctor", 
                geo = "US",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/5/multiTimeline(5)_21.csv")

##Ireland
###2019
data <- gtrends(keyword = "online doctor", 
                geo = "IE",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/6/multiTimeline(6)_19.csv")

###2020
data <- gtrends(keyword = "online doctor", 
                geo = "IE",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/6/multiTimeline(6)_20.csv")
###2021
data <- gtrends(keyword = "online doctor", 
                geo = "IE",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/6/multiTimeline(6)_21.csv")

#Telehealth
##Global
###2019
data <- gtrends(keyword = "telehealth", 
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/0/multiTimeline(0)_19.csv")

###2020
data <- gtrends(keyword = "telehealth", 
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/0/multiTimeline(0)_20.csv")
###2021
data <- gtrends(keyword = "telehealth", 
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/0/multiTimeline(0)_21.csv")

##Australia
###2019
data <- gtrends(keyword = "telehealth", 
                geo = "AU",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/1/multiTimeline(1)_19.csv")

###2020
data <- gtrends(keyword = "telehealth", 
                geo = "AU",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/1/multiTimeline(1)_20.csv")
###2021
data <- gtrends(keyword = "telehealth", 
                geo = "AU",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/1/multiTimeline(1)_21.csv")

##Canada
###2019
data <- gtrends(keyword = "telehealth", 
                geo = "CA",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/2/multiTimeline(2)_19.csv")

###2020
data <- gtrends(keyword = "telehealth", 
                geo = "CA",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/2/multiTimeline(2)_20.csv")
###2021
data <- gtrends(keyword = "telehealth", 
                geo = "CA",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/2/multiTimeline(2)_21.csv")

##New Zealand
###2019
data <- gtrends(keyword = "telehealth", 
                geo = "NZ",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/3/multiTimeline(3)_19.csv")

###2020
data <- gtrends(keyword = "telehealth", 
                geo = "NZ",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/3/multiTimeline(3)_20.csv")
###2021
data <- gtrends(keyword = "telehealth", 
                geo = "NZ",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/3/multiTimeline(3)_21.csv")

##United Kingdom
###2019
data <- gtrends(keyword = "telehealth", 
                geo = "GB",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/4/multiTimeline(4)_19.csv")

###2020
data <- gtrends(keyword = "telehealth", 
                geo = "GB",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/4/multiTimeline(4)_20.csv")
###2021
data <- gtrends(keyword = "telehealth", 
                geo = "GB",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/4/multiTimeline(4)_21.csv")

##United States
###2019
data <- gtrends(keyword = "telehealth", 
                geo = "US",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/5/multiTimeline(5)_19.csv")

###2020
data <- gtrends(keyword = "telehealth", 
                geo = "US",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/5/multiTimeline(5)_20.csv")
###2021
data <- gtrends(keyword = "telehealth", 
                geo = "US",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/5/multiTimeline(5)_21.csv")

##Ireland
###2019
data <- gtrends(keyword = "telehealth", 
                geo = "IE",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/6/multiTimeline(6)_19.csv")

###2020
data <- gtrends(keyword = "telehealth", 
                geo = "IE",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/6/multiTimeline(6)_20.csv")
###2021
data <- gtrends(keyword = "telehealth", 
                geo = "IE",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/6/multiTimeline(6)_21.csv")


#OnlineHealth
##Global
###2019
data <- gtrends(keyword = "online health", 
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/0/multiTimeline(0)_19.csv")

###2020
data <- gtrends(keyword = "online health", 
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/0/multiTimeline(0)_20.csv")
###2021
data <- gtrends(keyword = "online health", 
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/0/multiTimeline(0)_21.csv")

##Australia
###2019
data <- gtrends(keyword = "online health", 
                geo = "AU",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/1/multiTimeline(1)_19.csv")

###2020
data <- gtrends(keyword = "online health", 
                geo = "AU",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/1/multiTimeline(1)_20.csv")
###2021
data <- gtrends(keyword = "online health", 
                geo = "AU",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/1/multiTimeline(1)_21.csv")

##Canada
###2019
data <- gtrends(keyword = "online health", 
                geo = "CA",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/2/multiTimeline(2)_19.csv")

###2020
data <- gtrends(keyword = "online health", 
                geo = "CA",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/2/multiTimeline(2)_20.csv")
###2021
data <- gtrends(keyword = "online health", 
                geo = "CA",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/2/multiTimeline(2)_21.csv")

##New Zealand
###2019
data <- gtrends(keyword = "online health", 
                geo = "NZ",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/3/multiTimeline(3)_19.csv")

###2020
data <- gtrends(keyword = "online health", 
                geo = "NZ",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/3/multiTimeline(3)_20.csv")
###2021
data <- gtrends(keyword = "online health", 
                geo = "NZ",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/3/multiTimeline(3)_21.csv")

##United Kingdom
###2019
data <- gtrends(keyword = "online health", 
                geo = "GB",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/4/multiTimeline(4)_19.csv")

###2020
data <- gtrends(keyword = "online health", 
                geo = "GB",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/4/multiTimeline(4)_20.csv")
###2021
data <- gtrends(keyword = "online health", 
                geo = "GB",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/4/multiTimeline(4)_21.csv")

##United States
###2019
data <- gtrends(keyword = "online health", 
                geo = "US",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/5/multiTimeline(5)_19.csv")

###2020
data <- gtrends(keyword = "online health", 
                geo = "US",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/5/multiTimeline(5)_20.csv")
###2021
data <- gtrends(keyword = "online health", 
                geo = "US",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/5/multiTimeline(5)_21.csv")

##Ireland
###2019
data <- gtrends(keyword = "online health", 
                geo = "IE",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/6/multiTimeline(6)_19.csv")

###2020
data <- gtrends(keyword = "online health", 
                geo = "IE",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/6/multiTimeline(6)_20.csv")
###2021
data <- gtrends(keyword = "online health", 
                geo = "IE",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/6/multiTimeline(6)_21.csv")

#eHealth
##Global
###2019
data <- gtrends(keyword = "ehealth", 
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/0/multiTimeline(0)_19.csv")

###2020
data <- gtrends(keyword = "ehealth", 
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/0/multiTimeline(0)_20.csv")
###2021
data <- gtrends(keyword = "ehealth", 
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/0/multiTimeline(0)_21.csv")

##Australia
###2019
data <- gtrends(keyword = "ehealth", 
                geo = "AU",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/1/multiTimeline(1)_19.csv")

###2020
data <- gtrends(keyword = "ehealth", 
                geo = "AU",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/1/multiTimeline(1)_20.csv")
###2021
data <- gtrends(keyword = "ehealth", 
                geo = "AU",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/1/multiTimeline(1)_21.csv")

##Canada
###2019
data <- gtrends(keyword = "ehealth", 
                geo = "CA",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/2/multiTimeline(2)_19.csv")

###2020
data <- gtrends(keyword = "ehealth", 
                geo = "CA",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/2/multiTimeline(2)_20.csv")
###2021
data <- gtrends(keyword = "ehealth", 
                geo = "CA",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/2/multiTimeline(2)_21.csv")

##New Zealand
###2019
data <- gtrends(keyword = "ehealth", 
                geo = "NZ",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/3/multiTimeline(3)_19.csv")

###2020
data <- gtrends(keyword = "ehealth", 
                geo = "NZ",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/3/multiTimeline(3)_20.csv")
###2021
data <- gtrends(keyword = "ehealth", 
                geo = "NZ",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/3/multiTimeline(3)_21.csv")

##United Kingdom
###2019
data <- gtrends(keyword = "ehealth", 
                geo = "GB",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/4/multiTimeline(4)_19.csv")

###2020
data <- gtrends(keyword = "ehealth", 
                geo = "GB",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/4/multiTimeline(4)_20.csv")
###2021
data <- gtrends(keyword = "ehealth", 
                geo = "GB",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/4/multiTimeline(4)_21.csv")

##United States
###2019
data <- gtrends(keyword = "ehealth", 
                geo = "US",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/5/multiTimeline(5)_19.csv")

###2020
data <- gtrends(keyword = "ehealth", 
                geo = "US",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/5/multiTimeline(5)_20.csv")
###2021
data <- gtrends(keyword = "ehealth", 
                geo = "US",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/5/multiTimeline(5)_21.csv")

##Ireland
###2019
data <- gtrends(keyword = "ehealth", 
                geo = "IE",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/6/multiTimeline(6)_19.csv")

###2020
data <- gtrends(keyword = "ehealth", 
                geo = "IE",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/6/multiTimeline(6)_20.csv")
###2021
data <- gtrends(keyword = "ehealth", 
                geo = "IE",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/6/multiTimeline(6)_21.csv")

#Telemedicine
##Global
###2019
data <- gtrends(keyword = "telemedicine", 
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/0/multiTimeline(0)_19.csv")

###2020
data <- gtrends(keyword = "telemedicine", 
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/0/multiTimeline(0)_20.csv")
###2021
data <- gtrends(keyword = "telemedicine", 
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/0/multiTimeline(0)_21.csv")

##Australia
###2019
data <- gtrends(keyword = "telemedicine", 
                geo = "AU",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/1/multiTimeline(1)_19.csv")

###2020
data <- gtrends(keyword = "telemedicine", 
                geo = "AU",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/1/multiTimeline(1)_20.csv")
###2021
data <- gtrends(keyword = "telemedicine", 
                geo = "AU",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/1/multiTimeline(1)_21.csv")

##Canada
###2019
data <- gtrends(keyword = "telemedicine", 
                geo = "CA",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/2/multiTimeline(2)_19.csv")

###2020
data <- gtrends(keyword = "telemedicine", 
                geo = "CA",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/2/multiTimeline(2)_20.csv")
###2021
data <- gtrends(keyword = "telemedicine", 
                geo = "CA",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/2/multiTimeline(2)_21.csv")

##New Zealand
###2019
data <- gtrends(keyword = "telemedicine", 
                geo = "NZ",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/3/multiTimeline(3)_19.csv")

###2020
data <- gtrends(keyword = "telemedicine", 
                geo = "NZ",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/3/multiTimeline(3)_20.csv")
###2021
data <- gtrends(keyword = "telemedicine", 
                geo = "NZ",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/3/multiTimeline(3)_21.csv")

##United Kingdom
###2019
data <- gtrends(keyword = "telemedicine", 
                geo = "GB",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/4/multiTimeline(4)_19.csv")

###2020
data <- gtrends(keyword = "telemedicine", 
                geo = "GB",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/4/multiTimeline(4)_20.csv")
###2021
data <- gtrends(keyword = "telemedicine", 
                geo = "GB",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/4/multiTimeline(4)_21.csv")

##United States
###2019
data <- gtrends(keyword = "telemedicine", 
                geo = "US",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/5/multiTimeline(5)_19.csv")

###2020
data <- gtrends(keyword = "telemedicine", 
                geo = "US",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/5/multiTimeline(5)_20.csv")
###2021
data <- gtrends(keyword = "telemedicine", 
                geo = "US",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/5/multiTimeline(5)_21.csv")

##Ireland
###2019
data <- gtrends(keyword = "telemedicine", 
                geo = "IE",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/6/multiTimeline(6)_19.csv")

###2020
data <- gtrends(keyword = "telemedicine", 
                geo = "IE",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/6/multiTimeline(6)_20.csv")
###2021
data <- gtrends(keyword = "telemedicine", 
                geo = "IE",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/6/multiTimeline(6)_21.csv")

#OnlineNurse
##Global
###2019
data <- gtrends(keyword = "online nurse", 
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/0/multiTimeline(0)_19.csv")

###2020
data <- gtrends(keyword = "online nurse", 
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/0/multiTimeline(0)_20.csv")
###2021
data <- gtrends(keyword = "online nurse", 
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/0/multiTimeline(0)_21.csv")

##Australia
###2019
data <- gtrends(keyword = "online nurse", 
                geo = "AU",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/1/multiTimeline(1)_19.csv")

###2020
data <- gtrends(keyword = "online nurse", 
                geo = "AU",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/1/multiTimeline(1)_20.csv")
###2021
data <- gtrends(keyword = "online nurse", 
                geo = "AU",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/1/multiTimeline(1)_21.csv")

##Canada
###2019
data <- gtrends(keyword = "online nurse", 
                geo = "CA",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/2/multiTimeline(2)_19.csv")

###2020
data <- gtrends(keyword = "online nurse", 
                geo = "CA",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/2/multiTimeline(2)_20.csv")
###2021
data <- gtrends(keyword = "online nurse", 
                geo = "CA",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/2/multiTimeline(2)_21.csv")

##New Zealand
###2019
data <- gtrends(keyword = "online nurse", 
                geo = "NZ",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/3/multiTimeline(3)_19.csv")

###2020
data <- gtrends(keyword = "online nurse", 
                geo = "NZ",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/3/multiTimeline(3)_20.csv")
###2021
data <- gtrends(keyword = "online nurse", 
                geo = "NZ",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/3/multiTimeline(3)_21.csv")

##United Kingdom
###2019
data <- gtrends(keyword = "online nurse", 
                geo = "GB",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/4/multiTimeline(4)_19.csv")

###2020
data <- gtrends(keyword = "online nurse", 
                geo = "GB",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/4/multiTimeline(4)_20.csv")
###2021
data <- gtrends(keyword = "online nurse", 
                geo = "GB",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/4/multiTimeline(4)_21.csv")

##United States
###2019
data <- gtrends(keyword = "online nurse", 
                geo = "US",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/5/multiTimeline(5)_19.csv")

###2020
data <- gtrends(keyword = "online nurse", 
                geo = "US",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/5/multiTimeline(5)_20.csv")
###2021
data <- gtrends(keyword = "online nurse", 
                geo = "US",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/5/multiTimeline(5)_21.csv")

##Ireland
###2019
data <- gtrends(keyword = "online nurse", 
                geo = "IE",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/6/multiTimeline(6)_19.csv")

###2020
data <- gtrends(keyword = "online nurse", 
                geo = "IE",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/6/multiTimeline(6)_20.csv")
###2021
data <- gtrends(keyword = "online nurse", 
                geo = "IE",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/6/multiTimeline(6)_21.csv")

#OnlinePharmacy
##Global
###2019
data <- gtrends(keyword = "online pharmacy", 
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/0/multiTimeline(0)_19.csv")

###2020
data <- gtrends(keyword = "online pharmacy", 
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/0/multiTimeline(0)_20.csv")
###2021
data <- gtrends(keyword = "online pharmacy", 
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/0/multiTimeline(0)_21.csv")

##Australia
###2019
data <- gtrends(keyword = "online pharmacy", 
                geo = "AU",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/1/multiTimeline(1)_19.csv")

###2020
data <- gtrends(keyword = "online pharmacy", 
                geo = "AU",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/1/multiTimeline(1)_20.csv")
###2021
data <- gtrends(keyword = "online pharmacy", 
                geo = "AU",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/1/multiTimeline(1)_21.csv")

##Canada
###2019
data <- gtrends(keyword = "online pharmacy", 
                geo = "CA",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/2/multiTimeline(2)_19.csv")

###2020
data <- gtrends(keyword = "online pharmacy", 
                geo = "CA",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/2/multiTimeline(2)_20.csv")
###2021
data <- gtrends(keyword = "online pharmacy", 
                geo = "CA",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/2/multiTimeline(2)_21.csv")

##New Zealand
###2019
data <- gtrends(keyword = "online pharmacy", 
                geo = "NZ",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/3/multiTimeline(3)_19.csv")

###2020
data <- gtrends(keyword = "online pharmacy", 
                geo = "NZ",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/3/multiTimeline(3)_20.csv")
###2021
data <- gtrends(keyword = "online pharmacy", 
                geo = "NZ",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/3/multiTimeline(3)_21.csv")

##United Kingdom
###2019
data <- gtrends(keyword = "online pharmacy", 
                geo = "GB",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/4/multiTimeline(4)_19.csv")

###2020
data <- gtrends(keyword = "online pharmacy", 
                geo = "GB",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/4/multiTimeline(4)_20.csv")
###2021
data <- gtrends(keyword = "online pharmacy", 
                geo = "GB",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/4/multiTimeline(4)_21.csv")

##United States
###2019
data <- gtrends(keyword = "online pharmacy", 
                geo = "US",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/5/multiTimeline(5)_19.csv")

###2020
data <- gtrends(keyword = "online pharmacy", 
                geo = "US",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/5/multiTimeline(5)_20.csv")
###2021
data <- gtrends(keyword = "online pharmacy", 
                geo = "US",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/5/multiTimeline(5)_21.csv")

##Ireland
###2019
data <- gtrends(keyword = "online pharmacy", 
                geo = "IE",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/6/multiTimeline(6)_19.csv")

###2020
data <- gtrends(keyword = "online pharmacy", 
                geo = "IE",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/6/multiTimeline(6)_20.csv")
###2021
data <- gtrends(keyword = "online pharmacy", 
                geo = "IE",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/6/multiTimeline(6)_21.csv")

#HealthApp
##Global
###2019
data <- gtrends(keyword = "health app", 
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/0/multiTimeline(0)_19.csv")

###2020
data <- gtrends(keyword = "health app", 
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/0/multiTimeline(0)_20.csv")
###2021
data <- gtrends(keyword = "health app", 
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/0/multiTimeline(0)_21.csv")

##Australia
###2019
data <- gtrends(keyword = "health app", 
                geo = "AU",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/1/multiTimeline(1)_19.csv")

###2020
data <- gtrends(keyword = "health app", 
                geo = "AU",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/1/multiTimeline(1)_20.csv")
###2021
data <- gtrends(keyword = "health app", 
                geo = "AU",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/1/multiTimeline(1)_21.csv")

##Canada
###2019
data <- gtrends(keyword = "health app", 
                geo = "CA",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/2/multiTimeline(2)_19.csv")

###2020
data <- gtrends(keyword = "health app", 
                geo = "CA",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/2/multiTimeline(2)_20.csv")
###2021
data <- gtrends(keyword = "health app", 
                geo = "CA",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/2/multiTimeline(2)_21.csv")

##New Zealand
###2019
data <- gtrends(keyword = "health app", 
                geo = "NZ",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/3/multiTimeline(3)_19.csv")

###2020
data <- gtrends(keyword = "health app", 
                geo = "NZ",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/3/multiTimeline(3)_20.csv")
###2021
data <- gtrends(keyword = "health app", 
                geo = "NZ",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/3/multiTimeline(3)_21.csv")

##United Kingdom
###2019
data <- gtrends(keyword = "health app", 
                geo = "GB",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/4/multiTimeline(4)_19.csv")

###2020
data <- gtrends(keyword = "health app", 
                geo = "GB",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/4/multiTimeline(4)_20.csv")
###2021
data <- gtrends(keyword = "health app", 
                geo = "GB",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/4/multiTimeline(4)_21.csv")

##United States
###2019
data <- gtrends(keyword = "health app", 
                geo = "US",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/5/multiTimeline(5)_19.csv")

###2020
data <- gtrends(keyword = "health app", 
                geo = "US",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/5/multiTimeline(5)_20.csv")
###2021
data <- gtrends(keyword = "health app", 
                geo = "US",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/5/multiTimeline(5)_21.csv")

##Ireland
###2019
data <- gtrends(keyword = "health app", 
                geo = "IE",
                time = "2019-02-01 2019-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/6/multiTimeline(6)_19.csv")

###2020
data <- gtrends(keyword = "health app", 
                geo = "IE",
                time = "2020-02-01 2020-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/6/multiTimeline(6)_20.csv")
###2021
data <- gtrends(keyword = "health app", 
                geo = "IE",
                time = "2021-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/6/multiTimeline(6)_21.csv")

#Weekly trends
##Global
data <- gtrends(keyword = "online doctor", 
                  time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/0/multiTimeline_w(0).csv")

data <- gtrends(keyword = "telehealth", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/0/multiTimeline_w(0).csv")

data <- gtrends(keyword = "online health", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/0/multiTimeline_w(0).csv")

data <- gtrends(keyword = "ehealth", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/0/multiTimeline_w(0).csv")

data <- gtrends(keyword = "telemedicine", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/0/multiTimeline_w(0).csv")

data <- gtrends(keyword = "online nurse", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/0/multiTimeline_w(0).csv")

data <- gtrends(keyword = "online pharmacy", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/0/multiTimeline_w(0).csv")

##Australia
data <- gtrends(keyword = "online doctor",
                geo = "AU",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/1/multiTimeline_w(1).csv")

data <- gtrends(keyword = "telehealth",
                geo = "AU", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/1/multiTimeline_w(1).csv")

data <- gtrends(keyword = "online health", 
                geo = "AU",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/1/multiTimeline_w(1).csv")

data <- gtrends(keyword = "ehealth", 
                geo = "AU",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/1/multiTimeline_w(1).csv")

data <- gtrends(keyword = "telemedicine", 
                geo = "AU",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/1/multiTimeline_w(1).csv")

data <- gtrends(keyword = "online nurse", 
                geo = "AU", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/1/multiTimeline_w(1).csv")

data <- gtrends(keyword = "online pharmacy", 
                geo = "AU", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/1/multiTimeline_w(1).csv")

##Canada
data <- gtrends(keyword = "online doctor",
                geo = "CA",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/2/multiTimeline_w(2).csv")

data <- gtrends(keyword = "telehealth",
                geo = "CA", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/2/multiTimeline_w(2).csv")

data <- gtrends(keyword = "online health", 
                geo = "CA",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/2/multiTimeline_w(2).csv")

data <- gtrends(keyword = "ehealth", 
                geo = "CA",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/2/multiTimeline_w(2).csv")

data <- gtrends(keyword = "telemedicine", 
                geo = "CA",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/2/multiTimeline_w(2).csv")

data <- gtrends(keyword = "online nurse", 
                geo = "CA", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/2/multiTimeline_w(2).csv")

data <- gtrends(keyword = "online pharmacy", 
                geo = "CA", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/2/multiTimeline_w(2).csv")

##New Zealand
data <- gtrends(keyword = "online doctor",
                geo = "NZ",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/3/multiTimeline_w(3).csv")

data <- gtrends(keyword = "telehealth",
                geo = "NZ", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/3/multiTimeline_w(3).csv")

data <- gtrends(keyword = "online health", 
                geo = "NZ",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/3/multiTimeline_w(3).csv")

data <- gtrends(keyword = "ehealth", 
                geo = "NZ",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/3/multiTimeline_w(3).csv")

data <- gtrends(keyword = "telemedicine", 
                geo = "NZ",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/3/multiTimeline_w(3).csv")

data <- gtrends(keyword = "online nurse", 
                geo = "NZ", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/3/multiTimeline_w(3).csv")

data <- gtrends(keyword = "online pharmacy", 
                geo = "NZ", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/3/multiTimeline_w(3).csv")

##United Kingdom
data <- gtrends(keyword = "online doctor",
                geo = "GB",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/4/multiTimeline_w(4).csv")

data <- gtrends(keyword = "telehealth",
                geo = "GB", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/4/multiTimeline_w(4).csv")

data <- gtrends(keyword = "online health", 
                geo = "GB",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/4/multiTimeline_w(4).csv")

data <- gtrends(keyword = "ehealth", 
                geo = "GB",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/4/multiTimeline_w(4).csv")

data <- gtrends(keyword = "telemedicine", 
                geo = "GB",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/4/multiTimeline_w(4).csv")

data <- gtrends(keyword = "online nurse", 
                geo = "GB", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/4/multiTimeline_w(4).csv")

data <- gtrends(keyword = "online pharmacy", 
                geo = "GB", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/4/multiTimeline_w(4).csv")

##United States
data <- gtrends(keyword = "online doctor",
                geo = "US",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/5/multiTimeline_w(5).csv")

data <- gtrends(keyword = "telehealth",
                geo = "US", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/5/multiTimeline_w(5).csv")

data <- gtrends(keyword = "online health", 
                geo = "US",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/5/multiTimeline_w(5).csv")

data <- gtrends(keyword = "ehealth", 
                geo = "US",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/5/multiTimeline_w(5).csv")

data <- gtrends(keyword = "telemedicine", 
                geo = "US",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/5/multiTimeline_w(5).csv")

data <- gtrends(keyword = "online nurse", 
                geo = "US", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/5/multiTimeline_w(5).csv")

data <- gtrends(keyword = "online pharmacy", 
                geo = "US", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/5/multiTimeline_w(5).csv")

##Ireland
data <- gtrends(keyword = "online doctor",
                geo = "IE",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineDoctor-data/6/multiTimeline_w(6).csv")

data <- gtrends(keyword = "telehealth",
                geo = "IE", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telehealth-data/6/multiTimeline_w(6).csv")

data <- gtrends(keyword = "online health", 
                geo = "IE",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineHealth-data/6/multiTimeline_w(6).csv")

data <- gtrends(keyword = "ehealth", 
                geo = "IE",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-eHealth-data/6/multiTimeline_w(6).csv")

data <- gtrends(keyword = "telemedicine", 
                geo = "IE",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-Telemedicine-data/6/multiTimeline_w(6).csv")

data <- gtrends(keyword = "online nurse", 
                geo = "IE", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlineNurse-data/6/multiTimeline_w(6).csv")

data <- gtrends(keyword = "online pharmacy", 
                geo = "IE", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-OnlinePharmacy-data/6/multiTimeline_w(6).csv")

#HealthApp
##Weekly Global
data <- gtrends(keyword = "health app", 
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/0/multiTimeline_w(0).csv")

##Australia
data <- gtrends(keyword = "health app", 
                geo = "AU",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/1/multiTimeline_w(1).csv")

##Canada
data <- gtrends(keyword = "health app", 
                geo = "CA",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/2/multiTimeline_w(2).csv")

##New Zealand
data <- gtrends(keyword = "health app", 
                geo = "NZ",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/3/multiTimeline_w(3).csv")

##United Kingdom
data <- gtrends(keyword = "health app", 
                geo = "GB",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/4/multiTimeline_w(4).csv")

##United States
data <- gtrends(keyword = "health app", 
                geo = "US",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/5/multiTimeline_w(5).csv")

##Ireland
data <- gtrends(keyword = "health app", 
                geo = "IE",
                time = "2019-02-01 2021-08-01")
data <- data$interest_over_time
data$date <- as.Date(data$date)
fwrite(data, file = "C:/Users/robin/Dropbox/Google Trends/Data/Google-trends-HealthApp-data/6/multiTimeline_w(6).csv")
