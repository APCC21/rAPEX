# ctrldir <- NewEnvList$ctrldir
# ctrlfile <- NewEnvList$ctrlfile
# rundir <- NewEnvList$rundir
# lutype <- NewEnvList$lutype
# RunNo <- 1
################################################################################
Edit.APEX.SUB.Input <- function(ctrldir, ctrlfile, rundir, RunNo, lutype,...){

  # Get required information from Control file
  ctrldf <- call.control.data (ctrldir, ctrlfile)
  SoilID <- ctrldf$SoilID[RunNo]
  OpsID <- ctrldf$OpsID[RunNo]
  WStnID <- ctrldf$WStnID[RunNo]
  PlotLat <- ctrldf$PlotLat[RunNo]
  PlotLon <- ctrldf$PlotLon[RunNo]
  PlotAzm <- ctrldf$PlotAzm[RunNo]
  PlotArea <- ctrldf$PlotArea[RunNo]
  PlotSlp <- ctrldf$PlotSlp[RunNo]
  PlotSPLG <- ctrldf$PlotSPLG[RunNo]

  setwd(rundir)

  if(lutype == "Paddy"){
    sink("Paddy.sub")
  } else {
    sink("Upland.sub")
  }

  # Line 1
  #cat(sprintf("       1       Created on %s", as.character(Sys.time())), sep="\n")
  cat("       1       1", sep="\n")
  # Line 2
  cat(sprintf("%8d %7d       1       0       0       0       0 %7d       0       0       0       0", SoilID, OpsID, WStnID), sep="\n")
  # Line 3
  cat(sprintf("         0         0 %9.4f %9.4f %9d         0         0         0", PlotLat, PlotLon, PlotAzm), sep="\n")
  # Line 4
  cat(sprintf("%10.2f       0.1         0     0.001      0.02 %9.3f %9d      0.09         0         0", PlotArea, PlotSlp, PlotSPLG), sep="\n")
  # Line 5
  cat("       0.1         0         0         0     0.001      0.05      0.38         0         0         0", sep="\n")
  # Line 6
  cat("         0         0         0         0         0         0         0         0         0         0", sep="\n")
  # Line 7
  cat("         0         0         0         0         0         0", sep="\n")
  # Line 8
  cat("  12   0   0   1   0   0   0   0   0   0   0   0   0", sep="\n")
  # Line 9
  cat("         0         0         0         0         0         0         0         0         0         0", sep="\n")
  # Line 10
  cat("         1         0         0         0         0         0         0         0         0         0", sep="\n")
  # Line 11
  cat("       0       0       0       0       0       0       0       0       0       0", sep="\n")
  # Line 12
  cat("         0         0         0         0         0         0         0         0         0         0", sep="\n")
  cat("", sep="\n")
  sink()

}
