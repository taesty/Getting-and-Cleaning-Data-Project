# I used the following libraries to complete this script
library(dplyr)
library(stringr)

# Reading in the features file to see what variables we need.
features <- read.table("C:/Users/Administrator/Desktop/R Projects/UCI HAR Dataset/features.txt")

# Grab the variable indices containing mean() and std() in the name.
# This also grabbed the meanfreq() and angle() variables so I separated them out from the mean() variables.  
mean_variables <- grep("[Mm]ean()", features[,2])
meanfreq_variables <- grep("[Mm]eanFreq()", features[,2])
angle_variables <- grep("angle", features[,2])
mean_variables <- setdiff(mean_variables, meanfreq_variables)
mean_variables <- setdiff(mean_variables, angle_variables)
std_variables <- grep("[Ss]td()", features[,2])

# Get all our wanted variable indices by appending the mean() and std() variable indices together. 
wanted_variables <- sort(append(mean_variables, std_variables))

# Reading in all the necessary text files from the UCI Dataset.
train_subject <- read.table("C:/Users/Administrator/Desktop/R Projects/UCI HAR Dataset/train/subject_train.txt")
train_x <- read.table("C:/Users/Administrator/Desktop/R Projects/UCI HAR Dataset/train/x_train.txt")
train_y <- read.table("C:/Users/Administrator/Desktop/R Projects/UCI HAR Dataset/train/y_train.txt")

test_subject <- read.table("C:/Users/Administrator/Desktop/R Projects/UCI HAR Dataset/test/subject_test.txt")
test_x <- read.table("C:/Users/Administrator/Desktop/R Projects/UCI HAR Dataset/test/x_test.txt")
test_y <- read.table("C:/Users/Administrator/Desktop/R Projects/UCI HAR Dataset/test/y_test.txt")

# Subsetting just the wanted variables we identified from the features file.
updated_train_x <- train_x[, wanted_variables]
updated_test_x <- test_x[, wanted_variables]

# Labeling the columns. The variables are labeled using the wanted variable names from the features file. 
colnames(train_subject) <- "subject_id"
colnames(train_y) <- "activity"
colnames(updated_train_x) <- as.vector(features[wanted_variables, 2])

colnames(test_subject) <- "subject_id"
colnames(test_y) <- "activity"
colnames(updated_test_x) <- as.vector(features[wanted_variables, 2])

# First, column bind the individual subject, x, y tables into the training set and the test set. 
# Then combine the two data sets together using row bind. 
train_set <- cbind(train_subject, train_y, updated_train_x)
test_set <- cbind(test_subject, test_y, updated_test_x)
combined_dat <- rbind(train_set, test_set)

# Matching the activity integer labels to its correct action labels. 
activities <- c("1" = "walking", "2" = "walking_upstairs", "3" = "walking_downstairs", "4" = "sitting", "5" = "standing", "6" = "laying")

# Updating the activity column of the dataset to the correct action labels as factors. 
combined_dat$activity <- factor(activities[combined_dat$activity], levels = activities)

# Group by subject id and activity, then summarize all the variables by taking its means. 
mean_summary <- combined_dat %>% group_by(subject_id, activity) %>% summarise_each(funs(mean))

# Finally, write the result as a text file. 
write.table(mean_summary, file = "mean_summary.txt", row.names = FALSE)
