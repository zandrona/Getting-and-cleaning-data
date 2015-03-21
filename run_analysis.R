library(plyr)
library(dplyr)
library(reshape2)
library(stringr)

# read in the test and train data                  
features <- read.table("UCI HAR Dataset\\features.txt")
test_x <- read.table("UCI HAR Dataset\\test\\X_test.txt")
test_y <- read.table("UCI HAR Dataset\\test\\y_test.txt")
test_subjects <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
train_x <- read.table("UCI HAR Dataset\\train\\X_train.txt")
train_y <- read.table("UCI HAR Dataset\\train\\y_train.txt")
train_subjects <- read.table("UCI HAR Dataset\\train\\subject_train.txt")

#1. Merges the training and the test sets to create one data set.
merge_x <- rbind(test_x, train_x)
merge_y <- rbind(test_y, train_y)
merge_subjects <- rbind(test_subjects, train_subjects)


#rename the col names of merge_x with features V2 column
colnames(merge_x) <- as.character(features$V2, unique=TRUE)

#add merge_y and merge_subjects as first columns to merge_x 
names(merge_y) <- c("id")
names(merge_subjects) <- c("subjects")
merge_x <- cbind(merge_subjects, merge_y, merge_x)

#2. Extract only the measurements on the mean and standard deviation for each measurement
filtercol <- grep("mean|std|id|subjects", colnames(merge_x))
extract <- subset(merge_x, select = filtercol)

#3. Uses descriptive activity names to name the activities in the data set
# read name activity names list
activityLabels <- read.table("UCI HAR Dataset\\activity_labels.txt")
extract$activity <- factor(extract$id, levels=c(1,2,3,4,5,6), labels=activityLabels$V2)

#4.Appropriately labels the data set with descriptive variable names. 
#This was done in the Step1 using names(merge_x)

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# make group elements
groups <- list(activity = extract$activity,
                         subject = extract$id)
# Create data set with mean of each variable for each activity and subject
# Exclude first two columns from aggregate input to prevent R from trying
# to average the activity and subject columns
i<- ncol(extract)

tidydata <- aggregate(extract[4:i-1], by=groups, FUN=mean, na.rm=TRUE)
# Create text file of tidy data set
write.table(tidydata, "UCI HAR Dataset\\tidydata.txt", row.name = FALSE)
