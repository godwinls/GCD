# Getting and Cleaning Data Final Project Cookbook

## The Original Data

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The features selected for this database come originally from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated in the original data set from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

### Notes

- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

## The Tidy data set

The tidy data set get from this run_analysis.R script includes the average of each measured variable for each activity and each subject as following:


 [1] "Subject"                                "Activity"                               "tBodyAcc-mean-X.AVG"                   
 [4] "tBodyAcc-mean-Y.AVG"                    "tBodyAcc-mean-Z.AVG"                    "tBodyAcc-std-X.AVG"                    
 [7] "tBodyAcc-std-Y.AVG"                     "tBodyAcc-std-Z.AVG"                     "tGravityAcc-mean-X.AVG"                
[10] "tGravityAcc-mean-Y.AVG"                 "tGravityAcc-mean-Z.AVG"                 "tGravityAcc-std-X.AVG"                 
[13] "tGravityAcc-std-Y.AVG"                  "tGravityAcc-std-Z.AVG"                  "tBodyAccJerk-mean-X.AVG"               
[16] "tBodyAccJerk-mean-Y.AVG"                "tBodyAccJerk-mean-Z.AVG"                "tBodyAccJerk-std-X.AVG"                
[19] "tBodyAccJerk-std-Y.AVG"                 "tBodyAccJerk-std-Z.AVG"                 "tBodyGyro-mean-X.AVG"                  
[22] "tBodyGyro-mean-Y.AVG"                   "tBodyGyro-mean-Z.AVG"                   "tBodyGyro-std-X.AVG"                   
[25] "tBodyGyro-std-Y.AVG"                    "tBodyGyro-std-Z.AVG"                    "tBodyGyroJerk-mean-X.AVG"              
[28] "tBodyGyroJerk-mean-Y.AVG"               "tBodyGyroJerk-mean-Z.AVG"               "tBodyGyroJerk-std-X.AVG"               
[31] "tBodyGyroJerk-std-Y.AVG"                "tBodyGyroJerk-std-Z.AVG"                "tBodyAccMag-mean.AVG"                  
[34] "tBodyAccMag-std.AVG"                    "tGravityAccMag-mean.AVG"                "tGravityAccMag-std.AVG"                
[37] "tBodyAccJerkMag-mean.AVG"               "tBodyAccJerkMag-std.AVG"                "tBodyGyroMag-mean.AVG"                 
[40] "tBodyGyroMag-std.AVG"                   "tBodyGyroJerkMag-mean.AVG"              "tBodyGyroJerkMag-std.AVG"              
[43] "fBodyAcc-mean-X.AVG"                    "fBodyAcc-mean-Y.AVG"                    "fBodyAcc-mean-Z.AVG"                   
[46] "fBodyAcc-std-X.AVG"                     "fBodyAcc-std-Y.AVG"                     "fBodyAcc-std-Z.AVG"                    
[49] "fBodyAcc-meanFreq-X.AVG"                "fBodyAcc-meanFreq-Y.AVG"                "fBodyAcc-meanFreq-Z.AVG"               
[52] "fBodyAccJerk-mean-X.AVG"                "fBodyAccJerk-mean-Y.AVG"                "fBodyAccJerk-mean-Z.AVG"               
[55] "fBodyAccJerk-std-X.AVG"                 "fBodyAccJerk-std-Y.AVG"                 "fBodyAccJerk-std-Z.AVG"                
[58] "fBodyAccJerk-meanFreq-X.AVG"            "fBodyAccJerk-meanFreq-Y.AVG"            "fBodyAccJerk-meanFreq-Z.AVG"           
[61] "fBodyGyro-mean-X.AVG"                   "fBodyGyro-mean-Y.AVG"                   "fBodyGyro-mean-Z.AVG"                  
[64] "fBodyGyro-std-X.AVG"                    "fBodyGyro-std-Y.AVG"                    "fBodyGyro-std-Z.AVG"                   
[67] "fBodyGyro-meanFreq-X.AVG"               "fBodyGyro-meanFreq-Y.AVG"               "fBodyGyro-meanFreq-Z.AVG"              
[70] "fBodyAccMag-mean.AVG"                   "fBodyAccMag-std.AVG"                    "fBodyAccMag-meanFreq.AVG"              
[73] "fBodyBodyAccJerkMag-mean.AVG"           "fBodyBodyAccJerkMag-std.AVG"            "fBodyBodyAccJerkMag-meanFreq.AVG"      
[76] "fBodyBodyGyroMag-mean.AVG"              "fBodyBodyGyroMag-std.AVG"               "fBodyBodyGyroMag-meanFreq.AVG"         
[79] "fBodyBodyGyroJerkMag-mean.AVG"          "fBodyBodyGyroJerkMag-std.AVG"           "fBodyBodyGyroJerkMag-meanFreq.AVG"     
[82] "angletBodyAccMean,gravity.AVG"          "angletBodyAccJerkMean,gravityMean.AVG"  "angletBodyGyroMean,gravityMean.AVG"    
[85] "angletBodyGyroJerkMean,gravityMean.AVG" "angleX,gravityMean.AVG"                 "angleY,gravityMean.AVG"                
[88] "angleZ,gravityMean.AVG"

## Processing

* Merges the training and the test sets to create one data set.
* put all the data in one data frame
* get the column names and assign them to the data set
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Add "Subject" and "Activity" two columns to the data set
* remove the "(" and ")" in the label names
* Using ddply() to create the tidy data set with the average of each variable for each activity and each subject.
* Add ".AVG" to the data set column names
* write to the txt file
