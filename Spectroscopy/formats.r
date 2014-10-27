## R accepts a variety of compressed file formats for ASCII files:
#> scan.txt.Renishaw ("txt.Renishaw/chondro.gz")
#> scan.txt.Renishaw ("txt.Renishaw/chondro.xz")
#> scan.txt.Renishaw ("txt.Renishaw/chondro.lzma")
#> scan.txt.Renishaw ("txt.Renishaw/chondro.gz")
#> scan.txt.Renishaw ("txt.Renishaw/chondro.bz2")


##Very large files can be read in chunks to save memory:
#> scan.txt.Renishaw ("txt.Renishaw/chondro.txt", nlines = 1e5, nspc = 875)

#Instead of a file name, scan.txt.Renishaw accepts also a connection.
#> paracetamol <- scan.txt.Renishaw ("txt.Renishaw/paracetamol.txt", "spc")

##Horiba's LabSpec
#> spc <- read.txt.Horiba ("txt.HoribaJobinYvon/ts.txt",
#+ cols = list (t = "t / s", spc = "I / a.u.",
#+ .wavelength = expression (Delta * tilde (nu) / cm^-1))
#+ )
#> spc

##Witek
#> scan.dat.Witec ("txt.Witec/WitecExample-x.dat", points.per.line = 10, lines.per.image = 10)


##Import of matlab files by Cytospec
#> read.cytomat ("mat.cytospec/cytospec.mat", blocks = TRUE)

##Bruker's ENVI files
#> spc <- read.ENVI ("ENVI/example2.img")

##Thermo Galactic’s .spc file format can be imported by read.spc.

##Instead of a file name, scan.txt.Renishaw accepts also a connection.
#> paracetamol <- scan.txt.Renishaw ("txt.Renishaw/paracetamol.txt", "spc")
#> paracetamol
