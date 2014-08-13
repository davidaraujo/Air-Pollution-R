complete <- function(directory, id) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
 
  df <- data.frame(id=numeric(), nobs=numeric(), stringsAsFactors = FALSE)
  
  for (i in id) {
    n <- sprintf("%03d", i)
    file <- paste(directory, "/",n,".csv",sep="")
    monitor <- read.csv(file)
    monitor_clean <- na.omit(monitor)
    # diferent way: monitor_clean <- monitor[apply(monitor,1,function(x) !any(is.na(x))), ]
    nobs <- nrow(monitor_clean)
    df <- rbind(df,data.frame(id = i, nobs = nobs))
    }
  return(df)
}