#' Convert data.frame to gneiss Format
#' 
#' @export
df_to_gneiss <- function(df, label, type, 
                         title, credit, data_source){
  if(length(type) == 1) type <- rep(type, nrow(df))
  if(length(type) != nrow(df)) {
    stop ("length of type must be the same as the number of rows of the data.frame")
  }
    
  df_names       <- names(a)
  label_index    <- which(df_names == label)
  
  x_names        <- df_names[-label_index]
  label_names    <- unname(unlist(a[,  label_index]))
  values         <- a[, -label_index]
  
  if(!all(sapply(values, is.numeric))) {
    stop("All columns must be numeric, except for the label column.")
  }
  
  ylim           <- c(min(values), max(values))
  
  series         <- lapply(1:nrow(values),
                           function(x) list(axis = 0, color = NULL,
                                            data = as.numeric(values[x, ]),
                                            name = label_names[x],
                                            source = data_source,
                                            type = type[x]))
  
  list(x_names = x_names,
       ylim    = ylim,
       series  = series,
       title   = title,
       credit  = credit,
       data_source = data_source)
}