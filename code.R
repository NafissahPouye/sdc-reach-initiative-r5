library(readxl)      #for excel, csv sheets manipulation
library(sdcMicro)    #sdcMicro package with functions for the SDC process 
library(tidyverse)   #optional #for data cleaning

#Import data
setwd("C:/Users/LENOVO T46OS/Desktop/sdc-reach-initiative-r5")
data <- read_excel("data.xlsx")
#Resource1 - Main Frame
#Comments
#houses numbers, ids
selectedKeyVars <- c('facility_name',	'position',	'gender')

#Convert variables into factors
cols =  c('facility_name',	'position',	'gender',)
data[,cols] <- lapply(data[,cols], factor)

#Convert the sub file into dataframe
#subVars <- c(selectedKeyVars, weightVars)
fileRes<-data[,selectedKeyVars]
fileRes <- as.data.frame(fileRes)
objSDC <- createSdcObj(dat = fileRes, 
                       keyVars = selectedKeyVars
                       )

print(objSDC, "risk")
report(objSDC, filename ="index",internal = T, verbose = TRUE)