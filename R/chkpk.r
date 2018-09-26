chkpk <- function(list.of.packages = c("ggplot2", "diffeR", "raster", "reshape2") ){
# Check if the required packages are installed and load them
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
suppressWarnings(suppressMessages(lapply(list.of.packages, require, character.only = TRUE)))
}

