##' read files
##'
##' HORRIBA - Labspec files
##' @title read_labspec
##' @param f filename
##' @param verbose logical
##' @param rownames logical, add pixel number
##' @param ... ignored
##' @export
##' @family read user_level
##' @return matrix, data.frame, or list
##' @author Baptiste Auguie
read_labspec <- function(f, verbose=FALSE, rownames=TRUE, ...){
  
  require(data.table)
  
  try({
    quiet <- capture.output(d <- fread(f))
    if(ncol(d) == 1L){
      if(verbose) message("only one column in this file")
      return(c(d))
    }
    m <- if(ncol(d) == 2L) as.matrix(d) else as.matrix(t(d)) #flip   
    nc <- NCOL(m)
    colnames(m) <- make.names(c("wavenumber", 
                                paste("y", seq.int(nc-1), sep="")))
    
    # remove lines with NA (saved as metadata)
    non.na <- complete.cases(m)    
    nr <- sum(non.na)
    if(!all(non.na) && verbose)
      message("removed lines #", which(!non.na),", ")  
    
    tags <- data.frame(t(m[!non.na, ,drop=FALSE]))
    tags <- tags[complete.cases(tags),]
    if(rownames)
      m <- cbind(pixel = seq.int(nr), m[non.na, ])
    else m <- m[non.na, ]
    
    if(NCOL(tags)) # piggy files have no tags
      attr(m, "tags") <- tags
    invisible(m)
  } )
  
}

##' read files
##'
##' Labspec files with Nr rows (spectra) and 1+Nc columns (id + wavenumbers)
##' @title read_labspec0
##' @param f filename
##' @family read user_level
##' @return list
##' @author Baptiste Auguie
read_labspec0 <- function(f, format=c( "wide", "both", "long"), verbose=FALSE){
  
  res <- NULL
  try({
    format <- match.arg(format)
    
    first.line <- read.table(f, head=F, nrows=1)
    second.line <- read.table(f, head=F, nrows=1, skip=1)
    
    n <- length(first.line)
    
    all.lines <- scan(f, quiet=!verbose)
    
    if(length(second.line) == n){ # all lines have equal length
      mat <- matrix(all.lines, ncol=n, byrow=TRUE)
      nc <- NCOL(mat)
      nr <- NROW(mat)
      ## cbind pixel counts
      spectra.names <- make.names(c("pixel", "wavenumber", paste("y", seq.int(nc-1), sep="")))
      wide <- cbind(seq.int(nrow(mat)),  mat)
      colnames(wide) <- spectra.names
      
      if(format == "long"){
        d <- as.data.frame(mat, stringsAsFactors=FALSE)
        names(d) <- spectra.names[-1]
        m <- melt(d, id="wavenumber")
      }
      
    } else { # nrow > 1: lines have a label
      if(verbose)
        message("using first column as a label")
      mat <- matrix(c(NA, all.lines), nrow=n+1, byrow=FALSE)
      nc <- NCOL(mat)
      nr <- NROW(mat)
      spectra.names <- make.names(c("pixel", "wavenumber", paste("y", mat[1, seq(2, nc)],sep="")))
      wide <- cbind(seq.int(nrow(mat)-1),  mat[-1, ])
      colnames(wide) <- spectra.names
      
      if(format == "long"){
        d <- as.data.frame(mat[-1,], stringsAsFactors=FALSE)
        names(d) <- spectra.names[-1]
        
        wavenumber <- rep(d[,1], nc-1)
        value <- as.vector(mat[-1 , seq(2, nc)])
        variable <- rep(mat[1, seq(2, nc)], each = nr -1)
        
        m <- data.frame(wavenumber = wavenumber,
                        value = value,
                        variable = variable)
      }
    }
    
    if(format == "long") res <- m
    else if(format == "wide") res <- wide
    else if(format == "both") res <- list(wide=wide, long=m)
  } )
  
  invisible(res)
  
}

##' read files
##'
##' Labspec files with Nr rows (spectra) and 1+Nc columns (id + wavenumbers)
##' @title read_labspec1
##' @param f filename
##' @family read 
##' @return list
##' @author Baptiste Auguie
read_labspec1 <- function(f){
  
  tc <- textConnection(system(paste("wc ", f), intern=TRUE))
  n <-  as.integer(scan(tc, "blahblah", quiet=TRUE)[1:3])
  names(n) <- c("lines", "word", "char")
  close(tc)
  
  tc <- textConnection(readChar(f, n[3]))
  head <- scan(tc, nlines=1, quiet=TRUE)
  res <- matrix(scan(tc, skip=1, nlines=n[1]-1, comment.char="", what=double()), 
                nrow=length(head) + 1, byrow=FALSE)
  close(tc)
  list(wavenumber = head, spectra = res[-1, ], ids = res[1, ])
}




##' read Raman spectra
##'
##' read Raman spectra
##' @title read_labspec2
##' @param .f file
##' @return melted data.frame
##' @author Baptiste Auguie
read_labspec2 <- function(.f, indexasnumeric=TRUE){
  first.line <- read.table(.f, head=F, nrows=1)
  second.line <- read.table(.f, head=F, nrows=1, skip=1)

  n <- length(first.line)

  all.lines <- scan(.f)
  ## browser()
  
 if(length(second.line) == n){ # all lines have equal length
    mat <- matrix(all.lines, ncol=n, byrow=TRUE)
    d <- as.data.frame(mat, stringsAsFactors=FALSE)
    nc <- NCOL(mat)
    nr <- NROW(mat)
    spectra.names <- paste("y", seq.int(nc-1), sep="")
    names(d) <- make.names(c("wavenumber", 
                             spectra.names))
     m <- melt(d, id="wavenumber")
    
     require(hyperSpec)
     spc <- new ("hyperSpec", spc=mat[ , seq(2, nc)],
                 wavelength=mat[,1],
                 data=data.frame(index = spectra.names),
                 label=list(.wavelength=expression(Delta * tilde(nu)/cm^-1),
                   spc = "Raman intensity / cnts"))
     
     res <- list(m = m, spc = spc)

  } else { # nrow >1 lines have a label
     
     print("using first column as a label")
     mat <- matrix(c(NA, all.lines), nrow=n+1, byrow=FALSE)
     nc <- NCOL(mat)
     nr <- NROW(mat)
     d <- as.data.frame(mat[-1,], stringsAsFactors=FALSE)
     names(d) <- make.names(c("wavenumber", 
                              paste("y", mat[1, seq(2, nc)],sep="")))
     wavenumber <- rep(d[,1], nc-1)
     value <- as.vector(mat[-1 , seq(2, nc)])
     variable <- rep(mat[1, seq(2, nc)], each = nr -1)
     ## browser()
     m <- data.frame(wavenumber = wavenumber,
                     value = value,
                     variable = variable)

     require(hyperSpec)
     spc <- new ("hyperSpec", spc=t(mat[-1 , seq(2, nc)]),
                 wavelength=d[,1],
                 data=data.frame(index = mat[1, seq(2, nc)]),
                 label=list(.wavelength=expression(Delta * tilde(nu)/cm^-1),
                   spc = "Raman intensity / cnts"))
     
     res <- list(m = m, spc = spc)
   }
  
  invisible(res)
}
