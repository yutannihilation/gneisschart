#' Draw A Chart As Quartz Does
#' 
#' Draw a chart by Gneisschart from data.frame.
#' 
#' @param data        data.frame
#' @param label       column name of labels
#' @param type        chart type(s). \code{"line"}, \code{"column"}, \code{"bargrid"} or \code{"scatter"}
#' @param title       title of the graph
#' @param credit      credit of the graph (e.g. "Made with Gneisschart")
#' @param data_source source of the data (Something like "Data: Bureau of Labor Statistics"
#'                    or "Data compiled by Factset")
#' @param y_ticks     number of ticks of y-axis
#' @param y_prefix    prefix unit of y-axis (e.g. $)
#' @param y_suffix    suffix unit of y-axis (e.g. k)
#' @param y_limits    lower and upper limits of y-axis (if not specified, this will be automatically
#'                    calculated)
#' @param width       width of the graph
#' @param height      height of the graph
#' 
#' @examples
#' a <- data.frame(
#'   names          = c("apples", "oranges"),
#'   juicyness      = c(5.5, 23),
#'   color          = c(10.2, 10),
#'   favor          = c(6.1, 13),
#'   travelablility = c(3.8, 7),
#'   stringsAsFactors = FALSE
#' )
#' 
#' gneiss(a, label = "names")
#' 
#' gneiss(a, label = "names", type = "column", credit = "Made w/o Chartbuilder")
#' 
#' gneiss(a, label = "names", type = c("line","column"), title = "This is the very example chart!")
#'
#' @export
gneiss <- function(data, label, type = "line",
                   title = "", credit = "Made with Gneisschart", data_source = "",
                   y_ticks = 4, y_prefix = "", y_suffix = "",
                   y_limits = NULL, width = NULL, height = NULL) {
  x <- df_to_gneiss(data, label, type, data_source)
  
  x$title  <- title
  x$credit <- credit
  x$data_source <- data_source
  x$y_ticks  <- y_ticks
  x$y_prefix <- y_prefix
  x$y_suffix <- y_suffix
  
  if(!is.null(y_limits)) x$y_limits <- y_limits

  # create widget
  htmlwidgets::createWidget(
    name = 'gneiss',
    x,
    width = width,
    height = height,
    package = 'gneisschart'
  )
}

#' Widget output function for use in Shiny
#'
#' @export
gneissOutput <- function(outputId, width = '100%', height = '400px'){
  shinyWidgetOutput(outputId, 'gneiss', width, height, package = 'gneisschart')
}

#' Widget render function for use in Shiny
#'
#' @export
renderGneiss <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  shinyRenderWidget(expr, gneissOutput, env, quoted = TRUE)
}
