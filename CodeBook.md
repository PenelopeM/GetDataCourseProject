Study Design

Step 1:
I downloaded the zip file of the following URL to my computer and saved it in the desired folder (this can be any folder of your choice)

file url : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Step 2:
I unzipped the file and set my working directory in R to the unzipped directory with the setwd() command.
(my working directory is now 'UCI HAR Dataset'

The files contained in this directory are :
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt'
- 'train/Inertial Signals/total_acc_x_train.txt' (and y and z for all folders below)
- 'train/Inertial Signals/body_acc_x_train.txt'
- 'train/Inertial Signals/body_gyro_x_train.txt'
- 'test/Inertial Signals/total_acc_x_train.txt'
- 'test/Inertial Signals/body_acc_x_train.txt'
- 'test/Inertial Signals/body_gyro_x_train.txt'

Step 3:
I loaded the X_test and X_train data into R (using read.table()) and then used rbind() to create one data set which I named X_data.

Step 4:
I loaded the features into R (using read.table()).
I defined the column names of the X_data data frame as the features using colnames()

Step 5:
I studied the 'features.txt' file in order to choose which measurements to extract and keep in my tidy data.
I decided only to select measurements that had both a mean and standard deviation and so decided to leave any other measurements of mean (e.g. 559 angle(X,gravityMean))
I chose to keep the following measurements:
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
41 tGravityAcc-mean()-X
42 tGravityAcc-mean()-Y
43 tGravityAcc-mean()-Z
44 tGravityAcc-std()-X
45 tGravityAcc-std()-Y
46 tGravityAcc-std()-Z
81 tBodyAccJerk-mean()-X
82 tBodyAccJerk-mean()-Y
83 tBodyAccJerk-mean()-Z
84 tBodyAccJerk-std()-X
85 tBodyAccJerk-std()-Y
86 tBodyAccJerk-std()-Z
121 tBodyGyro-mean()-X
122 tBodyGyro-mean()-Y
123 tBodyGyro-mean()-Z
124 tBodyGyro-std()-X
125 tBodyGyro-std()-Y
126 tBodyGyro-std()-Z
161 tBodyGyroJerk-mean()-X
162 tBodyGyroJerk-mean()-Y
163 tBodyGyroJerk-mean()-Z
164 tBodyGyroJerk-std()-X
165 tBodyGyroJerk-std()-Y
166 tBodyGyroJerk-std()-Z
201 tBodyAccMag-mean()
202 tBodyAccMag-std()
214 tGravityAccMag-mean()
215 tGravityAccMag-std()
227 tBodyAccJerkMag-mean()
228 tBodyAccJerkMag-std()
240 tBodyGyroMag-mean()
241 tBodyGyroMag-std()
253 tBodyGyroJerkMag-mean()
254 tBodyGyroJerkMag-std()
266 fBodyAcc-mean()-X
267 fBodyAcc-mean()-Y
268 fBodyAcc-mean()-Z
269 fBodyAcc-std()-X
270 fBodyAcc-std()-Y
271 fBodyAcc-std()-Z
345 fBodyAccJerk-mean()-X
346 fBodyAccJerk-mean()-Y
347 fBodyAccJerk-mean()-Z
348 fBodyAccJerk-std()-X
349 fBodyAccJerk-std()-Y
350 fBodyAccJerk-std()-Z
424 fBodyGyro-mean()-X
425 fBodyGyro-mean()-Y
426 fBodyGyro-mean()-Z
427 fBodyGyro-std()-X
428 fBodyGyro-std()-Y
429 fBodyGyro-std()-Z
503 fBodyAccMag-mean()
504 fBodyAccMag-std()
516 fBodyBodyAccJerkMag-mean()
517 fBodyBodyAccJerkMag-std()
529 fBodyBodyGyroMag-mean()
530 fBodyBodyGyroMag-std()
542 fBodyBodyGyroJerkMag-mean()
543 fBodyBodyGyroJerkMag-std()

Step 6: 
Using the index of the measurements I wanted to keep I created a vector with those values and then selected the columns of X_data based on that vector

Step 7:
Load the Y_test and Y_train data in R using read.table(). Then use rbind() to create a Y_data for the complete set of data

Step 8:
Name the column of Y 'activity_index' and bind it to the X data using cbind().

Step 9:
Load the activities table and name the columns of the table 'activity_index' and 'activity'

Step 10:
Merge the the activities table with the complete data and then select all columns except the activity_index columns.

Step 11:
Clean the column names.
For this project as the data is complexe and the names even more so I have chosen to keep the actual text.
If I had chosen to replace the abreviations by the complete word the table would become unreadable.
For this reason I have chosen simply to remove the () in each column name.

