source("D:/Dropbox/R-packages/rapex/R/Utils.R")
source("D:/Dropbox/R-packages/rapex/R/DownloadFiles.R")
source("D:/Dropbox/R-packages/rapex/R/SetWorkingEnv.R")
source("D:/Dropbox/R-packages/rapex/R/EditSubInput.R")
source("D:/Dropbox/R-packages/rapex/R/EditRunInput.R")
source("D:/Dropbox/R-packages/rapex/R/EditContInput.R")
source("D:/Dropbox/R-packages/rapex/R/EditSitInput.R")
source("D:/Dropbox/R-packages/rapex/R/Convert2Dly.R")

require(date)
library(stringr)
library(gdata)

EnvList = Set.Working.Environment(basedir = "G:/rNPS-Korea/rAPEX-Paddy", prjname = "SMG-Plots", envfile = "SMG-Plots.yaml")

## Climate Change Impacts Assessment (APCC)
#do.call(Convert.KMA-ASOS.To.DLY, EnvList)


####### APEX-Paddy Evaluation: BMP(Water Quality: APCC)
#rundir <- EnvList$rundir
cntldf <- do.call(call.control.data, EnvList)

for(RunNo in 1:nrow(cntldf)){

  # 1. Create APEX Input files
  NewEnvList = c(EnvList, RunNo = RunNo)
  do.call(Edit.APEX.SUB.Input, NewEnvList)
  do.call(Edit.APEX.RUN.Input, NewEnvList)
  do.call(Edit.APEX.CONT.Input, NewEnvList)
  do.call(Edit.APEX.SIT.Input, NewEnvList)
  do.call(Copy.APEX.Input.From.DBase, NewEnvList)

  # 2. Run APEX model and Move Input and Output files
  setwd(rundir)
  system("APEX0806.exe")
  Move.APEX.Input.Output.Files (EnvList, RunNo)

  # 3. Read Output files and Create Summary Report

}

## Climate Change Impacts Assessment (APCC)
#Convert.CMIP5.To.DLY (EnvList)

## Seasonal Forecast (APCC)


