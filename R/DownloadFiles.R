Download.Database.Korea  <- function(basedir, prjname, envfile, override=list()) {

  rundir <-
  soldir <-
  opsdir <-
  gisdir <-
  wnddir <-
  wp1dir <-
  dlydir <-

  # Download necessary files
  website = "https://sites.google.com/site/waternvalue/file-cabinet/"
  #DownloadZip2DBdir (website, "apexfile.zip", rundir, updatemode = F)
  #DownloadZip2DBdir (website, "sol.zip", soldir, updatemode = F)
  #DownloadZip2DBdir (website, "ops.zip", opsdir, updatemode = F)
  #DownloadZip2DBdir (website, "gis.zip", gisdir, updatemode = F)
  #DownloadZip2DBdir (website, "wnd.zip", wnddir, updatemode = F)
  #DownloadZip2DBdir (website, "wp1.zip", wp1dir, updatemode = F)
  #DownloadZip2DBdir (website, "dly.zip", dlydir, updatemode = F)

  # Download Control file
  #download.file(paste(website, "control-dev.csv", sep=""), paste(ctrldir, "/control-dev.csv", sep=""))

  # Download EnvList file
  #download.file(paste(website, "EnvList-APEX.txt", sep=""), paste(basedir, "/EnvList-APEX.txt", sep=""))
  DstDFile = paste(basedir, "/", prjname, ".txt", sep="")
  if(!file.exists(DstDFile)){
    SrcDFile = paste(basedir, "/EnvList-APEX.txt", sep="")
    file.copy(SrcDFile, DstDFile)
  }

}


DownloadZip2DBdir <- function(website, zipfname, dstdir, updatemode) {

  flist = list.files(dstdir, pattern = glob2rx("*.*"), full.names = F)
  fcnt = length(flist)

  if(updatemode == T | fcnt == 0){

    setwd(dstdir)
    url = paste(website, zipfname, sep="")
    download.file(url,zipfname)
    unzip(zipfname)
    file.remove(zipfname)

  } else {
    sprintf("%s folder is not empty!", dstdir)
  }

}

