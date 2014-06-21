library(stringr)
library(matrixStats)
library(fBasics)
library(doBy)

##function definitions

#return the proper data dir based on which data (test/train)
dataDirName <- function(whichdata)
{
  paste(datadir, "/UCI HAR Dataset/",whichdata, sep="")
}

#return the data file based on the data set(test/train) and the datafile
datafile <- function(whichdata,whichfile)
{
  paste(dataDirName(whichdata),"/",whichfile,whichdata,".txt", sep="")
}

#return the filename containing the type of data based on set (test/train)
activitiesFile <- function(which) {  datafile(which,"y_") }
subjectsFile <- function(which) {  datafile(which,"subject_") }
featuresFile <- function(which) {  datafile(which,"X_") }

#return the combined data set, either test or train
getDataSet <- function(whichdata)
{
  
  colwidths<- rep(16,times=561)
  
  #read the test x datafile
  xtest <- read.fwf(featuresFile(whichdata), widths=colwidths, header=FALSE)
  #read the test y datafile
  ytest <- read.table(activitiesFile(whichdata), header=FALSE)
  #read the test subject datafile
  subjecttest <- read.table(subjectsFile(whichdata), header=FALSE)
  #merge the subject, x and y datasets
  cbind(subjecttest, ytest, xtest)
}

#read the feature names and make descriptive column names out of them 
getColumnNames <- function()
{
  #read the column names from the features.txt file
  featurenames <- read.table(paste(datadir, "/UCI HAR Dataset/features.txt", sep=""), header=FALSE)
  
  #massage the column names from the features.txt file, replacing f with frequency and t with time
  cn<-gsub("fBody","frequency.Body",featurenames[[2]],ignore.case=TRUE)
  cn2<-gsub("tBody","time.Body",cn,ignore.case=TRUE)
  cn3<-gsub("fGravity","frequency.Gravity",cn2,ignore.case=TRUE)
  cn4<-gsub("tGravity","time.Gravity",cn3,ignore.case=TRUE)
  goodnames <- c("subject.ID","activity.Label", make.names(cn4)) 
  goodnames
}

#setwd("~/Coursera/getdata-004/Project")

#the directory to put working data in
datadir <- "./data"
#the directory to put the final data sets in
outputdir <- "./"
#current working dir
workingdir <- "./"

#this is the URL of the file to download
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#this is the name of the file downloaded
zipfileName <- paste(workingdir,"/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", sep="")

#create the datadir if it doesn't exist
if(!file.exists(datadir)) {dir.create(datadir)}
#download the data file into the indicated zipfile
if(!file.exists(zipfileName)) 
{
  download.file(fileURL,destfile=zipfileName,method="curl",mode="wb", extra="--insecure")
  #capture the downloaded date
  dateDownloaded <- date()
}

#unzip the datafile into the datadir location
if(!file.exists(paste(datadir, "/UCI HAR Dataset", sep=""))) 
{
  unzip(zipfileName,exdir=datadir)
}

#
# This is the overall flow for this project:
#
##1.Merges the training and the test sets to create one data set.
##2.Extracts only the measurements on the mean and standard deviation for each measurement. 
##3.Uses descriptive activity names to name the activities in the data set
##4.Appropriately labels the data set with descriptive variable names. 
##5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


##1.Merges the training and the test sets to create one data set.
testdata <- getDataSet("test")
traindata <- getDataSet("train")

#merge the traindata and testdata into one big dataset
alldata <- rbind(traindata,testdata)
names(alldata) <- getColumnNames()

##2.Extracts only the measurements on the mean and standard deviation for each measurement. 
#determine which columns to keep.  These are the ones that have mean, Mean, or std in the name 
selectedcols <- grep("mean|std|activity.Label|subject.ID",names(alldata),ignore.case=TRUE)
selecteddata <- alldata[selectedcols]

##3.Uses descriptive activity names to name the activities in the data set
#read the column names from the file
actnames <- read.table(paste(datadir, "/UCI HAR Dataset/activity_labels.txt", sep=""), header=FALSE)
names(actnames) <-c("activity.Label","Activity.Name")
mergedata <- merge(actnames,selecteddata,by.x="activity.Label",by.y="activity.Label",all.y=TRUE)
#remove the activity.Label column
mergedata[["activity.Label"]] <- NULL


##4.Appropriately labels the data set with descriptive variable names. 
##I did this above when I created the column names
#write out the data
write.table(mergedata,file=paste(outputdir, "/HumanActivity.txt", sep=""),sep=",",row.names=FALSE)

##5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#get all the column names
allcols <- names(mergedata)
#take just the column names that we want to summarize
sumcols <- allcols[3:length(allcols)]
#summarize by activity name and subject ID using mean function
sumdata <- summaryBy(list(c(sumcols),c("Activity.Name","subject.ID")), data=mergedata,FUN=mean)

#write out the sumdata to file part2.csv
write.table(sumdata,file=paste(outputdir, "/HumanActivity_Summarized.txt", sep=""),sep=",",row.names=FALSE)
