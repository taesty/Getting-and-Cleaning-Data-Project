# Getting-and-Cleaning-Data-Project
Coursera - Getting and Cleaning Data course project

The run_analysis.R script returns the means of 66 feature variables grouped by subject id and activity. 
The data behind the tidy data comes from the UCI HAR Dataset. More information about the dataset can be found on the course project page and the .txt files in the UCI HAR Dataset folder. 

Steps taken to complete the project:

I read in all the necessary .txt files using the read.table() function. 

First, the project asks us to focus only the variables that measure mean and std so I first extrapolated the variables (indices) measuring mean() and std() using the features.txt file provided with the dataset using the grep() function. As I was doing this, I noticed that looking for "mean()" also grabbed the meanfreq() and angle() variables which I didn't think fit part of the project requirements so I removed the indices pointing to the meanfreq() and angle() variables using the setdiff() function with mean()/meanfreq() and mean()/angle() as arguments. Grabbing the std() variable indices was more straightforward. I then used the append() function to combine the mean() and std() variable indices into "wanted_variables". 

After reading through the descriptive files (README.txt, features_info.txt) and examining the 'raw' data, I learned that the variables are contained in the x_train.txt and x_test.txt files in the train and test folders, respectively. To grab the desired variables, I simply subsetted the data using the "wanted_variables" indices: train_x[, wanted_variables] and text_x[, wanted_variables].

The data in the .txt files in the dataset had no column headers so I updated the column headers. The subject_train/test and y_train/test .txt files were straightforward. The subject_ files contained only the subject id number so was labeled "subject_id". The y_ files contained the activity number so was labeled "activity". For the x_ labels, I again used the indices in "wanted_variables" to grab the variable names as vectors to use as the column name for the interested variables. 

Next step was combining the different data gathered from the .txt files into one dataset using cbind() and rbind(). 

Next, I wanted to replace the activity integer variables with a more description action labels which are found in the activity_labels.txt file in the data folder. I did this by first creating a variable "activities" containing the matching pairs ("1" = "walking", etc) and replaced the integer values with its corresponding action label in the activity column using the factor() function with levels = activities. I then had the dataset necessary to perform the mean summary statistics. 

To perform the summary, I used functions and suntax from the dplyr package. I first grouped the data by subject_id and activity in that order then returned the means of all the variable columns using the summarise_each() function. Summarise_each() performs the given function across all the variables excluding the grouped variables. This returned a data consisting of 180 rows (30 subject * 6 actions) and 68 columns (1 for subject id, 1 for action, 66 for mean()/std() variables). 

Finally, I used write.table() to save the result as a .txt file as directed in the project. 

I believe the resulting data is tidy because it has one variable per column and one observation per row. I thought about creating a column to combine all the measured variables together but it result in a very long and narrow form which I believe is more difficult to read and analyze. 
