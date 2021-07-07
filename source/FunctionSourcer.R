#Set working directory, import packages, source functions, 
setwd(paste(directory,"/source/", sep = ''))    # set temp working directory for this one particular script in that source

#import packages
#library()

#source functions
source(paste(getwd(), "/RunModel.R", sep = '')) #sourcing the runmodel script has to be named the same or it will not find it.

