Getting-and-Cleaning-Data-Course-Project
========================================
This repo contains an R script named "run_analysis.R".  This script will read in two sets of data related to Human Activities captured using the accelerometer and gyroscope inside a smart phone carried by the participant.  The original data set was randomly separated into two set where 70% of the volunteers was selected for generating the training data and 30% the test data.

The script will read in the various data set, process them and produce two tidy data sets that summarized the test and the training dataset respectively.  Each data set summarize and determine the average of each variables from the origial data for means and standard deviations for each unique combination of Subject and Activity.

The following are the steps performed in the R script:

1. Read in the Activity Labels and assign meaningful column names
2. Read in Features and assign meaningful column names
3. Extract feature names and store them in feature_names
4. Read in reading in the Train data set from file X_train.txt
5. Assign column name for each variable using feature names stored in feature_names 
6. Read in activities captured on y_train.txt and assign meaningful column name
7. Read in Subjects for the train variables data set from subject_train.txt and assign column name
8. Combine Subjects, Activities and the Average and Std Deviation variables on Train Data Set to form a resulting data
9. Rearrange Columns and sort by Subject and Activity
10. Summarized resulting data set to get average for each variable grouped by Subject and Activity
11. Output Summarized Data Set
12. Repeat steps 4 - 11 for test data set
