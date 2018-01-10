##########################################################
Set.Working.Environment  <- function(basedir, prjname, envfile, override=list()) {

  options(stringsAsFactors = FALSE)

  SetWorkingDir(basedir)
  rundir = paste(basedir, "/APEX_Run", sep="")
  SetWorkingDir(rundir)
  dbdir = paste(basedir, "/DBase-Kr", sep="")
  SetWorkingDir(dbdir)
  soldir = paste(dbdir, "/sol", sep="")
  SetWorkingDir(soldir)
  opsdir = paste(dbdir, "/ops", sep="")
  SetWorkingDir(opsdir)
  gisdir = paste(dbdir, "/gis", sep="")
  SetWorkingDir(gisdir)
  wnddir = paste(dbdir, "/wnd", sep="")
  SetWorkingDir(wnddir)
  wp1dir = paste(dbdir, "/wp1", sep="")
  SetWorkingDir(wp1dir)
  dlydir = paste(dbdir, "/dly", sep="")
  SetWorkingDir(dlydir)
  ccdir = paste(dbdir, "/dly-CC", sep="")
  SetWorkingDir(ccdir)
  sfdir = paste(dbdir, "/dly-SF", sep="")
  SetWorkingDir(sfdir)
  obsdir = paste(dbdir, "/obs", sep="")
  SetWorkingDir(obsdir)

  prjdir = paste(basedir, "/", prjname, sep="")
  SetWorkingDir(prjdir)
  ctrldir = paste(prjdir, "/Control", sep="")
  SetWorkingDir(ctrldir)

  # Check EnvList file
  if (missing(envfile)) {
    EnvDFile = file.path(basedir, sprintf("%s.yaml", prjname))
  } else {
    EnvDFile = file.path(basedir, envfile)
  }

  if(!file.exists(EnvDFile)){
    stop(sprintf("Environment file %s does not exist!", EnvDFile))
  }

  data <- yaml::yaml.load_file(EnvDFile)



  outList = list("basedir"=basedir,
                 "prjdir"=prjdir,
                 "rundir"=rundir,
                 "dbdir"=dbdir,
                 "soldir"=soldir,
                 "opsdir"=opsdir,
                 "gisdir"=gisdir,
                 "wnddir"=wnddir,
                 "wp1dir"=wp1dir,
                 "dlydir"=dlydir,
                 "ccdir"=ccdir,
                 "sfdir"=sfdir,
                 "obsdir"=obsdir,
                 "ctrldir"=ctrldir,
                 "ctrlfile"=data$ctrlfile,
                 "cmip5dir"=data$cmip5dir,
                 "rcpscns"=data$rcpscns,
                 "lutype"=data$lutype)

  # override
  for (varname in names(override)) {
    outList[[varname]] = override[[varname]]
  }
  return(outList)

}

####################################################################
SetWorkingDir <- function(wdir) {

  dir.create(wdir, showWarnings=F,recursive=T)
  setwd(wdir)

}
