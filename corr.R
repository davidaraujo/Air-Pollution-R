corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations

  files <- list.files(path=directory, pattern="*.csv", full.names=T, recursive=FALSE)
  vec <- c()
  
  lapply(files, function(x) {
    t <- read.csv(x) # load file
    # apply function
    collist <- c("nitrate", "sulfate")
    df_c <- t[complete.cases(t[collist]), collist]
    n <- nrow(as.matrix(df_c,na.rm=TRUE))
    
    if (n > threshold) {
      r <- cor(df_c['nitrate'],df_c['sulfate'], use = "complete.obs") 
      vec <<- c(vec, r)
    }
    })
  return(vec)
}