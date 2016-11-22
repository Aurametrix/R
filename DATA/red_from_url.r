read.table.url("http://lib.stat.cmu.edu/jcgs/tu",skip=4,header=T)
url.show("http://lib.stat.cmu.edu/datasets/csb/ch11b.txt")
beaver<-read.table.url("http://lib.stat.cmu.edu/datasets/csb/ch11b.dat",
  col.names=c("obsnum","day","time","temperature","activity"),row.names=1)
# the next two examples will only work if socket connections to
# statlib are allowed from your site.
url.show("http://lib.stat.cmu.edu/datasets/csb/ch3a.txt",
                  method="socket")
ozone<-read.table.url("http://lib.stat.cmu.edu/datasets/csb/ch3a.dat",
  col.names=c("date","day.cts","day.passive","night.cts","night.passive"),
  na.strings=".", method="socket")
