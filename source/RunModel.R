RunModel = function(replicates, r, directory){ 
  #initialize variables
  maxage    = replicates$maxage[r]
  poptime       = replicates$poptime[r]
  k           = replicates$k[r]
  broodsize   = replicates$broodsize[r]
  reproductiveage    = replicates$reproductiveage[r]
  proportionfemale = replicates$proportionfemale[r]
  
  #initial pop
  # R is efficient at number and less with characters which is why we are using matrices
  
  pop= matrix(nrow= k ,ncol= 5)
  colnames(pop) <- c("id", "sex", "mom", "dad", "age")
  #its the name of the matrix then open square bracket colmn then rows
  pop[,1]= seq(1,100,1) #the id for each individual
  pop[,2:3]= 0 #mom and dad ID
  pop[,4] = sample(seq(0, maxage,1), k, replace=T)-1  #age added a -1 because in the begining 
  #...you can add other column for other species-specific characteristics you want to tr
  pop[,5] = sample(c(0,1), k, replace=T) #each individual assigned male(0) and female (1), replace = T because if it draws 1 it can draw a 1 and a 0 the next time 
  
  #first shot taking out the dead from the matrix
  
  for(y in 1:50){
    #dont forget the forward look squiggly
    #for for loop that is not replicated in 1 every 50 years
    dead<-sample(seq(1, nrow(pop), 1), 1, replace= F) #takin one out of how many number of rows  one time 
    #this spit out a new number that is the one that is being killed in the simulation
    
    pop<- pop[-dead,]
    
  }
  
  write.table(pop, paste(directory, "/output/testpop.txt", sep=""), sep="\t", col.names=F, row.names=F)
}
  