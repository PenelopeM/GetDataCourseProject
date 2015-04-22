# GetDataCourseProject
Course Project for the Getting and Cleaning Data Course from Coursera

## the following code assumes that you have downloaded the zip file from the url https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## that you extracted the data and set your working directory in R to the 'UCI HAR Dataset' folder using the 
## setwd() function

## Load necessary libraries
library(dplyr)

## Load the X_test data
X_test <- read.table('test//X_test.txt')

## Load the X_train data
X_train <- read.table('train//X_train.txt')

## Create a new data set by binding the test and train data with rbind()
X_data <- rbind(X_test, X_train)

## Load the features data
features <- read.table('features.txt')

## Set the column names of the X_data data frame to the feature names
colnames(X_data) <- features[,2]

## Select the columns that contain the data for mean and standard deviation
## create a new vector containing only the features to keep
feat <- as.vector(features[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543),2])
## create a new data frame containing only these features
X_select <- X_data[feat]

## Load the Y_test data
Y_test <- read.table('test//y_test.txt')

## Load the Y_train data
Y_train <- read.table('train//y_train.txt')

## Create a new Y_data variable by binding the test and train data with rbind()
Y_data <- rbind(Y_test, Y_train)

## Name the vector Y 'activity_index'
names(Y_data) <- 'activity_index'

## Add the Y data to the right of the X data
data <- cbind(Y_data, X_select)

## Load the names and indexes of the activities
activity <- read.table('activity_labels.txt')

## Name the columns of the activity data frame
names(activity) <- c('activity_index', 'activity')

## Merge the data with the activities so that we have the name of the activities and not just indexes
data_act <- merge(activity, data)

## Select the columns to keep after the merge (i.e. remove index columns)
data_act <- select(data_act, 2:68, -3)
