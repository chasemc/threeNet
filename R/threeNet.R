#'Create 3D Network
#'
#'This is the main function for the package which takes a list of network data
#'(see example) and creates a 3D network in HTMl and JS, using "3d-force-graph"
#'
#'
#' @examples
#' bipartiteEdges <- data.frame(source = c("A","A","A", "B", "B","C", "B"),
#'                              target = c("B", "Oranges", "Apples", "Kiwis", "Bananas", "A", "A" ),
#'                              weight = c(10, 10, 10, 10, 10, 10, 10))
#'
#' bipartiteNodes <- data.frame(id = unique(c(as.vector(bipartiteEdges$source),
#'                                            as.vector(bipartiteEdges$target))),
#'                             colors = rainbow(7))
#'
#'
#' bipartite <- threeNet::igraph_to_networkD3(bipartiteEdges, bipartiteNodes)
#' # Format of input data:
#'bipartite
#'threeNet::threeNet(jsonlite::toJSON(bipartite))
#'@export
threeNet <- function(data,
                     width = NULL,
                     height = NULL,
                     elementId = NULL,
                     controlType = "trackball",
                     nodeColors = "#f7a440",
                     nodeSizes = 4,
                     nodeOpacity = 0.75,
                     nodeResolution = 8,
                     linkLabel = "",
                     linkVisibility = TRUE,
                     linkColor = "#ffffff",
                     linkWidth = 0) {

  # forward options using x
  x = list(
    data = data,
    controlType = controlType,
    nColor =  nodeColors,
    nsize = nodeSizes,
    nOpacity = nodeOpacity,
    nResolution = nodeResolution,
    lLabel = linkLabel,
    lVisibility = linkVisibility,
    lColor = linkColor,
    lWidth = linkWidth






  )

  # create widget
  htmlwidgets::createWidget(
    name = 'threeNet',
    x,
    width = width,
    height = height,
    package = 'threeNet',
    elementId = elementId
  )
}







#' Shiny bindings for threeNet
#'
#' Output and render functions for using threeNet within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a threeNet
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name threeNet-shiny
#'
#' @export
threeNetOutput <- function(outputId, width = '100%', height = '100%'){
  htmlwidgets::shinyWidgetOutput(outputId, 'threeNet', width, height, package = 'threeNet')
}

#' @rdname threeNet-shiny
#' @export
renderthreeNet <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, threeNetOutput, env, quoted = TRUE)
}
