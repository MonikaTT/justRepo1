##Reading test data
test<-read.table("./UCI HAR Dataset/test/X_test.txt")
lables_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject<-read.table("./UCI HAR Dataset/test/subject_test.txt")

##Reading train data
train<-read.table("./UCI HAR Dataset/train/X_train.txt")
lables_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject<-read.table("./UCI HAR Dataset/train/subject_train.txt")

##Reading features
features<-read.table("./UCI HAR Dataset/features.txt")

##Reading activity lables
activity_lables<-read.table("./UCI HAR Dataset/activity_labels.txt")

##Marging measurments data
measure_df<-rbind(train, test)

##Seting names to measurments data and making them look better
features_names<-as.character(features[ ,2])

##Passing the names to the dataframe
names(measure_df)<-features_names

##Extracting the only variables for meand and std
extract<-grep(".*-mean().*|.*-std().*", features_names, value = FALSE)
measure_df<-measure_df[,extract]

##Making variables'names look better
descriptive_names<-names(measure_df)
descriptive_names<-gsub("mean", "Mean", descriptive_names)
descriptive_names<-gsub("std", "Std", descriptive_names)
descriptive_names<-gsub("[-()]", "", descriptive_names)

##Marging subject and activity for test and training
subject<-rbind(test_subject, train_subject)
activity<-rbind(lables_test, lables_train)

##Marging all together
bigdata<-cbind(subject, activity, measure_df)
names(bigdata)<-c("subject", "activity", descriptive_names)

##Adding activity labels
bigdata$activity<-factor(bigdata$activity, levels = activity_lables[, 1], labels = activity_lables[, 2])

##Reshaping datafreame
library(reshape2)
bigdata_melted<-melt(bigdata, id=c("subject", "activity"), measure.vars = names(bigdata[,(3:length(bigdata))]))

##Creating tidy data set with the average of each variable for each activity and each subject
tidy_data<-dcast(bigdata_melted, subject + activity ~ variable,mean)

##Writing the file tidy.txt
write.table(tidy_data, "tidy.txt", row.names = FALSE)




