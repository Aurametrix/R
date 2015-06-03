do_cor <-
function(data_m_fc_withfeats,subindex=NA,targetindex=NA,outloc,networktype,networkscope,cor.method,abs.cor.thresh,cor.fdrthresh,cor.fdrmethod="BH",
max.cor.num,net_node_colors,net_node_shapes,net_edge_colors,net_legend,netrandseed=555,num_nodes=6, plots.width=2000,plots.height=2000,plots.res=300){
    Sys.sleep(0.2)
    dir.create(outloc)
    setwd(outloc)
    allsig_pcornetwork<-{}
    cormat<-{}
    
    
    
    
    allsig_pcornetwork_fdr0.05<-{}
    
    
    
    if(dim(data_m_fc_withfeats)[1]>1)
    {
        
        if(networktype=="partial"){
            pearson_res<-get_partial_cormat(data_m_fc_withfeats, cor.method=cor.method)
        }else{
             if(networktype=="complete"){
            
                    pearson_res<-get_full_cormat(data_m_fc_withfeats, cor.method=cor.method)
             }
        }
        rownames(pearson_res)<-paste(as.character(data_m_fc_withfeats$mz),as.character(data_m_fc_withfeats$time),sep="_")
        colnames(pearson_res)<-paste(as.character(data_m_fc_withfeats$mz),as.character(data_m_fc_withfeats$time),sep="_")
        
        pearson_res<-round(pearson_res,2)
       
       min_cor<-min(pearson_res,na.rm=TRUE)
       max_cor<-max(pearson_res,na.rm=TRUE)
       
       if(min_cor<(-1) || max_cor>1)
       {
           
           stop("Error calculating correlations. Please check for missing values.")
       }
       #print(dim(pearson_res))
       #print(pearson_res[1:3,1:5])
        #cor_res<-pearson_res
        
        #significant features; X
        if(is.na(subindex[1])==FALSE){
            goodfeats<-data_m_fc_withfeats[subindex,]
            
           
                pearson_res<-pearson_res[subindex,]
            
            
        }else{
            goodfeats<-data_m_fc_withfeats
            
        }
        
        #targeted features; Y
        if(is.na(targetindex[1])==FALSE){
            data_m_fc_withfeats<-data_m_fc_withfeats[targetindex,]
            #if(networktype=="partial")
            {
                pearson_res<-pearson_res[,targetindex]
            }
            
        }else{
            
            if(is.na(subindex[1])==FALSE){
                data_m_fc_withfeats<-data_m_fc_withfeats[-subindex,]
  
                                    pearson_res<-pearson_res[,-c(subindex)]
                
            }
        }
        
        if(FALSE){
        
        if(is.na(subindex[1])==TRUE && is.na(targetindex[1])==TRUE){
            
            stop("Both targeted features and significant features arguments can not be left empty.")
        }
        }
        
        m1<-apply(data_m_fc_withfeats[,-c(1:2)],2,as.numeric)
        #print(dim(m1))
        rnames<-paste("mzid_",seq(1,dim(data_m_fc_withfeats)[1]),sep="")
        
        
        rownames(m1)=rnames
        
        data_mt<-t(m1)
    }else{
        m1<-as.numeric(data_m_fc_withfeats[,-c(1:2)])
        #print(dim(m1))
        #rownames(m1)=rnames
        data_mt<-(m1)
        
        data_mt<-as.matrix(data_mt)
        
    }
    
    #listf<-list.files(".","*.txt",recursive=TRUE)
    #for(l1 in listf){pmattemp<-read.table(l1,sep="\t",header=TRUE); cormat<-cbind(cormat,pmattemp[,3])}
    goodfeats_inf<-as.data.frame(goodfeats[,c(1:2)])
    
   
    goodfeats<-as.data.frame(goodfeats)
    
    complete_pearsonpvalue_mat<-{}
    complete_pearsonqvalue_mat<-{}
    l1<-list.files(".")
    
   
    		 cl<-makeCluster(10)
    
           clusterExport(cl, "getCorchild")
           clusterEvalQ(cl,library(WGCNA))
           
           
    #print(dim(pearson_res))
    
    
    num_samp<-dim(data_mt)[1]
    
    #print("Dimension of correlation matrix")
    #print(dim(pearson_res))
    #print(pearson_res)
    #  stopCluster(cl)
    pearson_resmat<-{}
    
    # print("done")
    
    pearson_resvec<-as.vector(pearson_res)
    
    pearson_pvalue<-parLapply(cl,1:length(pearson_resvec),getcorpvalue, pearson_resvec=pearson_resvec,num_samp=num_samp)
    stopCluster(cl)
   
    complete_pearsonpvalue_mat<-unlist(pearson_pvalue)
    dim(complete_pearsonpvalue_mat)<-dim(pearson_res)
    
    cormat<-pearson_res
    
    pearson_Res_all<-{}
    
    
    #print("here 3")
		  # print(head(cormat))
          #print(dim(cormat[[1]]))
          
          #cormat<-t(cormat)
          cormat<-as.data.frame(cormat)
          cormat<-as.matrix(cormat)
          
          #print(dim(cormat))
          
          pearson_Res_all<-{}
          
          #complete_pearsonpvalue_mat<-t(complete_pearsonpvalue_mat)
          complete_pearsonpvalue_mat<-as.data.frame(complete_pearsonpvalue_mat)
          complete_pearsonpvalue_mat<-as.matrix(complete_pearsonpvalue_mat)
          
          
          complete_pearsonpvalue_mat<-t(complete_pearsonpvalue_mat)
          cormat<-t(cormat)
          
          #print(dim(cormat))
          #print(dim(complete_pearsonpvalue_mat))
          
          
          
          pearson_Res_all<-{}
          #complete_pearsonqvalue_mat<-sapply(1:length(pearson_res),function(j){pearson_Res_all<-rbind(pearson_Res_all,as.matrix(pearson_res[[j]]$complete_pearsonqvalue_mat))})
          
          if(FALSE){
              complete_pearsonqvalue_mat<-apply(complete_pearsonpvalue_mat,2,function(x){
                  
                  #p.adjust(x,method="BH")
                  
                  pdf("fdrtoolB.pdf")
                  
                  
                  fdr_adjust_pvalue<-fdrtool(x,statistic="pvalue",verbose=FALSE)
                  fdr_adjust_pvalue<-fdr_adjust_pvalue$qval
                  
                  dev.off()
                  return(fdr_adjust_pvalue)
              }
              
              )
          }
          
	  if(cor.fdrmethod=="Strimmer"){
          complete_pearsonqvalue_mat<-apply(cormat,2,function(x){
              
              #p.adjust(x,method="BH")
              #print(length(x))
              
              x<-as.numeric(x)
              pdf("fdrtoolB.pdf")
              
              fdr_adjust_pvalue<-try(fdrtool(x,statistic="correlation",verbose=FALSE),silent=TRUE)
              
              if(is(fdr_adjust_pvalue,"try-error")){
                  fdr_adjust_pvalue<-NA
              }else{
                  fdr_adjust_pvalue<-fdr_adjust_pvalue$qval
              }
              dev.off()
              return(fdr_adjust_pvalue)
          })
	  }else{
		if(cor.fdrmethod=="none"){
			complete_pearsonqvalue_mat<-complete_pearsonpvalue_mat
		}else{
		   complete_pearsonqvalue_mat<-apply(complete_pearsonpvalue_mat,2,function(x){

			fdr_adjust_pvalue<-p.adjust(x,method="BH")


			 return(fdr_adjust_pvalue)
		 })
		}
	  }
	  
          
          #print("dim of correlation qvalue matrix")
          #print(dim(complete_pearsonqvalue_mat))
          
          #complete_pearsonqvalue_mat<-t(complete_pearsonpvalue_mat)
          complete_pearsonqvalue_mat<-as.data.frame(complete_pearsonqvalue_mat)
          complete_pearsonqvalue_mat<-as.matrix(complete_pearsonqvalue_mat)
	 
	if(FALSE){ 
	  sum_check1<-apply(complete_pearsonqvalue_mat,1,function(x){sum(x,na.rm=TRUE)})
	  
	  
	  cormat<-cormat[-which(is.na(sum_check1)==TRUE),]
          
	 complete_pearsonpvalue_mat<- complete_pearsonpvalue_mat[-which(is.na(sum_check1)==TRUE),]
	  
	  complete_pearsonqvalue_mat<-complete_pearsonqvalue_mat[-which(is.na(sum_check1)==TRUE),]
	  
	  	  data_m_fc_withfeats<- data_m_fc_withfeats[-which(is.na(sum_check1)==TRUE),]
	  
	  sum_check1<-apply(complete_pearsonqvalue_mat,2,function(x){sum(x,na.rm=TRUE)})
	  
	  
	  cormat<-cormat[,-which(is.na(sum_check1)==TRUE)]
          
	   complete_pearsonpvalue_mat<-complete_pearsonpvalue_mat[,-which(is.na(sum_check1)==TRUE)]
	  
	  complete_pearsonqvalue_mat<-complete_pearsonqvalue_mat[,-which(is.na(sum_check1)==TRUE)]
	  
	  data_m_fc_withfeats<- data_m_fc_withfeats[,-which(is.na(sum_check1)==TRUE)]
	 
	  goodfeats<-goodfeats[,-which(is.na(sum_check1)==TRUE)]
 
	}

          setwd(outloc)
          
          
          goodfeats<-as.data.frame(goodfeats)
          #print(head(goodfeats))
          #	print("dim of cormat is")
          #	print(dim(cormat))
          #colnames(cormat)<-paste(as.character(goodfeats$mz),as.character(goodfeats$time),sep="_")
          
          #print(data_m_fc_withfeats[1:10,])
          
          data_m_fc_withfeats<-as.data.frame(data_m_fc_withfeats)
          
          
          
         
          
          
          # save(cormat,file="full_correlation.Rda")
          
        
          
          fname<-paste("correlation_matrix.txt",sep="")
          write.table(cormat,file=fname,sep="\t",row.names=TRUE)
          
          fname<-paste("correlation_pvalues.txt",sep="")
          write.table(complete_pearsonpvalue_mat,file=fname,sep="\t",row.names=TRUE)
          
          fname<-paste("correlation_FDR.txt",sep="")
          write.table(complete_pearsonqvalue_mat,file=fname,sep="\t",row.names=TRUE)
          
          
          
          
          #nonsig_vs_fdr0.05_pearson_mat<-
          nonsig_vs_fdr0.05_pearson_mat_bool<-cormat
          
          nonsig_vs_fdr0.05_pearson_mat_bool[complete_pearsonqvalue_mat>cor.fdrthresh]<-0
          
          cormat_abs<-abs(cormat)
          
          nonsig_vs_fdr0.05_pearson_mat_bool[cormat_abs<abs.cor.thresh]<-0
          
          rm(cormat_abs)
          
          sum_mat<-apply(nonsig_vs_fdr0.05_pearson_mat_bool,1,sum)
          
          bad_index<-which(sum_mat==0)
          
          
          
          nonsig_vs_fdr0.05_pearson_mat_bool_filt<-nonsig_vs_fdr0.05_pearson_mat_bool
          
          mz_index<-which(data_m_fc_withfeats$mz%in%goodfeats$mz)
          
          if(length(bad_index)>0){
              nonsig_vs_fdr0.05_pearson_mat_bool_filt<-nonsig_vs_fdr0.05_pearson_mat_bool[-bad_index,]
          }
          
          
          if(length(mz_index)==length(data_m_fc_withfeats$mz))
          {
              nonsig_vs_fdr0.05_pearson_mat_bool_filt[lower.tri(nonsig_vs_fdr0.05_pearson_mat_bool_filt)==TRUE]<-0
              diag(nonsig_vs_fdr0.05_pearson_mat_bool_filt)<-0
          }else{
              
              mz_index<-which(data_m_fc_withfeats$mz%in%goodfeats$mz)
              
              if(length(mz_index)>0){
                  nonsig_vs_fdr0.05_pearson_mat_bool_filt<-nonsig_vs_fdr0.05_pearson_mat_bool_filt[-mz_index,]
              }
              
          }
          
          nonsig_vs_fdr0.05_pearson_mat_bool_filt<-unique(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
          
          #print(length(nonsig_vs_fdr0.05_pearson_mat_bool_filt))
          #print(dim(nonsig_vs_fdr0.05_pearson_mat_bool))
          
          
          #>=dim(goodfeats)[1]
          if(length(nonsig_vs_fdr0.05_pearson_mat_bool_filt)>0){
              
              
              nonsig_vs_fdr0.05_pearson_mat_bool_filt_1<-as.data.frame(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
              
              if(length(nonsig_vs_fdr0.05_pearson_mat_bool_filt)>dim(nonsig_vs_fdr0.05_pearson_mat_bool_filt_1)[1] && (length(nonsig_vs_fdr0.05_pearson_mat_bool_filt)>1))
              #if((length(nonsig_vs_fdr0.05_pearson_mat_bool_filt)>1))
              {
                  
                  
                  
                  check_cor<-apply(abs(nonsig_vs_fdr0.05_pearson_mat_bool_filt),1,function(x){max(x,na.rm=TRUE)})
                  
                  nonsig_vs_fdr0.05_pearson_mat_bool_filt<-nonsig_vs_fdr0.05_pearson_mat_bool_filt[order(check_cor,decreasing=TRUE),]
                  
                  #print(head(nonsig_vs_fdr0.05_pearson_mat_bool_filt))
                  
		nonsig_vs_fdr0.05_pearson_mat_bool_filt<-replace(as.matrix(nonsig_vs_fdr0.05_pearson_mat_bool_filt),which(is.na(nonsig_vs_fdr0.05_pearson_mat_bool_filt)==TRUE),0)
                  #nonsig_vs_fdr0.05_pearson_mat_bool_filt<-na.omit(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  fname<-paste("significant_correlations_",networkscope,"_matrix_mzlabels.txt",sep="")
                  
                  write.table(nonsig_vs_fdr0.05_pearson_mat_bool_filt,file=fname,sep="\t",row.names=TRUE)
                  
                  
                  fname<-paste("significant_correlations_",networkscope,"CIRCOSformat_mzlabels.txt",sep="")
                  
                  
                  mz_rnames<-rownames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  mz_cnames<-colnames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  #rnames<-c("Data",rnames)
                  
                  circos_format<-abs(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  
                  #circos_format<-rbind(cnames,circos_format)
                  circos_format<-cbind(mz_rnames,circos_format)
                  
                  write.table(circos_format,file=fname,sep="\t",row.names=FALSE)
                  
                  
                  rnames<-mz_rnames
                  cnames<-mz_cnames
                  
                  cnames<-seq(1,length(cnames))
                  rnames<-seq(1,length(rnames))
                  
                  
                  #nonsig_vs_fdr0.05_pearson_mat_bool_filt<-nonsig_vs_fdr0.05_pearson_mat_bool_filt[-which(duplicated(rnames)==TRUE),]
                  #rnames<-rnames[-which(duplicated(rnames)==TRUE)]
                  
                  
                  
                  #rnames<-rownames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  #cnames<-colnames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  #cnames<-round(as.numeric(cnames),5)
                  #rnames<-round(as.numeric(rnames),5)
          
          #print(dim(nonsig_vs_fdr0.05_pearson_mat_bool_filt))
          #print(length(cnames))
          #print(length(rnames))
                  
                  colnames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)<-paste("Y",cnames,sep="")
                  rownames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)<-paste("X",rnames,sep="")
                  
                  fname<-paste("significant_correlations_",networkscope,"_matrix_rowcolnumlabels.txt",sep="")
                  
                  write.table(nonsig_vs_fdr0.05_pearson_mat_bool_filt,file=fname,sep="\t",row.names=TRUE)
                  
                  circos_format<-abs(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  
                  #circos_format<-rbind(cnames,circos_format)
                  
                  #circos_format<-cbind(rnames,circos_format)
                  # fname<-paste("significant_correlations_",networkscope,"CIRCOSformat_rowcolnumlabels.txt",sep="")
                  #write.table(circos_format,file=fname,sep="\t",row.names=FALSE)
                  
                  
                  if(length(which(check_cor>=abs.cor.thresh))>0){
                      
                      
                      if(is.na(max.cor.num)==FALSE){
                          
                          if(max.cor.num>dim(nonsig_vs_fdr0.05_pearson_mat_bool_filt)[1]){
                              max.cor.num<-dim(nonsig_vs_fdr0.05_pearson_mat_bool_filt)[1]
                          }
                          nonsig_vs_fdr0.05_pearson_mat_bool_filt<-nonsig_vs_fdr0.05_pearson_mat_bool_filt[1:max.cor.num,]
                          
                          mz_rnames<-mz_rnames[1:max.cor.num]
                          rnames<-rnames[1:max.cor.num]
                      }
                      
                      
                      #colnames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)<-paste("Y",seq(1,dim(nonsig_vs_fdr0.05_pearson_mat_bool_filt)[2]),sep="")
                      #rownames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)<-paste("X",seq(1,dim(nonsig_vs_fdr0.05_pearson_mat_bool_filt)[1]),sep="")
                      
                      
                      pdfname<-paste(networkscope,"network_plot.pdf",sep="")
                      pdf(pdfname,width=9,height=10)
                      #net_fname<-paste("network_maxcor",max.cor.num,"_rowcolnumlabels.tiff",sep="")
                      #tiff(net_fname, width=plots.width,height=plots.height,res=plots.res, compression="lzw")
                      #par_rows=1
                      #par(mfrow=c(par_rows,1))
                      
                      dup_ind<-which(duplicated(rnames)==TRUE)
                      if(length(dup_ind)>0){
                          nonsig_vs_fdr0.05_pearson_mat_bool_filt_1<-nonsig_vs_fdr0.05_pearson_mat_bool_filt[-which(duplicated(rnames)==TRUE),]
                          rnames<-rnames[-which(duplicated(rnames)==TRUE)]
                          mz_rnames<-mz_rnames[-which(duplicated(rnames)==TRUE)]
                          
                      }else{
                          nonsig_vs_fdr0.05_pearson_mat_bool_filt_1<-nonsig_vs_fdr0.05_pearson_mat_bool_filt
                      }
                      set.seed(netrandseed)
                      net_result<-network(mat=as.matrix(nonsig_vs_fdr0.05_pearson_mat_bool_filt_1), threshold=abs.cor.thresh,X.names = NULL, Y.names = NULL, keep.var = TRUE,color.node = net_node_colors,shape.node = net_node_shapes,
                      color.edge = net_edge_colors,lty.edge = c("solid", "solid"), lwd.edge = c(1, 1),show.edge.labels = FALSE, interactive = FALSE) #, keysize=0.7,alpha=0.5
                      cytoscape_fname<-paste("network_Cytoscape_format_maxcor",max.cor.num,"_rowcolnumlabels.gml",sep="")
                      write.graph(net_result$gR, file =cytoscape_fname, format = "gml")
                      #write.graph(net_result$gR, file = "network_cytoscape_format.gml", format = "gml")
                      
                      
                      #legend("bottomleft", l1, col = col,pch = pch, pt.cex = cex, title = "class #", cex=0.6)
                      #legend("bottomright",c("Row #","Colum #"),pch=c(22,19),col=net_node_colors, cex=0.7)
                      if(net_legend==TRUE){
                          legend("bottomright",c("Row #","Column #"),pch=c(22,19),col=net_node_colors, cex=0.9,title="Network legend:")
                      }
                      
                      #network(d3[1:4,1:10],cex=0.5,pt.cex=0.4,color.node=c("pink","skyblue"))
                      #dev.off()
                      
                      
                      
                      cnames<-round(as.numeric(mz_cnames),5)
                      rnames<-round(as.numeric(mz_rnames),5)
                      
                      
                      
                      colnames(nonsig_vs_fdr0.05_pearson_mat_bool_filt_1)<-paste("Y",mz_cnames,sep="")
                      rownames(nonsig_vs_fdr0.05_pearson_mat_bool_filt_1)<-paste("X",mz_rnames,sep="")
                      
                      #pdfname<-paste(networkscope,"network_plot.pdf",sep="")
                      #pdf(pdfname,width=9,height=10)
                      #pdf("network_plot_mzlabels.pdf")
                      #net_fname<-paste("network_maxcor",max.cor.num,"_mzlabels.tiff",sep="")
                      #tiff(net_fname, width=plots.width,height=plots.height,res=plots.res, compression="lzw")
                      set.seed(netrandseed)
                      net_result<-network(mat=as.matrix(nonsig_vs_fdr0.05_pearson_mat_bool_filt_1), threshold=abs.cor.thresh,X.names = NULL, Y.names = NULL, keep.var = TRUE,color.node = net_node_colors,shape.node = net_node_shapes,
                      color.edge = net_edge_colors,lty.edge = c("solid", "solid"), lwd.edge = c(1, 1),show.edge.labels = FALSE, interactive = FALSE)
                      
                      if(net_legend==TRUE){
                          legend("bottomright",c("Feautres in rows ","Feautres in columns "),pch=c(22,19),col=net_node_colors, cex=0.9,title="Network legend:")
                      }
                      
                      cytoscape_fname<-paste("network_Cytoscape_format_maxcor",max.cor.num,"_mzlabels.gml",sep="")
                      write.graph(net_result$gR, file =cytoscape_fname, format = "gml")
                      dev.off()
                      
                      
                  }else{
                      if(networkscope=="all"){
                          print(paste("Metabolome-wide correlation network can not be generated as the correlation threshold criteria is not met.",sep=""))
                      }else{
                          print(paste("Targeted correlation network can not be generated as the correlation threshold criteria is not met.",sep=""))
                      }
                      
                  }
                  
              }
              
          }else{
              if(length(nonsig_vs_fdr0.05_pearson_mat_bool_filt)==dim(goodfeats)[1]){
                  
                  #print("here")
                  
                  rnames<-rownames(nonsig_vs_fdr0.05_pearson_mat_bool)
                  rnames1<-rnames[-bad_index]
                  nonsig_vs_fdr0.05_pearson_mat_bool_filt<-as.matrix(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  nonsig_vs_fdr0.05_pearson_mat_bool_filt<-t(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  rownames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)<-as.character(rnames1)
                  check_cor<-max(abs(nonsig_vs_fdr0.05_pearson_mat_bool_filt))
                  
                  fname<-paste("significant_correlations_",networktype,"_mzlabels.txt",sep="")
                  
                  write.table(nonsig_vs_fdr0.05_pearson_mat_bool_filt,file=fname,sep="\t",row.names=TRUE)
                  
                  # fname<-paste("significant_correlations_",networktype,"CIRCOSformat_mzlabels.txt",sep="")
                  
                  mz_rnames<-rownames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  mz_cnames<-colnames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  #rnames<-c("Data",rnames)
                  
                  #circos_format<-abs(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  
                  #circos_format<-rbind(cnames,circos_format)
                  #circos_format<-cbind(rnames,circos_format)
                  
                  #write.table(circos_format,file=fname,sep="\t",row.names=FALSE)
                  
                  
                  #	print("here")
                  rnames<-mz_rnames
                  cnames<-mz_cnames
                  
                  #cnames<-round(as.numeric(cnames),5)
                  #rnames<-round(as.numeric(rnames),5)
                  
                  cnames<-seq(1,length(cnames))
                  rnames<-seq(1,length(rnames))
                  
                  colnames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)<-paste("Y",cnames,sep="")
                  rownames(nonsig_vs_fdr0.05_pearson_mat_bool_filt)<-paste("X",rnames,sep="")
                  
                  fname<-paste("significant_correlations_",networktype,"CIRCOS_format_rowcolnumlabels.txt",sep="")
                  
                  circos_format<-abs(nonsig_vs_fdr0.05_pearson_mat_bool_filt)
                  
                  #circos_format<-rbind(cnames,circos_format)
                  circos_format<-cbind(rnames,circos_format)
                  
                  write.table(circos_format,file=fname,sep="\t",row.names=FALSE)
                  
                  fname<-paste("significant_correlations_",networktype,"matrix_rowcolnumlabels.txt",sep="")
                  
                  write.table(nonsig_vs_fdr0.05_pearson_mat_bool_filt,file=fname,sep="\t",row.names=TRUE)
                  
                  if(check_cor>=abs.cor.thresh){
                      
                      
                      #pdf("network_plot.pdf",width=9,height=11)	
                      
                      pdfname<-paste(networkscope,"network_plot.pdf",sep="")
                      pdf(pdfname,width=9,height=10)
                      
                      #tiff("network_allrows_sigcols.tiff", width=plots.width,height=plots.height,res=plots.res, compression="lzw")
                      #par_rows=1
                      #par(mfrow=c(par_rows,1))
                      nonsig_vs_fdr0.05_pearson_mat_bool_filt_1<-nonsig_vs_fdr0.05_pearson_mat_bool_filt[-which(duplicated(rnames)==TRUE),]
                      set.seed(netrandseed)
                      net_result<-network(mat=as.matrix(nonsig_vs_fdr0.05_pearson_mat_bool_filt_1), threshold=abs.cor.thresh,X.names = NULL, Y.names = NULL, keep.var = TRUE,color.node = net_node_colors,shape.node = net_node_shapes,
                      color.edge = net_edge_colors,lty.edge = c("solid", "solid"), lwd.edge = c(1, 1),show.edge.labels = FALSE, interactive = FALSE)
                      if(net_legend==TRUE){
                          legend("bottomright",c("Row #","Column #"),pch=c(22,19),col=net_node_colors, cex=0.9,title="Network legend:")
                      }
                      #write.graph(net_result$gR, file = "network_cytoscape_format.gml", format = "gml")
                      
                      cytoscape_fname<-paste("network_Cytoscape_format_maxcor",max.cor.num,"_rowcolnumlabels.gml",sep="")
                      write.graph(net_result$gR, file =cytoscape_fname, format = "gml")
                      #dev.off()
                      
                      cnames<-round(as.numeric(mz_cnames),5)
                      rnames<-round(as.numeric(mz_rnames),5)
                      
                      
                      colnames(nonsig_vs_fdr0.05_pearson_mat_bool_filt_1)<-paste("Y",cnames,sep="")
                      rownames(nonsig_vs_fdr0.05_pearson_mat_bool_filt_1)<-paste("X",rnames,sep="")
                      net_fname<-paste("network_maxcor",max.cor.num,"_mzlabels.tiff",sep="")
                      #	tiff(net_fname, width=plots.width,height=plots.height,res=plots.res, compression="lzw")
                      set.seed(netrandseed)
                      net_result<-network(mat=as.matrix(nonsig_vs_fdr0.05_pearson_mat_bool_filt_1), threshold=abs.cor.thresh,X.names = NULL, Y.names = NULL, keep.var = TRUE,color.node = net_node_colors,shape.node = net_node_shapes,
                      color.edge = net_edge_colors,lty.edge = c("solid", "solid"), lwd.edge = c(1, 1),show.edge.labels = FALSE, interactive = FALSE)
                      
                      cytoscape_fname<-paste("network_Cytoscape_format_maxcor",max.cor.num,"_mzlabels.gml",sep="")
                      write.graph(net_result$gR, file =cytoscape_fname, format = "gml")
                      dev.off()
                      
                  }
                  
              }else{
                  print("No significant correlations found.")
              }
          }
          
	  
	 cur_date<-Sys.time()
	cur_date<-gsub(x=cur_date,pattern="-",replacement="")
	cur_date<-gsub(x=cur_date,pattern=":",replacement="")
	cur_date<-gsub(x=cur_date,pattern=" ",replacement="")
	fname<-paste("Analysis_",cur_date,".Rda",sep="")
	save(list=ls(),file=fname)
          final_net<-cbind(mz_rnames,nonsig_vs_fdr0.05_pearson_mat_bool_filt_1)
          return(final_net)
          
          
}
