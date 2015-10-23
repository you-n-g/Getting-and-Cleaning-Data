library(tidyr)
library(dplyr)

# 0. read all the data
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
activity_lables<-read.table("./UCI HAR Dataset/activity_labels.txt")
features<-read.table("./UCI HAR Dataset/features.txt")


# 1. Merges the training and the test sets to create one data set.
X_all <- bind_rows(X_train, X_test)
y_all <- bind_rows(y_train, y_test)
sub_all <- bind_rows(sub_train, sub_test)


# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

valid_column_names <- make.names(names=features[,2], unique=TRUE, allow_ = TRUE) # some name contains "()", that are invalid name to use select
original_names <- as.character(features[,2])
names(original_names) <- valid_column_names  # remember the original names.

colnames(X_all) <- valid_column_names
X_all <- select(X_all, matches("std|mean", ignore.case=FALSE))

# 3. Uses descriptive activity names to name the activities in the data set
colnames(y_all) <- "activity"
colnames(sub_all) <-"subject"

# 4. Appropriately labels the data set with descriptive variable names. 
y_all[,"activity"] =  activity_lables[y_all[["activity"]], 2]


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
all_data <- bind_cols(sub_all, y_all, X_all)
by_activity_subject <- group_by(all_data, activity, subject)
tidy_data <- summarize_each(by_activity_subject, funs(mean))
colnames(tidy_data)[-c(1,2)] <- original_names[colnames(tidy_data)[-c(1,2)]]
write.table(tidy_data, "TidyData.txt", row.name=F)
