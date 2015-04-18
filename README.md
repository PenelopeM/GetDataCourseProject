# GetDataCourseProject
Course Project for the Getting and Cleaning Data Course from Coursera

## the following code assumes that you have downloaded the zip file from the url https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
## that you extracted the data and set your working directory in R to the 'UCI HAR Dataset' folder using the 
## setwd() function

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
