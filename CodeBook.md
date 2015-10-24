##Project Description
Getting and Cleaning Data Course Project


##Notes on the original (raw) data
The data was obtained from the flowing source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


##Initial project and variable description
The data available in the above given source contain: raw data files, complete description of the project (README.txt), detailed definitions of each variable (feature_info.txt, features.txt).


##Creating tidy data file
In order to create the tidy data file the following tasks ware performed:

(1) From the downloaded sets of data (i.e X_test.txt and X_train.txt) I extracted only the variables referring to the means and standard deviation of the measurements taken in iniciat project.

(2) I merge the above data with the data referring to the activities (i.e. y_test.txt, y_train.txt) and subjects, who perform the activities (i.e subject_test.txt, subject_train.txt). 

(3) I passed the descriptive variables' names (based on features.txt) to merged data frame and labeled the activities (activity_labels.txt)

(4) I reshape the data frame, which allowed me to obtain a second, independent tidy data set with the average of each variable for each activity and each subject (tidy.txt) The detailed description of performed analysis is available in ran_analysis.R file.


