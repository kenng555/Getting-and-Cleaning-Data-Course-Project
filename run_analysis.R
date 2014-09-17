## Read in Activity Labels
activity_labels <- read.table("activity_labels.txt", header = F)

## Assign Column Heading for Activity Labels
colnames(activity_labels) <- c("Activity_Code","Activity_Name")

## Read in Features
features <- read.table("features.txt", header = F)

## Assign Column Heading for Features
colnames(features) <- c("feature_code", "feature_desc")
feature_names <- features[,2]

## *********** Process Training Information *************************************
## Read in Train Set
train_set <- read.table("train/X_train.txt", header = F)

## Assign feature names to column names
colnames(train_set) <- feature_names

## Read in Train Activities
train_activities <- read.table("train/y_train.txt", header = F)

## Assign Column Heading
colnames(train_activities) <- "Activity_Code"

## Read in Subjects Trained
subject_train <- read.table("train/subject_train.txt", header = F)

## Assign Column Heading
colnames(subject_train) <- "Subject"

## Create Training Result by combining Subject Trained, Trained Activity and Training Data Set
train_results <- cbind(subject_train, train_activities, train_set[,1:6])

## Merge Activity Labels with Trained Results
train_results <- merge(activity_labels, train_results, by = "Activity_Code")

## Re-arrange Columns (Subject,Activity Code, Activity Name, x-y-z means, x-y-z stds)
train_results <- train_results[,c(3,1,2,4:9)]

## Sort the results by Subject/Activity Code
train_results <- train_results[order(train_results$Subject, train_results$Activity_Code),]

## Create Data Set with the average of each variables for each Subject and Activity
tidy_train_means <- aggregate(train_results[,4:9], by=train_results[c(1,2,3)],FUN = mean)
tidy_train_means <- tidy_train_means[order(tidy_train_means$Subject, tidy_train_means$Activity_Code),]

## Write to output table
write.table(tidy_test_means, file = "tidy_test_means.csv", sep = ",", row.names = F)

## *********** Process Test Information *************************************
## Read in Test Set
test_set <- read.table("test/X_test.txt", header = F)

## Assign feature names to column names
colnames(test_set) <- feature_names

## Read in Test Activities
test_activities <- read.table("test/y_test.txt", header = F)

## Assign Column Heading
colnames(test_activities) <- "Activity_Code"

## Read in Subjects Tested
subject_test <- read.table("test/subject_test.txt", header = F)

## Assign Column Heading
colnames(subject_test) <- "Subject"

## Create Training Result by combining Subject Trained, Trained Activity and Training Data Set
test_results <- cbind(subject_test, test_activities, test_set[,1:6])

## Merge Activity Labels with Test Results
test_results <- merge(activity_labels, test_results, by = "Activity_Code")

## Re-arrange Columns (Subject,Activity Code, Activity Name, x-y-z means, x-y-z stds)
test_results <- test_results[,c(3,1,2,4:9)]

## Sort the results by Subject/Activity Code
test_results <- test_results[order(test_results$Subject, test_results$Activity_Code),]

## Create Data Set with the average of each variables for each Subject and Activity
tidy_test_means <- aggregate(test_results[,4:9], by=test_results[c(1,2,3)],FUN = mean)
tidy_test_means <- tidy_test_means[order(tidy_test_means$Subject, tidy_test_means$Activity_Code),]

## Write to output table
write.table(tidy_train_means, file = "tidy_train_means.csv", sep = ",", row.names = F)