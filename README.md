# Peer-graded-Assignment-Getting-and-Cleaning-Data-Course-Project
Peer-graded Assignment: Getting and Cleaning Data Course Project
Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### My Process
1. Set working directory and load "activity.txt", "features.txt".
2. Extract features that we want..mean OR standard deviation.
3. Load "X_train.txt" and extract columns what we want using My Process num 2.
4. cbind extracted"X_train.txt", "y_train.txt", "subject_train.txt"
5. Load "X_test.txt" and extract columns what we want using My Process num 2.
6. cbind extracted"X_test.txt", "y_test.txt", "subject_test.txt"
7. Merge data from Process4 and Process6.
8. Naming colnames of MergedData and values of Activity variable in MergedData.
9. Summary MergedData using "aggregate" command.
