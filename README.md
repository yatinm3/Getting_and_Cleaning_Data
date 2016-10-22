# Getting and Cleaning Data
Final project submission for Coursera Getting and Cleaning Data course

## Introduction

The purpose of the final project submission for the Getting and Cleaning Data course 
is to demonstrate ability to work with a fragmented, real-life, unclean data set and 
convert it into a tidy data set that can be easily processed further on by a statistician
or other interested party.

This submission delivers the following components:

1. A pointer to the raw data set.
2. A tidy data set uploaded to the coursera website and the github repository.
3. A code book CODEBOOK.md describing the variables and values in the tidy data set.
4. The exact recipe in the form of R script and other relevant notes in this README.md
   file specifying the road from 1 ->2, 3.

## The raw data

The data set is made available by Smartlab - Non Linear Complex Systems Laboratory,
DITEN - University, Genoa, Italy. Details about the experiments behind the dataset are
available in the following publication:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support 
Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). 
Vitoria-Gasteiz, Spain. Dec 2012

The data source for this assignment was:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It was downloaded on Fri, October 21, 2016 at approximately 7PM US/Pacific Time.

The zip file contains data in several underlying files. The notes for the recipe provide 
more details.


## The tidy data set

The general principles used in the creation of the tidy data set are based on the work of
[Hadley Wickham](http://had.co.nz/) in [this paper](http://vita.had.co.nz/papers/tidy-data.pdf)
in the Journal of Statistical Software. 

The final output is in a file tidyData.txt uploaded to the Coursera website and the Github
repository associated with this readme file.

The tidy dataset created follows the recommendations made in section 2.3 of the aforementioned
paper:
- Each variable forms a column
- Each observation forms a row
- Each type of observational unit forms a table

Accordingly: 
- Only one table, as required in the assignment, is stored in tidyData.txt. 
- The first row of the file specifies meaningful column headings as detailed in the codebook.
  Each variable is in it's own column
- Each observation is in it's own separate row

The final tidy dataset (tidyData.txt) was created off of another interim tidy dataset
mergedData.txt which is the result of merging and cleaning the untidy raw data. This interim 
dataset is also made available on github repo since it can be the source for other 
transformations not required by the assignment.

The final tidy data set can be read back into an R session for examination using the following 
commands:

~~~~
tidy_df <- read.table("tidyData.txt", header = TRUE)
str(tidy_df)
'data.frame':	180 obs. of  81 variables:
 $ SubjectID                   : int  1 1 1 1 1 1 2 2 2 2 ...
[...further output from str deleted for brevity ....]

names(tidy_df)
 [1] "SubjectID"                    "Activity"                     "tBodyAccMean-X"              
 [4] "tBodyAccMean-Y"               "tBodyAccMean-Z"               "tBodyAccStdev-X"            
[...further output from names deleted for brevity ....]
~~~~

## Codebook
There are 180 observations of 81 variables in the tidy data set. The CODEBOOK.md file in 
the associated github repo discusses these in details.


## The Recipe
The exact recipe is document by the R script in the associated repo:  *run_analysis.R*

The raw data from the zip file is made available in several directories and files. Only the
8 files mentioned in the R script are used as raw data. All the other files are treated
as informational and are ignored by run_analysis.R

As required by the assignment, only the relevant columns (with mean and std headings) are
extracted by the recipe. The raw data is re-arranged as follows into a single table:
~~~~
   subject_train.txt     y_train.txt        X_train.txt     
   subject_test.txt      y_test.txt         X_train.txt
~~~~

The individual components of the training and test components are merged row-wise. The
resulting components are then merged columnwise to create the merged database.

The variable names in the X database as replaced from the values in features.txt

The observations in y database (1,2,3,4,5,6) are replaced with actual activity names
contained in activity_labels.txt

The resultant data is an interim tidy data source, stored as mergedData.txt

This tidy data is then grouped by SubjectID, and within that, Activity. The remaining
79 data variables are then averaged as required by the assignment. The final format
of the resulting tidy data set looks as follows:

~~~~
SubjectID           Activity tBodyAccMean.X tBodyAccMean.Y tBodyAccMean.Z tBodyAccStdev.X
        1             LAYING      0.2215982   -0.040513953    -0.11320355     -0.92805647
        1            SITTING      0.2612376   -0.001308288    -0.10454418     -0.97722901
        1           STANDING      0.2789176   -0.016137590    -0.11060182     -0.99575990
        1            WALKING      0.2773308   -0.017383819    -0.11114810     -0.28374026
        1 WALKING_DOWNSTAIRS      0.2891883   -0.009918505    -0.10756619      0.03003534
        1   WALKING_UPSTAIRS      0.2554617   -0.023953149    -0.09730200     -0.35470803
        2             LAYING      0.2813734   -0.018158740    -0.10724561     -0.97405946
        2            SITTING      0.2770874   -0.015687994    -0.10921827     -0.98682228
        2           STANDING      0.2779115   -0.018420827    -0.10590854     -0.98727189
        2            WALKING      0.2764266   -0.018594920    -0.10550036     -0.42364284
        2 WALKING_DOWNSTAIRS      0.2776153   -0.022661416    -0.11681294      0.04636668
        2   WALKING_UPSTAIRS      0.2471648   -0.021412113    -0.15251390     -0.30437641
        3             LAYING      0.2755169   -0.018955679    -0.10130048     -0.98277664
        3            SITTING      0.2571976   -0.003502998    -0.09835792     -0.97101012
        3           STANDING      0.2800465   -0.014337656    -0.10162172     -0.96674254
        3            WALKING      0.2755675   -0.017176784    -0.11267486     -0.36035673
~~~~

## The submission

Github repo: https://github.com/yatinm3/Getting_and_Cleaning_Data

Files: 
>
>        README.md (this file)
>        run_analysis.R (R script)
>        CODEBOOK.md (code book for variables)
>        mergedData.txt (Interim data - not specifically required by the assignment)
>        tidyData.txt (Final data as required by the assignment)
>

tidyData.txt also submitted on the coursera submission web page.

