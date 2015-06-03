get_partial_cormat <-
function(data_m_fc_withfeats, cor.method="pearson"){
	
		setwd(outloc)
		
		
		data_m_fc_withfeats<-as.data.frame(data_m_fc_withfeats)
		
		
	check_NA<-length(which(is.na(data_m_fc_withfeats)==TRUE))
            if(check_NA>0){
                stop("Missing values found. Please impute or remove features with missing values. Alternatively, you can use other correlation methods.")
            }
		
        
		
		metab_names<-paste(data_m_fc_withfeats$mz,data_m_fc_withfeats$time,sep="_")
		
       
        cormat<-get_full_cormat(data_m_fc_withfeats,cor.method=cor.method)
		colnames(cormat)<-as.character(metab_names)
		rownames(cormat)<-as.character(metab_names)
        #fname<-paste("complete_correlation_matrix.txt",sep="")
		#write.table(cormat,file=fname,sep="\t",row.names=TRUE)
	
        cormat<-replace(as.matrix(cormat),which(is.na(cormat)==TRUE),0)
		
        cormat<-as.matrix(cormat)
        
        
            p1<-cor2pcor(cormat)
        
        
       
		colnames(p1)<-as.character(metab_names)
		rownames(p1)<-as.character(metab_names)
		
        #save(p1,file="partial_cor.Rda")
        #write.table(p1,file="partial_cor.txt",sep="\t",row.names=TRUE)
        colnames(p1)<-as.character(metab_names)
		rownames(p1)<-as.character(metab_names)
		
		
	
		return(p1)
	}
