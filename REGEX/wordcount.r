## Not run:
# WORD COUNT
word.count(DATA$state)
wc(DATA$state)
word.count(DATA$state, names = TRUE)
word.count(DATA$state, byrow=FALSE, names = TRUE)
sum(word.count(DATA$state))
 
# CHARACTER COUNTS
character.count(DATA$state)
character.count(DATA$state, byrow=FALSE)
sum(character.count(DATA$state))
 
# CHARACTER TABLE
x <- character.table(DATA$state, DATA$person)
plot(x)
plot(x, label = TRUE)
plot(x, label = TRUE, text.color = "red")
plot(x, label = TRUE, lab.digits = 1, zero.replace = "PP7")
x$raw[, 1:20]
x$prop[, 1:8]
x$rnp[, 1:8]
 
## char.table(DATA$state, DATA$person)
## char.table(DATA$state, DATA$person, percent = TRUE)
## character.table(DATA$state, list(DATA$sex, DATA$adult))
 
library(ggplot2);library(reshape2)
dat <- character.table(DATA$state, list(DATA$sex, DATA$adult))
dat2 <- colsplit2df(melt(dat$raw), keep.orig = TRUE)
head(dat2, 15)
dat3 <- dat2[rep(seq_len(dim(dat2)[1]), dat2[, 5]), -5]
 
 
ggplot(data = dat2, aes(y = variable, x = value, colour=sex)) +
    facet_grid(adult~.) +
    geom_line(size=1, aes(group =variable), colour = "black") +
    geom_point()
 
ggplot(data = dat3, aes(x = variable, fill = variable)) +
    geom_bar() +
    facet_grid(sex ~ adult, margins = TRUE) +
    theme(legend.position="none")
## End(Not run)
