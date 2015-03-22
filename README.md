
The script (run_analysis.R) does the following:

    1.Merges the training and the test sets to create one data set.
    2.Extracts only the measurements on the mean and standard deviation for each measurement.
    3.Uses descriptive activity names to name the activities in the data set
    4.Appropriately labels the data set with descriptive activity names.
    5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    
The script performs operations to import, clean, and transform the data set. These steps are also indicated in comments throughout the .R file.

The resulting tidy dataset (tidydata.txt) has 180 rows x 81 columnsy in tidydata.txt. It contains one row for each subject/activity pair and columns for subject, activity, and each feature that was a mean or standard deviation from the original dataset.
The tidydata is a  subset of the data provided in the Human Activity Recognition Using Smartphones Data Set. The source data is available from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


codebook.md describes the specific details of variables, values, and units in the tidy data set. 
