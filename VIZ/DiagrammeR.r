###
# Create an empty graph
###

library(DiagrammeR)

# Create the graph object
graph <- create_graph()

# Get the class of the object
class(graph)
#> [1] "dgr_graph"

# It's an empty graph, so no NDF
# or EDF
get_node_df(graph)
#> NULL

get_edge_df(graph)
#> NULL

# By default, the graph is
# considered as directed
is_graph_directed(graph)
#> [1] TRUE
