# package utils reads a file in table format and creates a data frame from it, 
# with cases corresponding to lines and variables to fields in the file.

read.table(file, header = FALSE, sep = "", quote = "\"'",
           dec = ".", row.names, col.names,
           as.is = !stringsAsFactors,
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE, fill = !blank.lines.skip,
           strip.white = FALSE, blank.lines.skip = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           stringsAsFactors = default.stringsAsFactors(),
           fileEncoding = "", encoding = "unknown", text)

read.csv(file, header = TRUE, sep = ",", quote = "\"",
         dec = ".", fill = TRUE, comment.char = "", ...)

dat = read.csv("table.csv", header = TRUE)

read.csv2(file, header = TRUE, sep = ";", quote = "\"",
          dec = ",", fill = TRUE, comment.char = "", ...)

read.delim(file, header = TRUE, sep = "\t", quote = "\"",
           dec = ".", fill = TRUE, comment.char = "", ...)

read.delim2(file, header = TRUE, sep = "\t", quote = "\"",
            dec = ",", fill = TRUE, comment.char = "", ...)

read.csv2(file, header = TRUE, sep = ";", quote = "\"",
          dec = ",", fill = TRUE, comment.char = "", ...)

read.delim(file, header = TRUE, sep = "\t", quote = "\"",
           dec = ".", fill = TRUE, comment.char = "", ...)

read.delim2(file, header = TRUE, sep = "\t", quote = "\"",
            dec = ",", fill = TRUE, comment.char = "", ...)

# library(gdata)
data = read.xls("excelfile.xls")


"library(foreign)package contains the following functions:
data.restore   Read an S3 Binary File
lookup.xport   Lookup Information on a SAS XPORT Format
               Library
read.dbf       Read a DBF File
read.dta       Read Stata binary files
read.epiinfo   Read Epi Info data files
read.mtp       Read a Minitab Portable Worksheet
read.octave    Read Octave Text Data Files
read.spss      Read an SPSS data file
read.ssd       Obtain a Data Frame from a SAS Permanent
               Dataset, via read.xport
read.systat    Obtain a Data Frame from a Systat File
read.xport     Read a SAS XPORT Format Library
write.dbf      Write a DBF File
write.dta      Write Files in Stata Binary Format
write.foreign  Write text files and code to read them"

# Package XLConnect can read, write and manipulate both Excel 97–2003 and Excel 2007/10 spreadsheets, requiring Java.
