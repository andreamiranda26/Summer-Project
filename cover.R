

#setup
setwd("~/GitHub/Summer-Project")   #set working directory
directory = getwd()
outdir    = paste(directory,"/output/",sep="")                                                    #directory to save model output  
source(paste(directory, "/source/FunctionSourcer.R", sep = ''))                                   #source functions and set source directory


#parameters
maxage = 3  #it is max age 3 plus one because they die after age 3 and after they reproduced #anything that makes it more generalizeable can be put as a parameter
k = 100 #population size which will fluctuate , around 100 with variance 
broodsize= 1  #the max amount of offsprings per pair
poptime= 50 #we want the population to exist for 50 years 
proportionfemale= 0.5 #female and male ratio something like that
reproductiveage= 1 #reproduce after year 1

#generate list of combinations of parameter values to simulate
replicates = expand.grid(poptime, maxage, k, broodsize, reproductiveage, proportionfemale)
colnames(replicates) = c("poptime", "maxage", "k", "broodsize", "reproductiveage", "proportionfemale")

#run model iterating over parameters in replicates
for(r in 1:nrow(replicates)){ 
  RunModel(replicates, r, directory)}

