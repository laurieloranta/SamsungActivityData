# run_analysis.R
run_analysis.R collects, cleans and prepares a tidy data set from data that originates from the accelerometers from the Samsung Galaxy S smartphone. A full description of the source raw data set is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here is the original data set for preparing: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

## How does run_analysis.R work?

### Requirements
The run_analysis.R script requires, that the source raw data is located in the working directory. It is also required, that the source raw data is presented in the orgiginal file structure. Basically this means, that in order for the script to work, the working directory must contain the original raw data folder "UCI HAR Dataset" and all its contents.

### Output
When running the script, the run_analysis.R script writes an output file "finalData.txt" that contains  the final tidy data. The finalData.txt will be written in the working directory.

### The Process of Cleaning Data
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

    5.1 Tidy up some header name redundancies

**TRANSFORM COMBINED DATA**

6. Extracts only columns that contain mean or standard deviation (std) measurements.

6. Transform the data set in a  way that it contains only averages of each variable for each "Activity"" and each "SubjectNumber".

**WRITE OUTPUT**

7. Write the final tidy dataset as output: finalData.txt

