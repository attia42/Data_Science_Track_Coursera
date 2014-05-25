Human Activity Recognition Using Smartphones Data Set: Tidy Version
========================================================
This code loads The data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The data ("UCI HAR Dataset" from the .zip file) is loaded from working folder by run_analysis.R and then some transformations are done to clean the data:
-   The test and train data from the original were merged into a single data set
-   The labels and subject id were merged as new columns
-   The labels were given more descriptive test rather than numbers
-   The Columns were renamed to more descriptive names
-   For each activity and each subject the average of each variable is calcualted in the new "clean" data set.

afterwards the cleam data is saved to working folder