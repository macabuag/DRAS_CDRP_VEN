# Title: OSM_Attribues
# By: Josh Macabuag (macabuag@gmail.com)
# Date: 15-Mar-2019
# Description: This script reads all OSM shapefiles in the shared Venezuela folder, 
#              extracts their attributes and lists all unique feature types.
# Naming Convention: 
#              variables: lowerCamelCase
#              datasets: UpperCamelCase

## 1.0 SET-UP ################################################################################################################
## Timer ##
time <- list()
time$start <- Sys.time()

## General Input Files ##
iFile <- list()
iFile$OSMfolder <- file.path("..", "..", "..", "Exposure", "OSM") #location of the files to be summarized

oFolder <- list()

## User Inputs ##

## Create Output Files ##
oFolder$R <- paste0(gsub("[[:punct:]]", " ", Sys.time()), "-ExpDat")  #create a unique folder with the run date

## Packages ##
if(!require("bit64")) {
  install.packages("bit64")
  library(bit64)
} #to read type 'integer64'

if(!require("data.table")) {
  install.packages("data.table")
  library(data.table)
}

# if(!require("dplyr")) {
#   install.packages("dplyr")
#   library(dplyr)
# } # data manipulation
# 
# if(!require("rgdal")) {
#   install.packages("rgdal")
#   library(rgdal)
# } # input/output, projections
# 
# if(!require("sp")) {
#   install.packages("sp")
#   library(sp)
# } # vector data
# 
# if(!require("rgeos")) {
#   install.packages("rgeos")
#   library(rgeos)
# } # geometry ops
# 
# if(!require("raster")) {
#   install.packages("raster")
#   library(raster)
# } # raster data




## 2.0 Read Folder -----------------------------------------------
OSMs <- list.files(iFile$OSMfolder, pattern = ".shp")
