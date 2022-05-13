{.=0;for(`~1` in c(1,2,3,4,5,6,7,8,9,10)){.=c(., `~1`,recursive=F)};print(unname(.[drop=T]));rm(.)}
 [1]  0  1  2  3  4  5  6  7  8  9 10
