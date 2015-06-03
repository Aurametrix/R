get_full_cormat <-
function(data_m_fc_withfeats,cor.method="pearson"){
	Sys.sleep(0.2)
	
	allsig_pcornetwork<-{}
	cormat<-{}

	allsig_pcornetwork_fdr0.05<-{}
	
	metab_names<-paste(data_m_fc_withfeats$mz,data_m_fc_withfeats$time,sep="_")
	rnames<-paste("mzid_",seq(1,dim(data_m_fc_withfeats)[1]),sep="")

	if(dim(data_m_fc_withfeats)[1]>1)
	{
	m1<-apply(data_m_fc_withfeats[,-c(1:2)],2,as.numeric)
	#print(dim(m1))

	rownames(m1)=rnames

	data_mt<-t(m1)
	}else{

	m1<-as.numeric(data_m_fc_withfeats[,-c(1:2)])
	#print(dim(m1))

	#rownames(m1)=rnames

	data_mt<-(m1)
	}
	data_mt<-as.matrix((data_mt))
	
	
    print(paste("Computing ",cor.method," correlation matrix",sep=""))
    
    if(cor.method=="pearson" || cor.method=="spearman"){
	cormat<-WGCNA::cor(data_mt,use="pairwise.complete.obs",method=cor.method)
    }else{
        
            check_NA<-length(which(is.na(data_mt)==TRUE))
            if(check_NA>0){
                stop("Missing values found. Please impute or remove features with missing values. Alternatively, you can use other correlation methods.")
            }else{
                cormat<-cor.shrink(data_mt)
            }
        
    }
	colnames(cormat)<-as.character(metab_names)
	rownames(cormat)<-as.character(metab_names)
		#save(cormat,file="full_correlation.Rda")
	
		return(cormat)
	}
