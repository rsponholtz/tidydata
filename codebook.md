## Coursera: Getting and Cleaning Data
### Codebook

The generated output is saved to the file HumanActivity.txt. This file includes all rows merged from the test and training data included in the activity recognition dataset.

The data in HumanActivity.txt is comma separated, and can be read using the R statement:
```R
datafile <- read.csv("HumanActivity.txt"")
```

The data in HumanActivity_Summarized.csv has the same format as HumanActivity.csv, but is summarized by the average of each variable for each activity and each subject. 

## Processing done on raw data
Here are the steps taken on the raw data to obtain the resulting data sets:
  - Download the dataset from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> if needed.  Also, the zip file is unzipped into the data directory
  - Merges the training and the test sets to create one data set.  For each of (training and test) data sets, the activities file (eg. y_train.txt), subjects file (subjects_train.txt) and the features file (X_train.txt) are read and matched combined by row.  The first record of each file becomes a row in the resulting data set, and so on.  Then, the test and training datasets are combined into one big dataset.  
  - Extracts only the measurements on the mean and standard deviation for each measurement. Here, we take all of the measurement names (from features.txt), and retain all measurements that have "mean" or "std" in the column name (case insensitive)
  - Uses descriptive activity names to name the activities in the data set - we convert the activity numbers in the data set to the activity names from activity_labels.txt
  - Appropriately labels the data set with descriptive variable names. We use measurement names from features.txt, but convert into valid R names (using make.names) and convert tBody into time.Body, tGravity into time.Gravity, fBody into frequency.Body and fGravity into frequency.Gravity.  This makes the column names somewhat more descriptive.
  - writes the data out into HumanActivity.txt (as comma separated variable file)
  - Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
  - writes the second data set out as HumanActivity_Summarized.txt

## ID Fields
These identify the activity and subject of the test.  
* `Activity.Name` - column 1
* `subject.ID` - column 2


##  Activity feature measurement data 
These identify the measurements for the activity and subject.  These only include the feature fields that include either mean or std in the feature name (case insensitive).
* `time.BodyAcc.mean...X` - column 3
* `time.BodyAcc.mean...Y` - column 4
* `time.BodyAcc.mean...Z` - column 5
* `time.BodyAcc.std...X` - column 6
* `time.BodyAcc.std...Y` - column 7
* `time.BodyAcc.std...Z` - column 8
* `time.GravityAcc.mean...X` - column 9
* `time.GravityAcc.mean...Y` - column 10
* `time.GravityAcc.mean...Z` - column 11
* `time.GravityAcc.std...X` - column 12
* `time.GravityAcc.std...Y` - column 13
* `time.GravityAcc.std...Z` - column 14
* `time.BodyAccJerk.mean...X` - column 15
* `time.BodyAccJerk.mean...Y` - column 16
* `time.BodyAccJerk.mean...Z` - column 17
* `time.BodyAccJerk.std...X` - column 18
* `time.BodyAccJerk.std...Y` - column 19
* `time.BodyAccJerk.std...Z` - column 20
* `time.BodyGyro.mean...X` - column 21
* `time.BodyGyro.mean...Y` - column 22
* `time.BodyGyro.mean...Z` - column 23
* `time.BodyGyro.std...X` - column 24
* `time.BodyGyro.std...Y` - column 25
* `time.BodyGyro.std...Z` - column 26
* `time.BodyGyroJerk.mean...X` - column 27
* `time.BodyGyroJerk.mean...Y` - column 28
* `time.BodyGyroJerk.mean...Z` - column 29
* `time.BodyGyroJerk.std...X` - column 30
* `time.BodyGyroJerk.std...Y` - column 31
* `time.BodyGyroJerk.std...Z` - column 32
* `time.BodyAccMag.mean..` - column 33
* `time.BodyAccMag.std..` - column 34
* `time.GravityAccMag.mean..` - column 35
* `time.GravityAccMag.std..` - column 36
* `time.BodyAccJerkMag.mean..` - column 37
* `time.BodyAccJerkMag.std..` - column 38
* `time.BodyGyroMag.mean..` - column 39
* `time.BodyGyroMag.std..` - column 40
* `time.BodyGyroJerkMag.mean..` - column 41
* `time.BodyGyroJerkMag.std..` - column 42
* `frequency.BodyAcc.mean...X` - column 43
* `frequency.BodyAcc.mean...Y` - column 44
* `frequency.BodyAcc.mean...Z` - column 45
* `frequency.BodyAcc.std...X` - column 46
* `frequency.BodyAcc.std...Y` - column 47
* `frequency.BodyAcc.std...Z` - column 48
* `frequency.BodyAcc.meanFreq...X` - column 49
* `frequency.BodyAcc.meanFreq...Y` - column 50
* `frequency.BodyAcc.meanFreq...Z` - column 51
* `frequency.BodyAccJerk.mean...X` - column 52
* `frequency.BodyAccJerk.mean...Y` - column 53
* `frequency.BodyAccJerk.mean...Z` - column 54
* `frequency.BodyAccJerk.std...X` - column 55
* `frequency.BodyAccJerk.std...Y` - column 56
* `frequency.BodyAccJerk.std...Z` - column 57
* `frequency.BodyAccJerk.meanFreq...X` - column 58
* `frequency.BodyAccJerk.meanFreq...Y` - column 59
* `frequency.BodyAccJerk.meanFreq...Z` - column 60
* `frequency.BodyGyro.mean...X` - column 61
* `frequency.BodyGyro.mean...Y` - column 62
* `frequency.BodyGyro.mean...Z` - column 63
* `frequency.BodyGyro.std...X` - column 64
* `frequency.BodyGyro.std...Y` - column 65
* `frequency.BodyGyro.std...Z` - column 66
* `frequency.BodyGyro.meanFreq...X` - column 67
* `frequency.BodyGyro.meanFreq...Y` - column 68
* `frequency.BodyGyro.meanFreq...Z` - column 69
* `frequency.BodyAccMag.mean..` - column 70
* `frequency.BodyAccMag.std..` - column 71
* `frequency.BodyAccMag.meanFreq..` - column 72
* `frequency.BodyBodyAccJerkMag.mean..` - column 73
* `frequency.BodyBodyAccJerkMag.std..` - column 74
* `frequency.BodyBodyAccJerkMag.meanFreq..` - column 75
* `frequency.BodyBodyGyroMag.mean..` - column 76
* `frequency.BodyBodyGyroMag.std..` - column 77
* `frequency.BodyBodyGyroMag.meanFreq..` - column 78
* `frequency.BodyBodyGyroJerkMag.mean..` - column 79
* `frequency.BodyBodyGyroJerkMag.std..` - column 80
* `frequency.BodyBodyGyroJerkMag.meanFreq..` - column 81
* `angle.time.BodyAccMean.gravity.` - column 82
* `angle.time.BodyAccJerkMean..gravityMean.` - column 83
* `angle.time.BodyGyroMean.gravityMean.` - column 84
* `angle.time.BodyGyroJerkMean.gravityMean.` - column 85
* `angle.X.gravityMean.` - column 86
* `angle.Y.gravityMean.` - column 87
* `angle.Z.gravityMean.` - column 88

## Activity Names
These are the values for Activity.Name
* `WALKING`
* `WALKING_UPSTAIRS`
* `WALKING_DOWNSTAIRS`
* `SITTING`
* `STANDING`
* `LAYING`

## subject.ID values
The subject.ID field is an integer ranging from 1 to 30, identifying the person who was the subject of the test.
