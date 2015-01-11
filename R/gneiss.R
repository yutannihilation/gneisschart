#' Draw A Chart As Quartz Does
#'
#' An R interface to gneisschart
#'
#' @import htmlwidgets
#'
#' @export
gneiss <- function(x, label, type = "line", 
                   title = NULL, credit = "Gneisschart", data_source = NULL,
                   width = NULL, height = NULL) {

  # create widget
  htmlwidgets::createWidget(
    name = 'gneiss',
    df_to_gneiss(x, label, type, title, credit, data_source),
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
