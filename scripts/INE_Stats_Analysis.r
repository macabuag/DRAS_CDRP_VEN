# Title: INE_Stats_Analysis
# By: Josh Macabuag (macabuag@gmail.com)
# Date: 11-Mar-2019
# Description: This script analyses data by Venezuela's Instituto Nacional de Estadistica de Venezuela
# Naming Convention: 
#              variables: lowerCamelCase
#              datasets: UpperCamelCase

## 1.0 SET-UP ################################################################################################################
## Timer ##
time <- list()
time$start <- Sys.time()

## General Input Files ##
iFile <- list()
iFile$UT_Data <- file.path("inputs", "UT_Data Query.csv") #location of the files to be summarized

## User Inputs ##

## Create Output Files ##
oFolder <- paste0(gsub("[[:punct:]]", " ", Sys.time()), "-Estadisticas_INE")  #create a unique folder with the run date

## Packages ##
if(!require("data.table")) {
  install.packages("data.table")
  library(data.table)
}
if(!require("bit64")) {
  install.packages("bit64")
  library(bit64)
} #to read type 'integer64'

if(!require("stringr")){
  install.packages("stringr")
  library(stringr)
}

if(!require("ggplot2")) {
  install.packages("ggplot2")
  library(ggplot2)
}


## 2.0 Read Folder -----------------------------------------------
UT_Data <- fread(iFile$UT_Data, encoding = "UTF-8")


uniqueFields <- list()
uniqueFields$Indicator_Names <- unique(UT_Data$Indicator_Name)

## 3.0 Write Output ---------------------------------------------------
dir.create( file.path("outputs", oFolder))
write.csv2(uniqueFields$Indicator_Names, 
           file = file.path("outputs", oFolder, "Indicator_Names.csv"),
           quote = F, row.names = F)

## 4.0 Tidy Up --------------------------------------------------------
time$total <- Sys.time() - time$start
time