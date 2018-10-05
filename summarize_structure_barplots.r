summarize_structure_barplot<-function(qmatrix, k, iter=3, population_info=TRUE, color="default", first_data_col=4, bar_space=0, print_matrix=TRUE) {
	# set colors if not specified. Otherwise, a vector with k colors needs to be supplied manually
	if(color=="default") { palette(rainbow(k)); color=palette() }
	
	#calculate average inferred memebership across all iterations
	avg_inf<-data.frame(matrix(nrow=nrow(qmatrix),ncol=k))
	for(i in 0:(k-1)) { avg_inf[,(i+1)]=rowMeans(qmatrix[,(first_data_col+(i*iter)):(first_data_col+(i*iter)+(iter-1))]) }
	
	#draw plot
	bars<-barplot(t(as.matrix(avg_inf)), col=color, beside=FALSE, border=NA, space=bar_space)
	# if there is a column "population" with population or sample location names, this will be included on the x-axis if population_info = TRUE
	if(population_info==TRUE) {
		positions<-c()
		for(pop in levels(qmatrix$population)) { positions<-c(positions,floor(median(which(qmatrix$population == pop))))}
		}
	axis(1, at=bars[positions], labels=levels(qmatrix$population), cex.axis=0.5)
	
	# if output of the data frame is required per print_matrix=TRUE
	if(print_matrix==TRUE){return(cbind(qmatrix[,1:(first_data_col-1)],avg_inf)) }
	}
