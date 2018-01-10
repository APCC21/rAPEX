# ctrldir <- NewEnvList$ctrldir
# ctrlfile <- NewEnvList$ctrlfile
# rundir <- NewEnvList$rundir
# soldir <- NewEnvList$soldir
# wnddir <- NewEnvList$wnddir
# wp1dir <- NewEnvList$wp1dir
# dlydir <- NewEnvList$dlydir
# opsdir <- NewEnvList$opsdir
# RunNo <- 1
################################################################
Copy.APEX.Input.From.DBase <- function(ctrldir, ctrlfile, rundir, soldir, wnddir, wp1dir, dlydir, opsdir, RunNo,...){

  setwd(rundir)

  # Get required information from Control file
  ctrldf <- call.control.data (ctrldir, ctrlfile)
  SoilID <- ctrldf$SoilID[RunNo]
  soildf <- read.table(file.path(rundir, "SOIL.DAT"), header=F)
  soilfn <- soildf[which(soildf[1] == SoilID), 2]

  # SOIL file
  file.copy(file.path(soldir, soilfn), file.path(rundir, soilfn), overwrite = T)

  # WND file
  file.copy(file.path(wnddir, "1.WND"), file.path(rundir, "1.WND"), overwrite = T)

  # WP1 file
  WStnID <- ctrldf$WStnID[RunNo]
  wp1df <- read.table(file.path(rundir, "WPM1.DAT"), header=F)
  wp1fn <- wp1df[which(wp1df[1] == WStnID), 2]
  file.copy(file.path(wp1dir, wp1fn), file.path(rundir, wp1fn), overwrite = T)

  # DLY file
  dlydf <- read.table(file.path(rundir, "WDLST.DAT"), header=F)
  dlyfn <- dlydf[which(dlydf[1] == WStnID), 2]
  file.copy(file.path(dlydir, dlyfn), file.path(rundir, dlyfn), overwrite = T)

  # Ops file
  OpsID <- ctrldf$OpsID[RunNo]
  opsdf <- read.fwf(file.path(rundir, "OPSC.DAT"), widths=c(5,10,90), fileEncoding="UTF-8")
  opsfn <- str_trim(opsdf[which(opsdf[1] == OpsID), 2])
  file.copy(file.path(opsdir, opsfn), file.path(rundir, opsfn), overwrite = T)

}

################################################################
Move.APEX.Input.Output.Files <- function(EnvList, RunNo){

  rundir <- EnvList$rundir     # rundir : folder address where APEX model runs
  prjdir <- EnvList$prjdir

  # Get required information from Control file
  ctrldf <- Call.control.data (EnvList)
  PlotNm <- ctrldf$PlotNm[RunNo]
  ScnNm <- ctrldf$ScnNm[RunNo]

  outdir = paste(prjdir, PlotNm, ScnNm, sep="/")
  SetWorkingDir(outdir)

  # Output files
  flist = list.files(rundir, pattern = glob2rx("ApexOut.*"))
  file.rename(from = paste(rundir, flist, sep="/"), to = paste(outdir, flist, sep="/"))
  flist = list.files(rundir, pattern = glob2rx("*.OUT"))
  file.rename(from = paste(rundir, flist, sep="/"), to = paste(outdir, flist, sep="/"))

  # APEXRUN Input file
  flist = list.files(rundir, pattern = glob2rx("APEXRUN.DAT"))
  file.rename(from = paste(rundir, flist, sep="/"), to = paste(outdir, flist, sep="/"))

  # APEXCONT Input file
  flist = list.files(rundir, pattern = glob2rx("APEXCONT.DAT"))
  file.rename(from = paste(rundir, flist, sep="/"), to = paste(outdir, flist, sep="/"))

  # SIT Input file
  flist = list.files(rundir, pattern = glob2rx("*.sit"))
  file.rename(from = paste(rundir, flist, sep="/"), to = paste(outdir, flist, sep="/"))

  # SUB Input file
  flist = list.files(rundir, pattern = glob2rx("*.sub"))
  file.rename(from = paste(rundir, flist, sep="/"), to = paste(outdir, flist, sep="/"))

  # OPS Input file
  flist = list.files(rundir, pattern = glob2rx("*.OPS"))
  file.rename(from = paste(rundir, flist, sep="/"), to = paste(outdir, flist, sep="/"))

  # SOL Input file
  flist = list.files(rundir, pattern = glob2rx("*.SOL"))
  file.rename(from = paste(rundir, flist, sep="/"), to = paste(outdir, flist, sep="/"))

  # WND Input file
  flist = list.files(rundir, pattern = glob2rx("*.WND"))
  file.rename(from = paste(rundir, flist, sep="/"), to = paste(outdir, flist, sep="/"))

  # WP1 Input file
  flist = list.files(rundir, pattern = glob2rx("*.WP1"))
  file.rename(from = paste(rundir, flist, sep="/"), to = paste(outdir, flist, sep="/"))

  # DLY Input file
  flist = list.files(rundir, pattern = glob2rx("*.DLY"))
  file.rename(from = paste(rundir, flist, sep="/"), to = paste(outdir, flist, sep="/"))

}

################################################################
call.control.data <- function(ctrldir, ctrlfile,...){

  ctrldir <- EnvList$ctrldir
  ctrlfile <- EnvList$ctrlfile

  setwd(ctrldir)
  CtrlData <- read.csv(file = ctrlfile)

  return(CtrlData)

}
