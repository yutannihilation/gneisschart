#' Convert data.frame to gneiss Format
#' 
#' @param data    data.frame
#' @param label   column name of labels
#' @param type    chart types
#' @param data_source source of the data
#' 
#' @seealso \link{gneiss}
#' 
#' @export
df_to_gneiss <- function(data, label, type, data_source){
  if(length(type) == 1) type <- rep(type, nrow(data))
  if(length(type) != nrow(data)) {
    stop ("length of type must be the same as the number of rows of the data.frame")
  }
    
  data_names       <- names(a)
  label_index    <- which(data_names == label)
  
  x_names        <- data_names[-label_index]
  label_names    <- unname(unlist(a[,  label_index]))
  values         <- a[, -label_index]
  
  if(!all(sapply(values, is.numeric))) {
    stop("All columns must be numeric, except for the label column.")
  }
  
  y_limits       <- c(min(values), max(values))
  
  series         <- lapply(1:nrow(values),
                           function(x) list(axis = 0, color = NULL,
                                            data = as.numeric(values[x, ]),
                                            name = label_names[x],
                                            source = data_source,
                                            type = type[x]))
  
  list(x_names  = x_names,
       y_limits = y_limits,
       series   = series)
}