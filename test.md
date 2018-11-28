---
title: "Untitled"
output: github_document
---

I


```{r}
bipartiteEdges <- data.frame(source = c("A","A","A", "B", "B","C", "B"),
                             target = c("B", "Oranges", "Apples", "Kiwis", "Bananas", "A", "A" ),
                             weight = c(10, 10, 10, 10, 10, 10, 10))

bipartiteNodes <- data.frame(id = unique(c(as.vector(bipartiteEdges$source),
                                           as.vector(bipartiteEdges$target))),
                            colors = rainbow(7))


bipartite <- threeNet::igraph_to_networkD3(bipartiteEdges, bipartiteNodes)
# Format of input data:
bipartite
threeNet::threeNet(jsonlite::toJSON(bipartite))
```

