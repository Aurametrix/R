# generate random graph
numnodes <- 50
the.graph <- grg.game(numnodes, 0.3)

V(the.graph)$visited <- 0
graph.degree <- degree(the.graph)


# define maximum vertex and a random vertex
# randomly repick the vertex until it is connected to and is not the maximum degree vertex. 
maxvertex <- sample(which(graph.degree == max(graph.degree)),1)
randvertex <- as.integer(sample(V(the.graph),1))
while((randvertex == maxvertex) ||
      (shortest.paths(the.graph,maxvertex,randvertex) == Inf)) {
  randvertex <- sample(V(the.graph),1)
}

# keeping track of where in the graph
curpos <- c(maxvertex, randvertex)
for(num in curpos) V(the.graph)[num]$visited <- 1

# next cycle
maxloops = length(V(the.graph))
curloop = 0
while((curloop < maxloops) && (length(curpos)>0) &&
      (sum(V(the.graph)$visited) < numnodes)) {
  nextpos <- c()
  while(length(curpos)>0) {
    curnode <- curpos[1]
    curpos <- curpos[-1]

    adjnodes <- which(the.graph[curnode] == 1)
    for(adjnode in adjnodes) {
      if(!V(the.graph)[adjnode]$visited) {
        nextpos <- c(nextpos,adjnode)
        V(the.graph)[adjnode]$visited <- 1
      }
    }
  }
  curpos <- nextpos
  curloop <- curloop + 1
}

# print the number of iterations it took to traverse the graph
print(curloop)
if(sum(V(the.graph)$visited) < numnodes) print("Not a connected graph.")
