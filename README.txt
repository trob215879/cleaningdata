
Transformation details

REQUIREMENTS

Libraries: Require data.table and xlsx ibraries.

Input Files:

'features.txt': List of all features.
'activity_labels.txt': Links the class labels with their activity name.
'train/X_train.txt': Training set.
'test/X_test.txt': Test set.
OVERVIEW We want to obtain a dataset that contains the mean and standard deviations for all the measurements. Unfortunately, the raw datasets we are given do not provide a straightforward representation. The compnents of the data we want are distributed in 4 files. "features.txt" contains the name of the features measured. "activity_labels.txt" contains the names of the activities the subjects were doing when they were being measured.

"run_analysis.r" loads both testing and training data. It extracts the mean and standard deviation column names and data. It extracts the features aand makes them column headers. It extracts the activity labels and makes them row names identifying the activites measured.

There are 11 steps:

GET THE COLUMN INDEXES OF ALL FEATURE MEANS & STANDARD DEVIATIONS.
READING DATA FROM TEST AND TRAINING SETS
SUBSET STANDARD DEVIATION AND MEAN FEATURES.
ADDING ACTIVITY ROW NAMES TO TEST DATA
ADDING ACTIVITY ROW NAMES TO TRAINING DATA
COMBINING THE TEST AND TRAIN DATA SETS
CAPITALIZING "M" IN "mean" TO MAKE THE COLUMNS MORE READABLE
CAPITALIZING "STD" TO MAKE THE COLUMNS MORE READABLE
ADDING "SubjectID" IDENTIFIERS TO DATA.
TAKING MEAN AND STANDARD DEVIATION OF THE DATASET
EXPORITNG A SNIPPET OF THE DATASET TO A TXT FILE AND EXCEL FILE.

USAGE

Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder. Put run_analysis.R in the parent folder of UCI HAR Dataset, then set it as your working directory using setwd() function in RStudio.

Run source("xlsx"). (if you cannot load this lackage for some reason, comment out one 74 and line 76 in run_analysis.r.
Run source("run_analysis.R"), then it will generate a new file tiny_data.txt in your working directory.
Although not required by the assignment, it also outputs tiny_data.xlsx to present a more readable version of tiny_data.txt. Also, because for computing restraints, and por upload speeds on my network, tidy_data.txt only contains the measurements for the 1st 30 participants of the study.

"run_analysis.r" also outputs tidy_average.txt and tidy_average.xlsx. This way that data requested by the assignment can be examined more thoroughly in a file, instead of on the command line.
