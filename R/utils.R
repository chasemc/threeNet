
#'Convert igraph to JSON
#'
#'@param ... igraph object
#'
#'@source A direct import of \code{igraph_to_networkD3} from JJ Allaire, Peter
#'  Ellis, Christopher Gandrud, Kevin Kuo, B.W. Lewis, Jonathon Owen, Kenton
#'  Russell, Jennifer Rogers, Charles Sese, CJ Yetman (2015). \link{networkD3}:
#'  D3 JavaScript Network Graphs from R
#'
#'@export


igraph_to_networkD3 <- function(edges,
                                nodes,
                                group,
                                what = 'both') {


  links <- igraph::graph_from_data_frame(edges)


  links <- igraph::as_data_frame(links)
  colnames(links)[1:2] <- c("source","target")
 links <- list(links = links)

 nodes <- list(nodes = cbind.data.frame(lapply(nodes, as.vector), stringsAsFactors = FALSE))

 return(c(links, nodes))

}
