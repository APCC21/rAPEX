# ctrldir <- EnvList$ctrldir
# ctrlfile <- EnvList$ctrlfile
# rundir <- EnvList$rundir     # rundir : folder address where APEX model runs
# lutype <- EnvList$lutype
# RunNo <- 1
################################################################################
Edit.APEX.SIT.Input <- function(ctrldir, ctrlfile, rundir, RunNo, lutype,...){

  # Get required information from Control file
  ctrldf <- call.control.data (ctrldir, ctrlfile)
  PlotLat <- ctrldf$PlotLat[RunNo]
  PlotLon <- ctrldf$PlotLon[RunNo]
  PlotElev <- ctrldf$PlotElev[RunNo]
  PlotNm <- ctrldf$PlotNm[RunNo]

  setwd(rundir)

  if(lutype == "Paddy"){
    sitfname = "Paddy.sit"
  } else {
    sitfname = "Upland.sit"
  }
  sink(sitfname)

  # Line 1
  cat(sprintf("%s", sitfname), sep="\n")
  cat(sprintf("%s", PlotNm), sep="\n")
  cat(sprintf("%s", as.character(Sys.time())), sep="\n")
  cat(sprintf("%8.2f%8.2f%8.2f    1.00     .00     .00     .00 1000.00 1000.00     .00", PlotLat, PlotLon, PlotElev), sep="\n")
  cat("     .00     .00     .00     .00     .00     .00     .00     .00     .00     .00", sep="\n")
  cat(" ", sep="\n")
  cat(" ", sep="\n")
  cat("    .000", sep="\n")
  cat(" ", sep="\n")
  cat(" ", sep="\n")
  sink()

}

