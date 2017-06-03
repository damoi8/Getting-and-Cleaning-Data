# Getting-and-Cleaning-Data
This is the week 4 assignment for the Getting and Cleaning Data Course.
The  objective is to collect, work with, and clean a data set.

## Data Description ##
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects. 
The variable in the data Y indicates activity type the subjects performed during recording.

### New Data Set ###
The new data set collects variables calculated based only on the mean and standard deviation. 
Each row is an average of the activity for all subjects 

#### The code written in the run_analysis.R file does the following: ####
* Downloads the data file into working directory
* Unzips the downloaded data file
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

