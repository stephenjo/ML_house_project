#filename: MissForestImputation 

# imputations for train and test files

# clear enviroment
rm(list=ls())

#missForest library
#install.packages("missForest")
library(missForest)

# set working directory to file location
setwd("C:/Users/19175/Desktop/Ames_data")

##########################################################
##########################################################
############ Imputations for test data ###################

#load data
df <- read.csv("train.csv")

lng <- 0
for (k in seq(length(df))){
  lng[k] <- length(unique(df[,k]))
  if (lng[k]>25){
    print(k)
    print(class(df[,k]))
  }
  #print(class(df[,k]))
}
#lng

#impute missing values, using all parameters as default values
df.imp <- missForest(df)

#check imputed values
df.imp$ximp

#check out of box imputation error
df.imp$OOBerror

# save file
write.csv(df.imp$ximp, file = "train_imputed.csv")



##########################################################
##########################################################
############ Repeat above for test data ##################

# clear enviroment
rm(list=ls())

#missForest library
#install.packages("missForest")
library(missForest)


#load data
df <- read.csv("test.csv")

lng <- 0
for (k in seq(length(df))){
  lng[k] <- length(unique(df[,k]))
  if (lng[k]>25){
    print(k)
    print(class(df[,k]))
  }
  #print(class(df[,k]))
}
#lng

#impute missing values, using all parameters as default values
df.imp <- missForest(df)

#check imputed values
df.imp$ximp

#check out of box imputation error
df.imp$OOBerror

# save file
write.csv(df.imp$ximp, file = "test_imputed.csv")