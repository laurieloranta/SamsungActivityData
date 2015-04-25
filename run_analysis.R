## run_analysis.R


## Read the names of the variables and transfrom the result into a factor vector
headerNames <- read.table("UCI HAR Dataset/features.txt")[[2]]

## Read the activity labels and transform the result into a character vector
activityLabels <- as.character(read.table("UCI HAR Dataset/activity_labels.txt")[[2]])



## WRANGLING TEST DATA

## Read the test data and assign the correct header names
TestData <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = headerNames)

##Read the subjects for each record in an ad a column name for it
TestSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(TestSubjects)[1] <- "SubjectNumber"

##Combine the subject data with test data set
TestData <- cbind(TestSubjects, TestData)

##Read the activities
TestActivities <- read.table("UCI HAR Dataset/test/y_test.txt")[[1]]
## Transform the numeric activities as factor with correct labels
TestActivities <- cut(TestActivities, breaks = 6, labels = activityLabels)
TestActivities <- as.data.frame(TestActivities)
names(TestActivities)[1] <- "Activity"

##Combine the Activities data with the test data set
TestData <- cbind(TestActivities, TestData)



## WRANGLING TRAIN DATA

## Read the train data and assign the correct header names
TrainData <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = headerNames)

##Read the subjects for each record in an ad a column name for it
TrainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(TrainSubjects)[1] <- "SubjectNumber"

##Combine the subject data with test data set
TrainData <- cbind(TrainSubjects, TrainData)

##Read the activities
TrainActivities <- read.table("UCI HAR Dataset/train/y_train.txt")[[1]]
## Transform the numeric activities as factor with correct labels
TrainActivities <- cut(TrainActivities, breaks = 6, labels = activityLabels)
TrainActivities <- as.data.frame(TrainActivities)
names(TrainActivities)[1] <- "Activity"

##Combine the Activities data with the test data set
TrainData <- cbind(TrainActivities, TrainData)



## MERGE TRAIN AND TEST DATA SETS

masterData <- rbind(TrainData,TestData)

#Include only mean and std releated variables
masterData2 <- masterData[((grepl("mean", names(masterData)) | grepl("std", names(masterData))) & !(grepl("meanF", names(masterData))))]
masterData2 <- cbind(masterData[1:2], masterData2)

#Tidy up some redundancy in Column header names
names(masterData2) <- sub("BodyBody", "Body", names(masterData2))


## AGGREGATE THE AVERAGE DATA SET AND WRITE THE FINAL DATASET OUTPUT

##Aggregate a new data set data set with the average of each variable for each activity and each subject.
meanAggregateData <- aggregate (. ~ Activity + SubjectNumber, masterData2, FUN=mean)


## Output the final data as a text file
write.table(meanAggregateData, "finalData.txt", row.name=FALSE)





