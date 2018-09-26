## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  fig.width=8.5, 
  fig.height=5.5,
  comment = "#>"
)

## ----LoadPackages, include = FALSE---------------------------------------
library(raster)
library(diffeR)
library(intensity.analysis)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Read the raster files from example data.
raster_1985 <- raster(system.file("external/p_landuse7_1985_01.rst", package="intensity.analysis"))
raster_1991 <- raster(system.file("external/p_landuse7_1991_01.rst", package="intensity.analysis"))
raster_1999 <- raster(system.file("external/p_landuse7_1999_01.rst", package="intensity.analysis"))

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Make a list of raster objects.
raster.layers <- list(raster_1985, raster_1991, raster_1999)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# character vector of time points.
time.points <- c("1985","1991","1999")

# character vector of land categories.
categories <- c("Built","Agriculture","Range", "Forest", "Water", "Wetland", "Barren")

# Calling crosstabulation function.
crosstabulation <- multicrosstab(raster.layers, time.points, categories)
crosstabulation

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Calling IIA(Interval Intensity Analysis) function.
IIA.output <- IIA(crosstabulation, time.points)

## ---- eval=TRUE, echo=FALSE, warning=FALSE-------------------------------
IIA.output

## ---- eval=FALSE, echo=TRUE, warning=FALSE-------------------------------
#  # Define a variable with the direction to store the csv results.
#  path <- "C:/AnalysisResults"
#  IIA2csv(IIA.output, path)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Calling CIA(Category Intensity Analysis) function.
CIA.output <- CIA(crosstabulation, time.points, categories)

## ---- eval=TRUE, echo=FALSE, warning=FALSE-------------------------------
CIA.output

## ---- eval=FALSE, echo=TRUE, warning=FALSE-------------------------------
#  # Define a variable with the direction to store the csv results.
#  path <- "C:/AnalysisResults"
#  CIA2csv(CIA.output, path)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Calling TIA(Transition Intensity Analysis) function.
TIA.output <- TIA(crosstabulation, time.points, categories)

## ---- eval=TRUE, echo=FALSE, warning=FALSE-------------------------------
TIA.output

## ---- eval=FALSE, echo=TRUE, warning=FALSE-------------------------------
#  # Define a variable with the direction to store the csv results.
#  path <- "C:/AnalysisResults"
#  TIA2csv(TIA.output, path)

