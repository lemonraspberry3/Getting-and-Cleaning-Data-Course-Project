#download the zip file as "dataset.zip" and save it to the project directory
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL, destfile = "./dataset.zip")
unzip("dataset.zip")

#read in files from the UCI HAR dataset and save as variables
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
testset <- read.table("./UCI HAR Dataset/test/X_test.txt")
testlabels <- read.table("./UCI HAR Dataset/test/y_test.txt")

subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
trainset <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainlabels <- read.table("./UCI HAR Dataset/train/y_train.txt")

features <- read.table("./UCI HAR Dataset/features.txt")     #generates dataframe
f1 <- features[,2]      #extract only the feature names listed in column two
f2 <- as.character(f1)  #prior step generated factors, convert to character vector

#combine test data into one dataframe and rename columns
#add a column indicating these are test data
tests <- data.frame(subjecttest, testlabels, testset)
names(tests) <- c("subjectID", "activitycode", f2)
tests <- data.frame(tests, group = "test")

#combine training data into one dataframe and rename columns
#add a column indicating these are training data
training <- data.frame(subjecttrain, trainlabels, trainset)
names(training) <- c("subjectID", "activitycode", f2)
training <- data.frame(training, group = "train")

#combine the tests and training dataframes into one large data frame
#View the resulting data frame - Part 1
alldata <- rbind(tests, training)
View(alldata)

#extract only mean and SD measurements and save to new dataframe
means <- alldata[ , grep("[Mm]ean", colnames(alldata))]
means <- means[ , -(grep("Freq", colnames(means)))]
means <- means[ , -(grep("gravity", colnames(means)))]
sd <- alldata[ , grep("[Ss]td", colnames(alldata))]
meansd <- data.frame(alldata[ ,1:2], means, sd)

#change values from y_test/train to show the activity they represent
class(meansd[,2]) <- "factor"
levels(meansd[,2]) <- c("walking", "walking upstairs","walking downstairs",
                        "sitting", "standing", "laying")

#make variable (column) names descripive and fix the 
#formatting of the existing names
columns <- colnames(meansd)
columns1 <- gsub("\\.", "", columns)
columns2 <- sub("t", "", columns1)
columns3 <- sub("BodyBody", "Body", columns2)
columns4 <- sub("Mag", "", columns3)
columns5 <- sub("std", "sd", columns4)
columns6 <- sub("X", "_x", columns5)
columns7 <- sub("Y", "_y", columns6)
columns8 <- sub("Z", "_z", columns7)
columns9 <- sub("BodyAccmean", "mean_body_acc", columns8)
columns10 <- sub("GravityAccmean", "mean_gravity_acc", columns9)
columns11 <- sub("BodyAccJerkmean", "mean_body_acc_jerk", columns10)
columns12 <- sub("BodyGyromean", "mean_body_orient", columns11)
columns13 <- sub("BodyGyroJerkmean", "mean_body_orient_jerk", columns12)
columns14 <- sub("BodyAccsd", "sd_body_acc", columns13)
columns15 <- sub("GravityAccsd", "sd_gravity_acc", columns14)
columns16 <- sub("BodyAccJerksd", "sd_body_acc_jerk", columns15)
columns17 <- sub("BodyGyrosd", "sd_body_orient", columns16)
columns18 <- sub("BodyGyroJerksd", "sd_body_orient_jerk", columns17)
columns19 <- sub("f", "f_", columns18)
columns20 <- sub("subjecID", "subjectid", columns19)
columns21 <- sub("acivitycode", "activity", columns20)
colnames(meansd) <- columns21

#View the dataset, which meets criteria for Parts 2, 3, and 4
View(meansd)

#make a second tidy dataset with average of each variable for each
#activity and subject
library(stats)
new <- aggregate(meansd, by = list(activity = meansd$activity, 
                                   subjectid = meansd$subjectid), mean)
new1 <- new[ , -(3:4)]
tidydata <- new1[ , c(2, 1, 3:68)]
class(tidydata[,2]) <- "factor"
levels(tidydata[,2]) <- c("walking", "walking upstairs","walking downstairs",
                          "sitting", "standing", "laying")

#save the tidy dataset as .txt
write.table(tidydata, file = "./tidy_dataset.txt", row.names = FALSE)

#View tidy dataset - Part 5
View(tidydata)