==================================================================
Codebook for course project of Coursera class "Getting and Cleaning Data"
==================================================================

The tidy data set "tidedata.txt" is generated from the "Human Activity Recognition Using Smartphones" data set [1] via the script "run\_analysis.R". This script performs the following:
- combines the HAR test and training datasets, 

- extracts only the features based directly on the functions mean() and std() of each measurement from the original data (note: it _does not_ consider other features which may have the word 'mean' in them),

- adds descriptive activity names to the data set, 

- labels the data set with descriptive variable names based on the original source data names (but cleaned up to fit R syntax and rename all appearances of the erroneous expression 'BodyBody' with 'Body')

- creates the tidy data set "tidydata.txt" with the average of each variable for each (subject,activity) combination

Thus, the observations in the tidy data set consist of the average of all 'mean' and 'std' feature values from the original data, for each subject and each activity type.


### Variable descriptions:

There are 69 variables. The first three are:

- SubjectLabel: number from 1-30 representing different subjects collecting experimental data
- ActivityLabel: number from 1-6 representing different activity types
- ActivityName: readable name for the 6 different activity types. 
  * 1="Walking": walking (flat ground) 
  * 2="WalkingUp": walking upstairs
  * 3="WalkingDown": walking downstairs 
  * 4="Sitting"
  * 5="Standing"
  * 6="Laying"

The remaining variable descriptions are all the same as in the original data (see below), except that we subset only those features which involved either the mean or std functions. The variable names have also been cleaned up into legal R variable names (specifically, removed brackets, and converted '-' to '.').

The full list of variables appearing in the tidy data set are (see below for naming conventions, taken from original source):

- SubjectLabel
- ActivityLabel
- ActivityName
- tBodyAcc.mean.X
- tBodyAcc.mean.Y
- tBodyAcc.mean.Z
- tBodyAcc.std.X
- tBodyAcc.std.Y
- tBodyAcc.std.Z
- tGravityAcc.mean.X
- tGravityAcc.mean.Y
- tGravityAcc.mean.Z
- tGravityAcc.std.X
- tGravityAcc.std.Y
- tGravityAcc.std.Z
- tBodyAccJerk.mean.X
- tBodyAccJerk.mean.Y
- tBodyAccJerk.mean.Z
- tBodyAccJerk.std.X
- tBodyAccJerk.std.Y
- tBodyAccJerk.std.Z
- tBodyGyro.mean.X
- tBodyGyro.mean.Y
- tBodyGyro.mean.Z
- tBodyGyro.std.X
- tBodyGyro.std.Y
- tBodyGyro.std.Z
- tBodyGyroJerk.mean.X
- tBodyGyroJerk.mean.Y
- tBodyGyroJerk.mean.Z
- tBodyGyroJerk.std.X
- tBodyGyroJerk.std.Y
- tBodyGyroJerk.std.Z
- tBodyAccMag.mean
- tBodyAccMag.std
- tGravityAccMag.mean
- tGravityAccMag.std
- tBodyAccJerkMag.mean
- tBodyAccJerkMag.std
- tBodyGyroMag.mean
- tBodyGyroMag.std
- tBodyGyroJerkMag.mean
- tBodyGyroJerkMag.std
- fBodyAcc.mean.X
- fBodyAcc.mean.Y
- fBodyAcc.mean.Z
- fBodyAcc.std.X
- fBodyAcc.std.Y
- fBodyAcc.std.Z
- fBodyAccJerk.mean.X
- fBodyAccJerk.mean.Y
- fBodyAccJerk.mean.Z
- fBodyAccJerk.std.X
- fBodyAccJerk.std.Y
- fBodyAccJerk.std.Z
- fBodyGyro.mean.X
- fBodyGyro.mean.Y
- fBodyGyro.mean.Z
- fBodyGyro.std.X
- fBodyGyro.std.Y
- fBodyGyro.std.Z
- fBodyAccMag.mean
- fBodyAccMag.std
- fBodyAccJerkMag.mean
- fBodyAccJerkMag.std
- fBodyGyroMag.mean
- fBodyGyroMag.std
- fBodyGyroJerkMag.mean
- fBodyGyroJerkMag.std

--------------------------------------------------

### Relevant details from original data source [1]:

#### For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### The dataset includes the following files:

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

#### Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

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

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

### References
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012. Original data available at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
