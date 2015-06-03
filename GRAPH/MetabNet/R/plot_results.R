plot_results <-
function(dataA,colind,fdrthresh){
							
							pdf("Manhattan_plots.pdf")
							fdr_adjust_pvalue<-dataA$fdr_adjust_pvalue
	
                            print(head(dataA))
							pvalue<-dataA$pvalue
							  
							sel.diffdrthresh<-fdr_adjust_pvalue<fdrthresh	
	
							   goodip<-which(sel.diffdrthresh==TRUE)
							
							   logp<-(-1)*log((pvalue+(10^-20)),10)
								
							#	tiff("pval_dist.tiff",width=plots.width,height=plots.height,res=plots.res, compression="lzw")
								#hist(d4[,1],xlab="p",main="Distribution of p-values")
							#	dev.off()
								
									if(length(goodip)>0)
										{
							#	tiff("manhattanplot.tiff",width=plots.width,height=plots.height,res=plots.res, compression="lzw")
																
								plot(dataA$mz,logp,xaxt="n",ylab="-logP",xlab="m/z",xaxt="n",yaxt="n",cex=0.3,cex.main=0.8,main="Type 1 manhattan plot (-logp vs m/z) \n m/z features above the dashed horizontal line are significant after FDR adjustment")
								axis(1, at=seq(50 , 2000, by=150) , las=2)
								axis(2, at=seq(0 , (max(logp)+1), by=1) , las=2)
								col_seq<-c("brown","red","orange","coral","pink","skyblue","blue","darkblue","purple","violet")
								
								s1<-seq(200,2000,200)
								points(dataA$mz[which(dataA$mz>=0 & dataA$mz<=200)],logp[which(dataA$mz>=0 & dataA$mz<=200)],col="brown",cex=0.3)
								for(i in 1:(length(s1)-1))
								{
									points(dataA$mz[which(dataA$mz>s1[i] & dataA$mz<=s1[i+1])],logp[which(dataA$mz>s1[i] & dataA$mz<=s1[i+1])],col=col_seq[i+1],cex=0.3)
								}
								
								
								for(i in goodip){points(dataA$mz[i],logp[i],col="darkgreen",cex=0.3);points(dataA$mz[i],logp[i],col="darkgreen",cex=0.6)}

								if(length(goodip)>0){
								hfdrfdrthresh<-logp[which(logp==min(logp[which(fdr_adjust_pvalue<fdrthresh)],na.rm=TRUE))]
								
								abline(h=hfdrfdrthresh,col=4,lty=2)
								}
								#legend("topright",legend=c("85-200","201-400","401-600","601-800", "801-1000", "1001-1200","1201-1400","1401-1600","1601-1800","1801-2000"),text.col=col_seq,cex=0.4,
								#title = "m/z range")
								#dev.off()
								
								dataA$time<-round(dataA$time)
								max_time<-ceiling(max(dataA$time))
								mod_num<-round(max_time)%%10
								add_num<-10-mod_num
								
								max_time<-max_time+add_num
								
								dataA$time<-ceiling(dataA$time)
								
								
								plot(dataA$time,logp,xaxt="n",ylab="-logP",xlab="time",xaxt="n",yaxt="n",cex=0.3,cex.main=0.8,main="Type 2 manhattan plot (-logp vs time) \n m/z features above the dashed horizontal line are significant after FDR adjustment")
								axis(1, at=seq(0 , max_time, by=(max_time/10)) , las=2)
								axis(2, at=seq(0 , (max(logp)+1), by=1) , las=2)
								col_seq<-c("brown","red","orange","coral","pink","skyblue","blue","darkblue","purple","violet")
								
								s1<-seq((max_time/10) , max_time, by=(max_time/10))
								points(dataA$time[which(dataA$time>=0 & dataA$time<=(max_time/10))],logp[which(dataA$time>=0 & dataA$time<=(max_time/10))],col="brown",cex=0.3)
								for(i in 1:(length(s1)-1))
								{
									points(dataA$time[which(dataA$time>s1[i] & dataA$time<=s1[i+1])],logp[which(dataA$time>s1[i] & dataA$time<=s1[i+1])],col=col_seq[i+1],cex=0.3)
								}
								
								
								for(i in goodip){points(dataA$time[i],logp[i],col="darkgreen",cex=0.3);points(dataA$time[i],logp[i],col="darkgreen",cex=0.6)}

								if(length(goodip)>0){
								hfdrfdrthresh<-logp[which(logp==min(logp[which(fdr_adjust_pvalue<fdrthresh)],na.rm=TRUE))]
								
								abline(h=hfdrfdrthresh,col=4,lty=2)
								}
								#legend("topright",legend=c("85-200","201-400","401-600","601-800", "801-1000", "1001-1200","1201-1400","1401-1600","1601-1800","1801-2000"),text.col=col_seq,cex=0.4,
								#title = "m/z range")
								#dev.off()
								

								
								}
								
								hist(dataA[,1],xlab="p",main="Distribution of p-values")
								
								dev.off()
	
}
