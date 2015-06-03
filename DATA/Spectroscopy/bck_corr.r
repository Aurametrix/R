##' baseline substraction
##'
##' uses baseline
##' @title background_correction
##' @param spc hyperspec
##' @return list of hyperspec
##' @author Baptiste Auguie
background_correction <- function(spc){

  background <- corrected <- spc
  bc <- baseline(spc[[]], method="rollingBall", 20, 20)
  corrected[[]] <- getCorrected(bc)
  background[[]] <- getBaseline(bc)
  list(corrected = corrected, background = background, bc=bc)
}
