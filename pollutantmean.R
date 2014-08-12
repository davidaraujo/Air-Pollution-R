pollutantmean <- function(directory, pollutant, id) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  totalMeans <- {}
  
  for (i in id) {
    i <- sprintf("%03d", i)
    file <- paste(directory, "/",i,".csv",sep="")
    monitor <- read.csv(file)
    measure <- monitor[pollutant]
    measure <- na.omit(measure)
    measure <- as.matrix(measure)
    totalMeans <- c(totalMeans, measure)
  }
  
  #print(totalMeans)
  #totalMeans <- as.matrix(totalMeans)
  #print(totalMeans)
  totalMeans <- na.omit(totalMeans)
  result <- round(mean(totalMeans),digits=3)
  
  return(result)
}