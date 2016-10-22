
#################################################################################################
##
## run_analysis.R: This R script implements all the requirements in the final project for
##                 Coursera's Getting and Cleaning Data Course.
##
##  Author: Y. Majmudar
##
##  Data is read from the ZIP file indicated by fileUrl below, if required. A search for the
##  expected unzip directory is made to prevent spending time on (re)downloading/unzipping file.
##
##  This script does the following as required in the assignment:
##   1. Merges the training and the test sets to create one data set.
##   2. Extracts only the measurements on the mean and standard deviation for each measurement.
##   3. Uses descriptive activity names to name the activities in the data set.
##   4. Appropriately labels the data set with descriptive variables names.
##   5. From the data set in step 4, creates a second, independent tidy data set with the average
##      of each variable for each activity and each subject (tidyData.txt)
##
##   In addition, the script also saves the "interim" database from bullet 4 as (mergedData.txt)
##
##   Note: For implementing bullet 2, the script assumes that feature names contraining "mean" or
##         "std" should be included. The end result is mean, meanFreq and std columns are extracted
##         and included in the final tidy dataset.
##   
##################################################################################################

library(dplyr)

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destFile <- "Coursera_cleandata_final.zip"
dataDir <- "UCI HAR Dataset"

# Check if the expected data directory exists. If not, download and unzip the file
# Throw a stop error incase the download/unzip combination did not produce the expected data directory
#
if (!file.exists(dataDir)) {
 
     cat("Downloading ZIP file from web.... \n")
     download.file(fileUrl, destfile = destFile, method="curl")

     unzip(destFile)
     print("unzip done")
     
     # Did the download and unzip work as expected ?
     if(file.exists(dataDir)) stop ("ZIP file download and unzip process failed. data directory not created.")
     
} else  cat("Using existing data directory: ", dataDir, "\n")


#Create all the 8 filenames you are going to need
# Use file.path() so hat program works across OSes by choosing the correct separator "/" or "\"
activityLabelFile <- file.path(dataDir,"activity_labels.txt")
featuresFile <- file.path(dataDir,"features.txt")

trainDir <- file.path(dataDir,"train")
testDir <- file.path(dataDir,"test")

xtrainFile <- file.path(trainDir,"X_train.txt")
ytrainFile <- file.path(trainDir,"y_train.txt")
subtrainFile <- file.path(trainDir, "subject_train.txt")

xtestFile <- file.path(testDir,"X_test.txt")
ytestFile <- file.path(testDir,"y_test.txt")
subtestFile <- file.path(testDir, "subject_test.txt")


cat("Reading data files. This can take upto a couple minutes......\n")

# Read features file to figure out the relevant columns you need to store in the database
features_df <- read.table(featuresFile)
index_mean_sd <- grep("mean|std", features_df[ ,2])  # Mean and Std columns required for this assignment
names_mean_sd <- as.character(features_df[index_mean_sd, 2])

# Read the activity labels (reading, walking, ....)
activityLabel_df <- read.table(activityLabelFile)

# (Bullet 4) Read the train+test observations and Extract only the Mean and Std Dev columns
x_df <- rbind(read.table(xtrainFile),read.table(xtestFile)) [index_mean_sd]

y_df <- rbind(read.table(ytrainFile),read.table(ytestFile))
subject_df <- rbind(read.table(subtrainFile), read.table(subtestFile))

cat("Processing data......\n")


# (Bullet 1) Merge database: simple cbind since all columns same length (could make a check)
merged_df <- cbind(subject_df, y_df, x_df)


# (Bullet 4) Update the database with descriptive column/variable names
names_mean_sd <- gsub("-mean\\(\\)", "Mean", names_mean_sd)
names_mean_sd <- gsub("-std\\(\\)", "Stdev", names_mean_sd)
names_mean_sd <- gsub("-meanFreq\\(\\)", "MeanFreq", names_mean_sd)
names(merged_df) <- c("SubjectID", "Activity", as.character(names_mean_sd))


# (Bullet 3) Update the database with actvity names from activityLabel_df
merged_df$Activity <- activityLabel_df[merged_df$Activity, 2]
cat("Writing Interim mergedData.txt .....")
write.table(merged_df, "mergedData.txt", quote = FALSE, row.names = FALSE)
cat("..Done\n")

# (Bullet 5) Create a summary grouped by SubjectID and Activity
#
# Use the group_by/summarise_each flow to find the means of all the columns not in the group
#
merged_df <- group_by(merged_df, SubjectID, Activity)
merged_df <- summarise_each(merged_df, funs(mean))

# By default, group_by orderes the SubjectID 1->30 and Activity in ascending order
cat("Writing tidyData.txt .......")
write.table(merged_df, "tidyData.txt", quote = FALSE, row.names = FALSE)
cat("..Done\n")


