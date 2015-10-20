setwd("D:/R/Getting and Cleaning Data/")

# Part 1: Install melt and dcast packages
install.packages("reshape2")
library(reshape2)

# Loading Activity Labels and Features data sets to R
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
act_labels[,2] <- as.character(act_labels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extracting only the measurements on the mean and standard deviation for each measurement
features_ext <- grep(".*mean.*|.*std.*", features[,2])
features_ext.names <- features[features_ext,2]
features_ext.names = gsub('-mean', 'Mean', features_ext.names)
features_ext.names = gsub('-std', 'Std', features_ext.names)
features_ext.names <- gsub('[-()]', '', features_ext.names)

# Loading Test and Train data sets to R and merging them
train_X <- read.table("UCI HAR Dataset/train/X_train.txt")[features_ext]
train_Y <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train_subject, train_Y, train_X)
test_X <- read.table("UCI HAR Dataset/test/X_test.txt")[features_ext]
test_Y <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_subject, test_Y, test_X)
test_train <- rbind(train, test)
colnames(test_train) <- c("Subject", "Activity", features_ext.names)

# Factoring
test_train$Activity <- factor(test_train$Activity, levels = act_labels[,1], labels = act_labels[,2])
test_train$Subject <- as.factor(test_train$subject)

test_train.melted <- melt(test_train, id = c("Subject", "Activity"))
test_train.mean <- dcast(test_train.melted, Subject + Activity ~ variable, mean)

# Exporting the tidy data set
write.table(test_train.mean, "tidy_data_set.txt", row.names = FALSE, quote = FALSE)