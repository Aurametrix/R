require(XML)
data <- xmlParse("http://forecast.weather.gov/MapClick.php?lat=29.803&lon=-82.411&FcstType=digitalDWML")

xml_data <- xmlToList(data)

###  example xml
#    latitude  longitude   start-valid-time   hourly_temperature
#    29.803     -82.411  2013-06-19T15:00:00-04:00    91
#
## example parsing 
#  location <- as.list(xml_data[["data"]][["location"]][["point"]])
#
#  start_time <- unlist(xml_data[["data"]][["time-layout"]][
#  names(xml_data[["data"]][["time-layout"]]) == "start-valid-time"])
