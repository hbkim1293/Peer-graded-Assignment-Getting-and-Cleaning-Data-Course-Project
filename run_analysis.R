setwd("C:\\Users\\HUIBEOM\\Desktop\\Rdoc\\coursera\\getdata_projectfiles_UCI HAR Dataset\\
      UCI HAR Dataset")

ActLab <- read.table("activity_labels.txt")
Features <- read.table("features.txt")
Features_Needs <- Features[grep("mean|std", Features[,2]),]

#Load Training set
Train <- read.table("./train/X_train.txt")
Train <- Train[,Features_Needs[,1]] #Extracts measurements on the mean and standard deviation
TrainLabels <- read.table("./train/y_train.txt")
TrainSub <- read.table("./train/subject_train.txt")
Train <- cbind(TrainSub, TrainLabels, Train)

#Load Test set
Test <- read.table("./test/X_test.txt")
Test <- Test[,Features_Needs[,1]] #Extracts measurements on the mean and standard deviation
TestLabels <- read.table("./test/y_test.txt")
TestSub <- read.table("./test/subject_test.txt")
Test <- cbind(TestSub, TestLabels, Test)

#Merges the training and the test sets to create one data set.
MergeData <- rbind(Train, Test)

#Appropriately labels the data set with descriptive variable names
colnames(MergeData) <- c("Subject","Activity",as.character(Features_Needs[,2]))
colnames(MergeData)[3:ncol(MergeData)] <- gsub("-","",colnames(MergeData)[3:ncol(MergeData)])
colnames(MergeData)[3:ncol(MergeData)] <- sub("[()]","",colnames(MergeData)[3:ncol(MergeData)])
#Uses descriptive activity names to name the activities in the data set
for (i in 1:6) {
  MergeData$Activity[MergeData$Activity == i] <- as.character(ActLab[i,2])
}

#tidy data set with the average of each variable for each activity and each subject.
SummaryData <- aggregate(MergeData[,3:ncol(MergeData)], 
                         by = list(MergeData$Subject,MergeData$Activity), FUN = mean)
colnames(SummaryData)[1:2] <- c("Subject","Activity")
write.csv(SummaryData, file = "Summarize.csv", row.names = FALSE)