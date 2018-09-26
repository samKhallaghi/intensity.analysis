#' Generate crosstabulation table(s)
#' @details Read categorical raster objects, checks their dimentionality, resolution and extent are a perfect match. Then the function returns a list consist of a crosstabulation table for each consequtive pair of raster layers.
#' @param raster.layers List of raster objects.
#' @param time.points a charachter vector showing the time point of each raster layer in chronological order.
#' @param categories A charachter vector showing the categories in the map. Order of categories decided bases on the equivalent IDs in the raster attribute table.
#' @return The output is a list of crosstabulation table(s). The length of the list is equal to the number of intervals.
#' @importFrom diffeR crosstabm
#' @export

multicrosstab <- function(raster.layers, time.points, categories){

  # list of crosstabulation matrices
  crosstabulation <- list()

  if ((length(time.points) > 1 && length(raster.layers) > 1 ) && (length(time.points) = length(raster.layers))){
    ras.extent <- extent(raster.layers[[1]])
    x.cell.size <- res(raster.layers[[1]])[1]
    y.cell.size <- res(raster.layers[[1]])[2]
    number.of.columns <- ncol(raster.layers[[1]])
    number.of.rows <- nrow(raster.layers[[1]])
    for (layer in raster.layers){
      if (extent(layer) != ras.extent){
        stop("Extent of raster layers are not a perfect match.")
      } else if ((res(layer)[1] != x.cell.size) | (res(layer)[2] != y.cell.size)){
        stop("Resolution of raster layers are not a perfect match.")
      } else if ((ncol(layer) != number.of.columns) || (nrow(layer) != number.of.rows)){
        stop("number of rows and columns in raster layers are not a perfect match.")
      }
    }
    # Calculate the crosstabulation matrix for each pair of consequative time points
    j <- 1
    while (j < length(raster.layers)){
      crosstabulation[[j]] <- crosstabm(raster.layers[[j]], raster.layers[[j+1]])
      colnames(crosstabulation[[j]]) <- paste(categories)
      rownames(crosstabulation[[j]]) <- paste(categories)
      j <- j+1
    }
    return(crosstabulation)
  } else{
    print("You need at least two time points and the number of time points and raster layers must be a perfect match.")
  }
}
