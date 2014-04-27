
# You should create one R script called run_analysis.R that does the following. 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement. 
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive activity names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# R Script for Getting and Cleaning Data Class on Coursera

library(data.table)


# I set my WD in the script. Feel free to do it however. Either Uncomment this line or set it in the GUI.
# setwd("~/R/peerassessment/UCI HAR Dataset")

# Load All the Data In.

xtrain <- read.table("train/X_train.txt")
xtest <- read.table("test/X_test.txt")

ytrain <- read.table("train/y_train.txt")
ytest <- read.table("test/y_test.txt")

strain <- read.table("train/subject_train.txt")
stest <- read.table("test/subject_test.txt")

activity <- read.table("activity_labels.txt")
features <- labels <- read.table("features.txt")


#Merge all the data using rbind. 

xdata <- rbind(xtrain, xtest)
sdata <- rbind(strain, stest)
ydata <- rbind(ytrain, ytest)

#Add Labels for Activity
ydata <- merge(ydata,activity,by="V1")

#Naming the Fields
names(xdata) <- features$V2

#Mix xdata (measures) with ydata (labels), and sdata (subject)

dataset <- cbind(xdata,ydata,sdata,deparse.level=1)

#Fix the Names of the multiple V1/V2s from the various files.

names(dataset)[562]<- paste("Activity")
names(dataset)[563]<- paste("ActivityName")
names(dataset)[564]<- paste("Subject")

#Extract Mean/Standard Deviation

#Find all Columns Where the phrase std appears and store it in a variable.
stdcname <- grep("[Ss]td", colnames(dataset), value=TRUE)
stdcnum <- grep("[Ss]td", colnames(dataset))

#Subset to just those with mean/standard.
subdataset <-  dataset[, c(meancnum, stdcnum, 563, 564)] 

#Create Requested Tidy Dataset of Mean Values
datatable <- data.table(subdataset)
meantidy<- datatable[, lapply(.SD, mean), by=c("Subject", "ActivityName")]
meantidy<- meantidy[order(meantidy$Subject),]

write.table(subdataset, "tidydata.txt", sep="\t")
write.table(meantidy, "tidydatameans.txt", sep="\t")
