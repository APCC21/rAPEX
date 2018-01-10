# ctrldir <- NewEnvList$ctrldir
# ctrlfile <- NewEnvList$ctrlfile
# rundir <- NewEnvList$rundir     # rundir : folder address where APEX model runs
# lutype <- NewEnvList$lutype
# RunNo <- NewEnvList$RunNo
################################################################################
Edit.APEX.RUN.Input <- function(ctrldir, ctrlfile, rundir, RunNo, lutype,...){

  # Get Weather station information from Control file
  ctrldf <- call.control.data (ctrldir, ctrlfile)
  IWPN <- WStnID <- ctrldf$WStnID[RunNo]

  # Paddy or Upland
  if(lutype == "Paddy"){
    ISIT <- 1; ISUB <- 1
  } else {
    ISIT <- 2; ISUB <- 2
  }

  setwd(rundir)

  sink("APEXRUN.DAT")

  # Line 1
  cat(sprintf("   ApexOut %6d %6d      1 %6d      0      0", ISIT, IWPN, ISUB), sep="\n")
  # Line 2
  cat("XXXXXXXXXX      0      0      0      0      0", sep="\n")
  sink()

}
