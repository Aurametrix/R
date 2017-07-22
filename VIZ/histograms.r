# Color housekeeping
library(RColorBrewer)
rf <- colorRampPalette(rev(brewer.pal(11,'Spectral')))
r <- rf(32)

# Create normally distributed data for plotting
x <- rnorm(mean=1.5, 5000)
y <- rnorm(mean=1.6, 5000)
df <- data.frame(x,y)

# Plot
plot(df, pch=16, col='black', cex=0.5)

##### OPTION 1: hexbin from package 'hexbin' #######
library(hexbin)
# Create hexbin object and plot
h <- hexbin(df)
plot(h)
plot(h, colramp=rf)

# hexbinplot function allows greater flexibility
hexbinplot(y~x, data=df, colramp=rf)
# Setting max and mins
hexbinplot(y~x, data=df, colramp=rf, mincnt=2, maxcnt=60)

# Scaling of legend - must provide both trans and inv functions
hexbinplot(y~x, data=df, colramp=rf, trans=log, inv=exp)
