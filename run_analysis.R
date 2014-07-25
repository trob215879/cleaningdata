# run_analysis.r formats the data from the "Human Activity Recognition Using Smartphones" dataset.
# It takes the following files from "getdata-projectfiles-UCI HAR Dataset.zip" and formats
# it into one "easier to read" data file.  The data and the labels for the data are in various files listed below.
# These input files are essential for this script to operate.
# 
# - 'features.txt': List of all features.  Each feature corresponds to a column in X_test.txt and X_Train.txt.
# 
# - 'activity_labels.txt': Contains the name of the activity performed by the subjects.  We base our row names off of them.
# 
# - 'train/X_train.txt': Training set that contains the numerical data for training subjects.
# 
# - 'test/X_test.txt': Testing set that contains the numerical data for the testing subjects.
# 
# We extract only those columns that have either "mean()" or "std()" in their names from the X_train and X_test set
# 
# The path_prefix indicates the path where the data files can be found.
# The fname_suffix indicates the file name suffix to be used to create the complete file name.
# 
# Subsetting is done early on to help reduce memory requirements.
#Extracts only the measurements on the mean and standard deviation for each measurement.

# Step 1:  Get the column indexes of all the feature means & standard deviations. 
features <- read.table("features.txt") 
std_features <- grep('std()', features[,2])
mean_features <- grep('mean()', features[,2])
headers <- features[,2]


#Step 2a: READING DATA FROM TEST AND TRAINING SETS
X_test <- read.table(".\\test\\X_test.txt")
X_train <- read.table(".\\train\\X_train.txt")
names(X_test) <- headers
names(X_train) <- headers


#Step 2b: SUBSETTING STANDARD DEVIATION AND MEAN FEATURES
std_X_test <- X_test[,std_features]
mean_X_test <- X_test[,mean_features]

#step 2c: ADDING ACTIVITY ROW NAMES
activity_labels <- read.table("activity_labels.txt", header=F, as.is=T, col.names=c("ActivityID", "ActivityName"))
activity_labels$ActivityName <- as.factor(activity_labels$ActivityName)
std_data_labeled <- merge(activity_labels, std_X_test)

#Step 2d: Combine into one X testing data set
X_test_cdata <- cbind(std_data_labeled, mean_X_test)

#Step 2e: ADDING ACTIVITY ROW NAMES TO TRAINING DATA
std_X_train <- X_train[,std_features]
mean_X_train <- X_train[,mean_features]
std_data_labeled_train <- merge(activity_labels, std_X_train)
X_train_cdata <- cbind(std_data_labeled_train, mean_X_train)

#Step 2f: Combine the test and trainng data
dataset <- rbind(X_test_cdata, X_train_cdata)

#Step 2g: Capitalize Mean in Column names
cname <- colnames(dataset)
a <- sub("mean", "Mean", names(dataset),)
colnames(dataset) <- a

#Step 2h: Capitalize STD in Coulumn names
cname <- colnames(dataset)
a <- sub("std", "STD", names(dataset),)
colnames(dataset) <- a

#Step 2i: Add SubjectID column
SubjectID <- rep(1:nrow(dataset), each=6)
dataset <- cbind(SubjectID, dataset)


mean_dataset <- sapply(dataset[,4:ncol(dataset)], mean, na.rm=TRUE)
std_dataset <- sapply(dataset[,4:ncol(dataset)], sd, na.rm=TRUE)

write.table(scrum[2:180,], "tidy_data.txt", row.names=FALSE)
write.xlsx(scrum[2:180,], "tidy_data.xlsx", row.names=FALSE)

