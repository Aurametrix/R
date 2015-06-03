metabnet <-
function(feature_table_file,target.metab.file,sig.metab.file,class_labels_file=NA,parentoutput_dir,num_replicates=1,cor.method="pearson",abs.cor.thresh=0.4,cor.fdrthresh=0.05,
cor.fdrmethod="BH",
target.mzmatch.diff=10,target.rtmatch.diff=NA,max.cor.num=200,summarize.replicates=TRUE,summary.method="median",all.missing.thresh=0.8, group.missing.thresh=NA,
log2transform=TRUE,medcenter=TRUE,znormtransform=FALSE,quantile_norm=TRUE,lowess_norm=FALSE,madscaling=FALSE,missing.val=0, networktype="complete", samplermindex=NA,
rep.max.missing.thresh=0.3,summary.na.replacement="zeros",net_node_colors=c("pink","skyblue"),net_node_shapes=c("rectangle","circle"),net_edge_colors,net_legend=FALSE,netrandseed=555, num_nodes=2){

		options(warn=-1)
		
		allowWGCNAThreads(nThreads = num_nodes)

		data_matrix<-data_preprocess(Xmat=NA,Ymat=NA,feature_table_file,parentoutput_dir,class_labels_file,num_replicates=num_replicates,feat.filt.thresh=NA,summarize.replicates,summary.method, all.missing.thresh, group.missing.thresh,
log2transform,medcenter,znormtransform,quantile_norm,lowess_norm,madscaling,missing.val, samplermindex,rep.max.missing.thresh,summary.na.replacement)

	data_matrix<-data_matrix$data_matrix_afternorm_scaling
	

		dir.create(parentoutput_dir)
		setwd(parentoutput_dir)
		
	data_m<-data_matrix[,-c(1:2)]

	if(is.na(sig.metab.file)==FALSE){
						goodfeats<-read.table(sig.metab.file,sep="\t",header=TRUE)
			}else{
		goodfeats<-data_matrix
		}
		
	
	if(is.na(target.metab.file)==FALSE){
	dataA<-read.table(target.metab.file,sep="\t",header=TRUE)
	
	dataA<-as.data.frame(dataA)
	outloc<-paste(parentoutput_dir,"/Stage2","/",sep="")
	dir.create(outloc)
	print(paste("Searching for features matching the target list",sep=""))
	
	g1<-getVenn(dataA=dataA,name_a="TargetSet",name_b="ExperimentalSet",dataB=data_matrix[,c(1:2)],mz.thresh=target.mzmatch.diff,time.thresh=target.rtmatch.diff,
	xMSanalyzer.outloc=outloc,alignment.tool=NA,plotvenn=FALSE)

	if(length(g1$common)>1){
	
	if(is.na(sig.metab.file)==FALSE){
	com_mzs<-find.Overlapping.mzs(dataA=data_matrix,dataB=goodfeats,mz.thresh=target.mzmatch.diff,time.thresh=target.rtmatch.diff,alignment.tool=NA)
	
	sigfeats.index<-com_mzs$index.A #which(data_matrix$mz%in%goodfeats$mz)
	print(paste(length(unique(sigfeats.index))," features matched the significant features list",sep=""))
	

	}else{
		sigfeats.index<-NA #seq(1,dim(data_matrix)[1])
		#sigfeats.index<-seq(1,50)
		
		}
	
	print(paste(length(unique(g1$common$index.B))," features matched the target list",sep=""))
	
		print(paste("Generating targeted network",sep=""))
	

	if(networktype=="complete")
	{
		targetedan_fdr<-do_cor(data_matrix,subindex=sigfeats.index,targetindex=g1$common$index.B,outloc,networktype="complete",networkscope="targeted",cor.method,
		abs.cor.thresh,cor.fdrthresh,cor.fdrmethod,max.cor.num,net_node_colors,net_node_shapes,net_edge_colors,net_legend,netrandseed=netrandseed)
	}else{
		if(networktype=="partial"){
		targetedan_fdr<-do_cor(data_matrix,subindex=sigfeats.index,targetindex=g1$common$index.B,outloc,networktype="partial",networkscope="targeted",cor.method,
		abs.cor.thresh,cor.fdrthresh,cor.fdrmethod,max.cor.num,net_node_colors,net_node_shapes,net_edge_colors,net_legend,netrandseed=netrandseed)
		}else{
			print("Invalid option. Please use complete or partial.")
		}
	}
	}else{
		print(paste("Targeted m/z features were not found.",sep=""))
	}
	}else{
		
		outloc<-paste(parentoutput_dir,"/Stage2","/",sep="")
		dir.create(outloc)
		
			if(is.na(sig.metab.file)==FALSE){
			com_mzs<-find.Overlapping.mzs(dataA=data_matrix,dataB=goodfeats,mz.thresh=target.mzmatch.diff,time.thresh=target.rtmatch.diff,alignment.tool=NA)
	
			sigfeats.index<-com_mzs$index.A #which(data_matrix$mz%in%goodfeats$mz)
	}else{
			sigfeats.index<-NA 
		}
		
		if(networktype=="complete"){
		
	targetedan_fdr<-do_cor(data_matrix,subindex=sigfeats.index,targetindex=NA,outloc,networktype="complete",networkscope="global",cor.method,abs.cor.thresh,cor.fdrthresh,
	cor.fdrmethod,max.cor.num,net_node_colors,net_node_shapes,net_edge_colors,net_legend,netrandseed=netrandseed)

	}else{
	if(networktype=="partial"){
        targetedan_fdr<-do_cor(data_matrix,subindex=sigfeats.index,targetindex=NA,outloc,networktype="partial",networkscope="targeted",cor.method,
        abs.cor.thresh,cor.fdrthresh,cor.fdrmethod,max.cor.num,net_node_colors,net_node_shapes,net_edge_colors,net_legend,netrandseed=netrandseed)
	
	}else{
		print("Invalid option")
	}
	}
			
		}
		
		targetedan_fdr<-as.data.frame(targetedan_fdr)
           
		print("Processing complete.")
		return(targetedan_fdr)
}
