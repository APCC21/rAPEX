
Convert.CMIP5.To.DLY <- function(EnvList){

  #cmip5dir = "D:/2016-KEI-WaterUse/CMIP5_Daily"
  cmip5dir <- EnvList$cmip5dir
  ccdir <- EnvList$ccdir
  rcpscns <- EnvList$rcpscns
  rcpcnt <- length(rcpscns)

  # Get Model Lists
  dirnms <- list.dirs(cmip5dir, recursive=F)
  mdlnms <- matrix(unlist(strsplit(dirnms, "/")), nrow=length(dirnms), byrow=T)
  mdlnms <- mdlnms[, ncol(mdlnms)]
  mdlcnt <- length(mdlnms)

  for(i in 1:mdlcnt){
    mdlnm <- mdlnms[i]
    mdldir <- paste(cmip5dir, mdlnm, sep="/")

    for(j in 1:rcpcnt){
      rcpnm <- rcpscns[j]

      srchstr <- paste("*", rcpnm, ".csv", sep="")
      flist <- list.files(mdldir, pattern = glob2rx(srchstr), full.names = T)
      fcnt <- length(flist)
      for(k in 1:fcnt){
        fname <- flist[k]
        imsi <- unlist(strsplit(fname, "_ID"))
        stnid <- as.numeric(substr(imsi[2],1,3))

        cmip5 <- read.csv(fname, header=T)
        cmip5$year <- as.numeric(substr(cmip5$date, 1, 4))
        cmip5$month <- as.numeric(substr(cmip5$date, 6, 7))
        cmip5$day <- as.numeric(substr(cmip5$date, 9, 10))

        out = cmip5[c("year", "month", "day", "rsds", "tmax", "tmin", "prcp", "wspd", "rhum")]
        outdir = paste(ccdir, mdlnm, rcpnm, sep="/")
        SetWorkingDir(outdir)
        outfname = sprintf("KR%04d.dly", stnid, sep="")
        sink(outfname)
        cat(sprintf("%6d%4d%4d%6.1f%6.1f%6.1f%6.1f%6.1f%6.1f",out$year, out$month, out$day, out$rsds, out$tmax, out$tmin, out$prcp, out$wspd, out$rhum), sep="\n")
        sink()

      }
    }
  }

}

