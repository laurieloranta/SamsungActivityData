# CodeBook for Output File finalData.txt
This is a code book for the final output data set that is produced by the run_analysis.R script.

## Original Raw Source Data

The sourse data originates from the accelerometers from the Samsung Galaxy S smartphone. A full description of the source raw data set is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here is the original data set for preparing: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## What Has Been Done to The Source Raw Data on A High Level?
Here is a high level descrition how the finalData has been prepared from the raw source data:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Detailed Step by Step Process for Producing The FinalData from The Source Data

The run_analysis scrit follows the steps below when producing the tidy data set:

**PREPARE**

1. Script reads the names of the column headers of the raw datasets from "UCI HAR Dataset/features.txt"

2. Script reads the names of the record related activities from "UCI HAR Dataset/activity_labels.txt"

**WRANGELE TEST DATA**

3. Script Reads and prepares the test data set from UCI HAR Dataset/test/X_test.txt

    3.1 Read test data and add the correct names of the column headers
    
    3.2 Add a new column "SubjectNumber" that containts subject numbers of each record from "UCI HAR Dataset/test/subject_test.txt"
    
    3.3 Add a new column "Activity" that contains the activity numebers of each record from "UCI HAR Dataset/test/y_test.txt"
    
    3.4 Transform to activity numbers as real activity names

**WRANGLE TRAIN DATA**

4. Script Reads and prepares the train data set from UCI HAR Dataset/train/X_train.txt

    4.1 Read train data and add the correct names of the column headers
    
    4.2 Add a new column "SubjectNumber" that containts subject numbers of each record from "UCI HAR Dataset/train/subject_train.txt"
    
    4.3 Add a new column "Activity" that contains the activity numebers of each record from "UCI HAR Dataset/train/y_train.txt"
    
    4.4 Transform to activity numbers as real activity names
  
**COMBINE TRAIN AND TEST DATA**

5. Combine the train and test data sets as one data set

    5.1 Tidy up header name redundancies: replace "BodyBody" with "Body" in header names

**TRANSFORM COMBINED DATA**

6. Extracts only columns that contain mean or standard deviation (std) measurements.

6. Transform the data set in a  way that it contains only averages of each variable for each "Activity"" and each "SubjectNumber". 

**WRITE OUTPUT**

7. Write the final tidy dataset as output: finalData.txt

## Code Book

The finalData datasets consists of 68 variables and 180 records. The first variable "Activity" is a factor variable describing the measurement activity. The second variable "SubjectNumber" is a integer variable containing the number of the tested subject. All other varibales are numeric.

The data is tructured in a way that it describes every "Activity" and "SubjectNumber" pair and the means of the mean and std measurements for these pairs. Thus, the numeric data is average data of many data points for each Activity-SubjectNumber pair. 

### Variables

#### Activity

A factor varibale describing the activity of the measurement. Possible levels are: 

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING


#### SubjectNumber

An integer variable consisting the number of the research subject that was measured. Varies between 1-30, as there were 30 reserch subjects.

#### All other variables
Variables in columns [3:68] are all numeric variables and they contain only the mean and standard deviation data, which has been summarized in the form of Activity-SubjectNumber pair means. 

The header names follow the original data header convention described below:

The original data comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


tBodyAcc.mean...X

"tBodyAcc.mean...Y"

"tBodyAcc.mean...Z"

*"tBodyAcc.std...X"

*"tBodyAcc.std...Y"

*"tBodyAcc.std...Z"

*"tGravityAcc.mean...X"

*"tGravityAcc.mean...Y"

*"tGravityAcc.mean...Z"

"tGravityAcc.std...X"

"tGravityAcc.std...Y"

"tGravityAcc.std...Z"

"tBodyAccJerk.mean...X"

"tBodyAccJerk.mean...Y"

"tBodyAccJerk.mean...Z"

"tBodyAccJerk.std...X"

"tBodyAccJerk.std...Y"

"tBodyAccJerk.std...Z"

"tBodyGyro.mean...X"

"tBodyGyro.mean...Y"

"tBodyGyro.mean...Z"

"tBodyGyro.std...X"

"tBodyGyro.std...Y"

"tBodyGyro.std...Z"

"tBodyGyroJerk.mean...X"

"tBodyGyroJerk.mean...Y"

"tBodyGyroJerk.mean...Z"

"tBodyGyroJerk.std...X"

"tBodyGyroJerk.std...Y"

"tBodyGyroJerk.std...Z"

"tBodyAccMag.mean.."

"tBodyAccMag.std.."

"tGravityAccMag.mean.."

"tGravityAccMag.std.."

"tBodyAccJerkMag.mean.."

"tBodyAccJerkMag.std.."

"tBodyGyroMag.mean.."

"tBodyGyroMag.std.."

"tBodyGyroJerkMag.mean.."

"tBodyGyroJerkMag.std.."

"fBodyAcc.mean...X"

"fBodyAcc.mean...Y"

"fBodyAcc.mean...Z"

"fBodyAcc.std...X"

"fBodyAcc.std...Y"

"fBodyAcc.std...Z"

"fBodyAccJerk.mean...X"

"fBodyAccJerk.mean...Y"

"fBodyAccJerk.mean...Z"

"fBodyAccJerk.std...X"

"fBodyAccJerk.std...Y"

"fBodyAccJerk.std...Z"

"fBodyGyro.mean...X"

"fBodyGyro.mean...Y"

"fBodyGyro.mean...Z"

"fBodyGyro.std...X"

"fBodyGyro.std...Y"

"fBodyGyro.std...Z"

"fBodyAccMag.mean.."

"fBodyAccMag.std.."

"fBodyAccJerkMag.mean.."

"fBodyAccJerkMag.std.."

"fBodyGyroMag.mean.."

"fBodyGyroMag.std.."

"fBodyGyroJerkMag.mean.."

"fBodyGyroJerkMag.std.."



**The accronyms used in varibale names are:**

Acc = Acceleration

Gyro = Gyroscope

Mag = Magnitude

std = Standard Deviation

t = time

f = fourier transformation













