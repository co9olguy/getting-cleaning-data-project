Course project for the Coursera course "Getting and Cleaning Data"
=============================

## Repository contents:

*run_analysis.R*: Script for taking the "Human Activity Recognition Using Smartphones" data set (data available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip; original source at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and converting it into a smaller (wide) tidy data set "tidydata.txt". Assumes the folder "UCI HAR DATASET" is in present working directory. 

*codebook.md*: Codebook describing variables, data and transformations performed while cleaning up the original HAR data set.

*README.md*: present readme file

## Detailed description of script:

The run_analysis.R script performs the following:
- combines the HAR test and training datasets, 

- extracts only the features based directly on the functions mean() and std() of each measurement from the original data (note: it _does not_ consider other features which may have the word 'mean' in them),

- adds descriptive activity names to the data set, 

- labels the data set with descriptive variable names based on the original source data names (but cleaned up to fit R syntax and remove some bugs)

- creates a second tidy data set "tidydata.txt" with the average of each variable for each (subject,activity) combination

### References:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
