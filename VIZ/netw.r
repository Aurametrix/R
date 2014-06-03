## examples of vizualizing simple graphs - networks, nased on transition matrix
example(plotmat)
example(plotweb)
## run demos
demo("flowchart") # creating flow charts
demo("plotmat") # plotting diagrams inputted as a matrix
demo("plotweb") # plotting webs inputted as a matrix
## open the directory with source code of demos
browseURL(paste(system.file(package="diagram"), "/demo", sep=""))
## show package vignette
vignette("diagram")
edit(vignette("diagram"))
browseURL(paste(system.file(package="diagram"), "/doc", sep=""))

