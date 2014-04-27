### Overview
- Required Libraries: Data.Table
- Author: Chase Baggett
- Purpose: Data Science via Coursera/John Hopkins

### How to Run this Script

- Clone the repo
- Download the Data From: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- Unzip file into the same directory as the repo.
- Set Working Directory to UCI HAR Dataset
- Run run_analysis.r
  
#### Two Files Will Result:
##### tidydata.txt contains:
- A tidy, cleaned up version of the data.
- Merged the testing and training sets.
- Added Labels for Activity.
- Named Columns from Features

##### tidydatamean.txt contains:
- A second, independent tidy data set with the average of each variable for each activity and each subject. 