if(!file.exists("./data"))
  {dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Reading training tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# Assign Column Names:
colnames(x_train) <- features[,2] 
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

#Merge All Data in One Set:
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(merge_train, merge_test)

#Extracting mean and sd
colNames <- colnames(setAllInOne)
mean_and_sd <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) 
)
meanAndSdSet <- setAllInOne[ , mean_and_sd == TRUE]

# Naming activities in the data set  
setWithActivityNames <- merge(meanAndSdSet, activityLabels,
                                by='activityId',
                                all.x=TRUE)

# Create Tidy Data Set
tidyData <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
tidyData <- tidyData[order(tidyData$subjectId, tidyData$activityId),]

# Write Tidy Data Set To .txt file
write.table(tidyData, "TidyData.txt", row.names=FALSE)