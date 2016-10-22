### Codebook for tidyData.txt

Each row has 81 variables as described below:


1   SubjectID : Values from 1-30 indicating the subject ID used for which the observation pertains to.
                The data is sorted on SubjectID. 6 entries are expected for each SubjectID summarizing
                each of the 6 activities.

2   Activity : Indicates the Activity of the SubjectID for the observation. There are 6 valid values:
               LAYING
               SITTING
               STANDING
               WALKING
               WALKING_DOWNSTAIRS
               WALKING_UPSTAIRS

               The data is sorted on Activity for each SubjectID

Columns 3 through 81 below store the calculated mean for the indicated parameter (feature) for a given
SubjectID-Activity combination. The feature name is obtained from features.txt file in the raw data.
The detailed measurements of each feature can be obtained from features_info.txt in the raw data set.

~~~~

3   tBodyAccMean-X 
4   tBodyAccMean-Y 
5   tBodyAccMean-Z 
6   tBodyAccStdev-X 
7   tBodyAccStdev-Y 
8   tBodyAccStdev-Z 
9   tGravityAccMean-X 
10   tGravityAccMean-Y 
11   tGravityAccMean-Z 
12   tGravityAccStdev-X 
13   tGravityAccStdev-Y 
14   tGravityAccStdev-Z 
15   tBodyAccJerkMean-X 
16   tBodyAccJerkMean-Y 
17   tBodyAccJerkMean-Z 
18   tBodyAccJerkStdev-X 
19   tBodyAccJerkStdev-Y 
20   tBodyAccJerkStdev-Z 
21   tBodyGyroMean-X 
22   tBodyGyroMean-Y 
23   tBodyGyroMean-Z 
24   tBodyGyroStdev-X 
25   tBodyGyroStdev-Y 
26   tBodyGyroStdev-Z 
27   tBodyGyroJerkMean-X 
28   tBodyGyroJerkMean-Y 
29   tBodyGyroJerkMean-Z 
30   tBodyGyroJerkStdev-X 
31   tBodyGyroJerkStdev-Y 
32   tBodyGyroJerkStdev-Z 
33   tBodyAccMagMean 
34   tBodyAccMagStdev 
35   tGravityAccMagMean 
36   tGravityAccMagStdev 
37   tBodyAccJerkMagMean 
38   tBodyAccJerkMagStdev 
39   tBodyGyroMagMean 
40   tBodyGyroMagStdev 
41   tBodyGyroJerkMagMean 
42   tBodyGyroJerkMagStdev 
43   fBodyAccMean-X 
44   fBodyAccMean-Y 
45   fBodyAccMean-Z 
46   fBodyAccStdev-X 
47   fBodyAccStdev-Y 
48   fBodyAccStdev-Z 
49   fBodyAccMeanFreq-X 
50   fBodyAccMeanFreq-Y 
51   fBodyAccMeanFreq-Z 
52   fBodyAccJerkMean-X 
53   fBodyAccJerkMean-Y 
54   fBodyAccJerkMean-Z 
55   fBodyAccJerkStdev-X 
56   fBodyAccJerkStdev-Y 
57   fBodyAccJerkStdev-Z 
58   fBodyAccJerkMeanFreq-X 
59   fBodyAccJerkMeanFreq-Y 
60   fBodyAccJerkMeanFreq-Z 
61   fBodyGyroMean-X 
62   fBodyGyroMean-Y 
63   fBodyGyroMean-Z 
64   fBodyGyroStdev-X 
65   fBodyGyroStdev-Y 
66   fBodyGyroStdev-Z 
67   fBodyGyroMeanFreq-X 
68   fBodyGyroMeanFreq-Y 
69   fBodyGyroMeanFreq-Z 
70   fBodyAccMagMean 
71   fBodyAccMagStdev 
72   fBodyAccMagMeanFreq 
73   fBodyBodyAccJerkMagMean 
74   fBodyBodyAccJerkMagStdev 
75   fBodyBodyAccJerkMagMeanFreq 
76   fBodyBodyGyroMagMean 
77   fBodyBodyGyroMagStdev 
78   fBodyBodyGyroMagMeanFreq 
79   fBodyBodyGyroJerkMagMean 
80   fBodyBodyGyroJerkMagStdev 
81   fBodyBodyGyroJerkMagMeanFreq

~~~~
