## doMPI package
## to perform 100 factorizations using hybrid parallel
## computation on 4 quadri-core machines – making use of all the cores computation on each machine.

# file: mpi.R
## 0. Create and register an MPI cluster
library(doMPI)
cl <- startMPIcluster()
registerDoMPI(cl)
library(NMF)
# run on all workers using the current parallel backend
data(esGolub)
res <- nmf(esGolub, 3, "brunet", nrun = n, .opt = "p", .pbackend = NULL)

# save result
save(res, file = "result.RData")
## 4. Shutdown the cluster and quit MPI
closeCluster(cl)
mpi.quit()

### Passing the following shell script to qsub should launch the execution on a Sun Grid Engine
### HPC cluster, with OpenMPI. Some adaptation might be necessary for other queueing systems/installations.

###   #!/bin/bash
###   #$ -cwd
###   #$ -q opteron.q
###   #$ -pe mpich_4cpu 16
###   echo "Got $NSLOTS slots. $TMP/machines"
###   orterun -v -n $NSLOTS -hostfile $TMP/machines R --slave -f mpi.R
