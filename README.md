# `tidydata`  - tidying UCI human activity data

This repository includes the code, data and documentation for the class project in the Coursera course "Getting and Cleaning Data".  The script run_analysis.R is the complete script for downloading, merging, summarizing and writing out the data sets, i.e. to create the data files HumanActivity.txt and HumanActivity_Summarized.txt

The dataset is the Human Activity Recognition Using Smartphones Data Set: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>.  The run_analysis.R script does the following:

  - 0.Downloads the dataset from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> if needed
  - 1.Merges the training and the test sets to create one data set.
  - 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
  - 3.Uses descriptive activity names to name the activities in the data set
  - 4.Appropriately labels the data set with descriptive variable names. 
  - 5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

Files in this repo:

  - README.md - this file
  - codebook.md - description of the data in the output dataset
  - run_analysis.R - R code that loads data in the UCI dataset, transforms it, and writes it out into two tidy data sets
  - the data directory, with the produced HumanActivity.txt and HumanActivity_Summarized.txt

To use this script, place it into a directory and run it.  It will automatically create a data subdirectory, download the data file, and write out the tidy data sets.  If the downloaded data file is already in the working directory, the script will just use that without downloading.  The unzipped files will be placed in a data directory.
