## Coursera Course Project: Getting and Cleaning Data

(This project is done as part of the Coursera Getting and Cleaning Data course requirement.)

This README file explains what you need to do to run the `run_analysis.R` script and all the steps performed in the script.

## How to Run

1. Download the data set from this address: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unzip the downloaded data and put the `UCI HAR Dataset` folder in the same folder as `run_analysis.R` script. 

3. Run the `run_analysis.R` script.

4. Script will create a new text file `tidy_data_set`. This file contains the mean (average) for each of the variables in the original data set for each activity and subject combination. Data set has 180 observations and 81 variables. 


## Script Explanation

The following is an explanation of each part of the `run_analysis.R` script.

Part 1: Install and load melt and dcast packages using the reshape2 package. 

Part 2: Load the Activity Labels and Features data sets to R

Part 3: Extract the measurements on the mean and standard deviation for each measurement

Part 4: Load Test data set and Train data set to R and merge them

Part 5: Converting the Activity and Subject into factors (Factoring)

Part 6: Outputs the tidy data set (`tidy_data_set.txt`) which has the mean value of each of the variables for each combination of Activity and Subject.