# ctrldir <- EnvList$ctrldir
# ctrlfile <- EnvList$ctrlfile
# rundir <- EnvList$rundir     # rundir : folder address where APEX model runs
# RunNo <- 1
################################################################################
Edit.APEX.CONT.Input <- function(ctrldir, ctrlfile, rundir, RunNo,...){

  # Get required information from Control file
  ctrldf <- call.control.data (ctrldir, ctrlfile)
  syear <- as.integer(ctrldf$syear[RunNo])
  eyear <- as.integer(ctrldf$eyear[RunNo])
  ryears <- eyear - syear + 1

  setwd(rundir)

  sink("APEXCONT.DAT")

  # Line 1
  cat(sprintf("%4d%4d   1   1   0 245   0   0   0   1   0   0   0   0   0   0   1   0   0   1", ryears, syear), sep="\n")
  # Line 2
  cat("   0   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0", sep="\n")
  cat("    0.77  380.00    0.00    0.00    0.00    0.00    0.00    0.00    0.50    0.01", sep="\n")
  cat("    1.00    1.00    0.10   50.00   10.00    0.95    0.00    0.00    0.00   90.00", sep="\n")
  cat("    0.60    0.00    1.00    0.00  100.00    0.00    0.00    0.00    0.00    5.00", sep="\n")
  cat("    4.00    0.00    0.00    0.00    0.22    0.68    0.95    0.61", sep="\n")
  sink()

}
