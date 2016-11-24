socket <- url("http://www.math.hope.edu/swanson/data/miss_america.txt")
ma.dat <- read.table(socket, skip=5, header=TRUE, na.strings=c("*"))
ma.dat[ma.dat$year > 1991,]
ma.dat$bmi <- ma.dat$weight / (ma.dat$height ** 2) * 703
us.year <- c(1960:1962,1971:1974,1976:1980,1988:1994,1999:2002)
us.bmi <- c(rep(22.2,3),rep(23.0,4),rep(23.1,5),rep(24.3,7),rep(26.8,4))
us.year <- c(us.year,2003:2006)
us.bmi <- c(us.bmi,rep(26.5,4))
us.year <- c(us.year,2007:2010)
us.bmi <- c(us.bmi,rep(27.5,4))
us.dat <- data.frame(year=us.year, bmi=us.bmi)
us.dat$weight <- c(rep(1/3,3),rep(1/4,4),rep(1/5,5),rep(1/7,7),rep(1/4,4),rep(1/4,4),rep(1/4,4))

require(ggplot2)
## Loading required package: ggplot2
ggplot(us.dat, aes(x=year,y=bmi,weight=weight)) +
  geom_point(color="skyblue") +
  geom_smooth(method="lm",fullrange=TRUE) +
  geom_point(data=ma.dat, aes(x=year,y=bmi), color = "navy") +
  geom_smooth(data=ma.dat, aes(x=year,y=bmi), method="loess") +
  xlab("Year") +
  ylab("BMI")
