Background on Data (from README.txt file in the UCI HAR Dataset)
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

Variables and Definitions

subject_id (30 values) - Each integer represents the subject used for the study (30 subjects total). 
  1-30
  
activity (6 values) - Activity undertaken while data was measured. 
  walking
  walking_upstairs
  walking_downstairs
  sitting
  standing
  laying
  
Features (from features_info.txt file in the UCI HAR Dataset)
"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."

All measurements containing "Acc" comes from the accelerometer. 
All measurements containing "Gyro" comes from the gyroscope. 
All measurements containing "Body" measure movements of the body. 
All measurements containing "Gravity" measure movements due to gravity. 
X, Y, Z measurements denote 3-axial signals in the X, Y, Z directions. 

tBodyAcc-mean()-X/Y/Z
tBodyAcc-std()-X/Y/Z
tGravityAcc-mean()-X/Y/Z
tGravityAcc-std()-X/Y/Z
tBodyAccJerk-mean()-X/Y/Z
tbodyAccJerk-std()-X/Y/Z
tbodyGyro-mean()-X/Y/Z
tbodyGyro-std()-X/Y/Z
tbodyGyroJerk-mean()-X/Y/Z
tbodyGyroJerk-std()-X/Y/Z
tBodyAccMag-mean()
tBodyAccMag-std() 
tGravityAccMag-mean() 
tGravityAccMag-std() 
tBodyAccJerkMag-mean() 
tBodyAccJerkMag-std()
tBodyGyroMag-mean()  
tBodyGyroMag-std() 
tBodyGyroJerkMag-mean() 
tBodyGyroJerkMag-std() 
fBodyAcc-mean()-X/Y/Z 
fBodyAcc-std()-X/Y/Z
fBodyAccJerk-mean()-X/Y/Z
fBodyAccJerk-std()-X/Y/Z 
fBodyGyro-mean()-X/Y/Z
fBodyGyro-std()-X/Y/Z
fBodyAccMag-mean()  
fBodyAccMag-std() 
fBodyBodyAccJerkMag-mean() 
fBodyBodyAccJerkMag-std() 
fBodyBodyGyroMag-mean()  
fBodyBodyGyroMag-std() 
fBodyBodyGyroJerkMag-mean()  
fBodyBodyGyroJerkMag-std()  
