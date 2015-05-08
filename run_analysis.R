## Load necessary libraries
library(dplyr)

## Read in the test and train data for X and bind them by row to create one set
X_test <- read.table('test//X_test.txt')
X_train <- read.table('train//X_train.txt')
X_data <- rbind(X_test, X_train)

## Read in the features and assign them to the colum names for X
features <- read.table('features.txt')
colnames(X_data) <- features[,2]

## Select the features to keep (one with mean and sd) and create a new data frame
feat <- as.vector(features[c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543),2])
X_select <- X_data[feat]

## Load the subject data for test and train data sets and bind them by row to create one set
sub_test <- read.table('test//subject_test.txt')
sub_train <- read.table('train//subject_train.txt')
sub <- rbind(sub_test, sub_train)

## Name the Subject column
names(sub) <- 'subject'

## Column bind the subject data to the activity data
X_select <- cbind(sub, X_select)

## Load the test and train data for Y and bind them by row to create one set
Y_test <- read.table('test//y_test.txt')
Y_train <- read.table('train//y_train.txt')
Y_data <- rbind(Y_test, Y_train)

## Name the activity column
names(Y_data) <- 'activity_index'

## Bind the activity data to the measurements data by column
data <- cbind(Y_data, X_select)

## Read in the activity labels and name the columns
activity <- read.table('activity_labels.txt')
names(activity) <- c('activity_index', 'activity')

## Merge the activity labels with the data in order to have the complete activity names and not just the index
## Select only the column with complete names
data_act <- merge(activity, data)
data_act <- select(data_act, 2:68)

## Clean the column names by removing the ()
names(data_act) <- sub('\\()', '', names(data_act))

## Melt the data by activity and subject
datamelt <- melt(data_act, id = c('activity', 'subject'), measure.vars = names(data_act)[3:67])

## Cast the data by activity and subject and calculate the mean for all activity measurements.
breakdown <- dcast(datamelt, activity + subject ~ variable,mean)
