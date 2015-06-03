replace_outliers <-
function(cdata){
data_sum<-summary(cdata,na.rm=TRUE)
iqr_value<-data_sum[5]-data_sum[2]
upper_limit<-data_sum[5]+1.5*iqr_value
lower_limit<-data_sum[2]-(1.5*iqr_value)
cdata[which(cdata<lower_limit)]<-min(cdata[which(cdata>lower_limit & cdata<upper_limit)],na.rm=TRUE)
cdata[which(cdata>upper_limit)]<-max(cdata[which(cdata>lower_limit & cdata<upper_limit)],na.rm=TRUE)
return(cdata)
}
