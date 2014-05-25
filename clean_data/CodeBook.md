Human Activity Recognition Using Smartphones Data Set: Tidy Version
========================================================


## Original Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Variables:
The original set of variables were filtered from 561 variables into 79+subject+label
for each kind of variable it a Mean and STD functions are applied, and after that an FFT is applied then again a mean, STD, Mean Frequncy functions are applied, variables with X, Y, and Z components are modeled individually. The 79 are as follows:

### -   BodyAcceleration: (15)
+  BodyAcceleration_TimeDomain_Mean_X
+  BodyAcceleration_TimeDomain_Mean_Y
+  BodyAcceleration_TimeDomain_Mean_Z
+  BodyAcceleration_TimeDomain_STD_X
+  BodyAcceleration_TimeDomain_STD_Y
+  BodyAcceleration_TimeDomain_STD_Z
+  BodyAcceleration_FrequancyDomain_Mean_X
+  BodyAcceleration_FrequancyDomain_Mean_Y
+  BodyAcceleration_FrequancyDomain_Mean_Z
+  BodyAcceleration_FrequancyDomain_STD_X
+  BodyAcceleration_FrequancyDomain_STD_Y
+  BodyAcceleration_FrequancyDomain_STD_Z
+  BodyAcceleration_FrequancyDomain_MeanFreq_X
+  BodyAcceleration_FrequancyDomain_MeanFreq_Y
+  BodyAcceleration_FrequancyDomain_MeanFreq_Z

Notation:
+ BodyAcceleration_TimeDomain|FrequancyDomain_Mean|STD_X|Y|Z
BodyAcceleration_FrequancyDomain_MeanFreq_X|Y|Z

### -   GravityAcceleration: (6)
-   GravityAcceleration_TimeDomain_Mean|STD_X|Y|Z

### -   BodyAccelerationJerk: (15)
-   BodyAccelerationJerk_TimeDomain|FrequancyDomain_Mean|STD_X|Y|Z
-   BodyAccelerationJerk_FrequancyDomain_MeanFreq_X|Y|Z

### -   BodyGyro: (15)
-   BodyGyro_TimeDomain|FrequancyDomain_Mean|STD_X|Y|Z
-   BodyGyro_FrequancyDomain_MeanFreq_X|Y|Z

### -   BodyGyroJerk: (6)
-   BodyGyroJerk_TimeDomain_Mean|STD_X|Y|Z      

### -   BodyAccelerationMagnitude: (5)
-   BodyAccelerationMagnitude_TimeDomain|FrequancyDomain_Mean|STD     
-   BodyAccelerationMagnitude_FrequancyDomain_MeanFreq

### -   GravityAccelerationMagnitude: (2)
-   GravityAccelerationMagnitude_TimeDomain_Mean|STD       

### -   BodyAccelerationJerkMagnitude: (5)
-   BodyAccelerationJerkMagnitude_TimeDomain|FrequancyDomain_Mean|STD
-   BodyAccelerationJerkMagnitude_FrequancyDomain_MeanFreq

### -   BodyGyroMagnitude: (2)
-   BodyGyroMagnitude_TimeDomain_Mean|STD   

### -   BodyGyroJerkMagnitude: (2)
-   BodyGyroJerkMagnitude_TimeDomain_Mean|STD

### -   BodyAccelerationGyroMagnitude: (3)
-   BodyAccelerationGyroMagnitude_FrequancyDomain_Mean|STD|MeanFreq

### -   BodyAccelerationGyroJerkMagnitude: (3)
-   BodyAccelerationGyroJerkMagnitude_FrequancyDomain_Mean|STD|MeanFreq       

Then Each subject is identified by a (Subject) column, and the activity label in a (label) column
                 
## Transformations
-   The test and train data from the original were merged into a single data set
-   The labels and subject id were merged as new columns
-   The labels were given more descriptive test rather than numbers
-   The Columns were renamed to more descriptive names
-   For each activity and each subject the average of each variable is calcualted in the new "clean" data set.
