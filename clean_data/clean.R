xtest = read.table("data/test/X_test.txt")
ytest = read.table("data/test/y_test.txt")
sbjtest = read.table("data/test/subject_test.txt")
xtrain = read.table("data/train/X_train.txt")
ytrain = read.table("data/train/y_train.txt")
sbjtrain = read.table("data/train/subject_train.txt")


xtest$Subject = sbjtest$V1
xtrain$Subject = sbjtrain$V1
X= rbind(xtrain, xtest)
y = rbind(ytrain, ytest)

selected_cols = c(1:6, 41:46, 81:86, 121:126, 161:166, 201, 202, 214, 215, 227, 228
                  , 240, 241, 253, 254, 266:271, 294:296, 345:350, 373:375, 424:429
                  , 452:454, 503, 504, 513, 516, 517, 526, 529, 530, 539, 542, 543, 552)
variables_names = c("BodyAcceleration_TimeDomain_Mean_X", "BodyAcceleration_TimeDomain_Mean_Y"
                    , "BodyAcceleration_TimeDomain_Mean_Z", "BodyAcceleration_TimeDomain_STD_X"
                    , "BodyAcceleration_TimeDomain_STD_Y", "BodyAcceleration_TimeDomain_STD_Z"
                    , "GravityAcceleration_TimeDomain_Mean_X", "GravityAcceleration_TimeDomain_Mean_Y"
                    , "GravityAcceleration_TimeDomain_Mean_Z", "GravityAcceleration_TimeDomain_STD_X"
                    , "GravityAcceleration_TimeDomain_STD_Y", "GravityAcceleration_TimeDomain_STD_Z"
                    , "BodyAccelerationJerk_TimeDomain_Mean_X", "BodyAccelerationJerk_TimeDomain_Mean_Y"
                    , "BodyAccelerationJerk_TimeDomain_Mean_Z", "BodyAccelerationJerk_TimeDomain_STD_X"
                    , "BodyAccelerationJerk_TimeDomain_STD_Y", "BodyAccelerationJerk_TimeDomain_STD_Z"
                    , "BodyGyro_TimeDomain_Mean_X", "BodyGyro_TimeDomain_Mean_Y", "BodyGyro_TimeDomain_Mean_Z"
                    , "BodyGyro_TimeDomain_STD_X", "BodyGyro_TimeDomain_STD_Y", "BodyGyro_TimeDomain_STD_Z"
                    , "BodyGyroJerk_TimeDomain_Mean_X", "BodyGyroJerk_TimeDomain_Mean_Y"
                    , "BodyGyroJerk_TimeDomain_Mean_Z", "BodyGyroJerk_TimeDomain_STD_X"
                    , "BodyGyroJerk_TimeDomain_STD_Y", "BodyGyroJerk_TimeDomain_STD_Z"
                    , "BodyAccelerationMagnitude_TimeDomain_Mean", "BodyAccelerationMagnitude_TimeDomain_STD"
                    , "GravityAccelerationMagnitude_TimeDomain_Mean", "GravityAccelerationMagnitude_TimeDomain_STD"
                    , "BodyAccelerationJerkMagnitude_TimeDomain_Mean", "BodyAccelerationJerkMagnitude_TimeDomain_STD"
                    , "BodyGyroMagnitude_TimeDomain_Mean", "BodyGyroMagnitude_TimeDomain_STD"
                    , "BodyGyroJerkMagnitude_TimeDomain_Mean", "BodyGyroJerkMagnitude_TimeDomain_STD"
                    , "BodyAcceleration_FrequancyDomain_Mean_X", "BodyAcceleration_FrequancyDomain_Mean_Y"
                    , "BodyAcceleration_FrequancyDomain_Mean_Z", "BodyAcceleration_FrequancyDomain_STD_X"
                    , "BodyAcceleration_FrequancyDomain_STD_Y", "BodyAcceleration_FrequancyDomain_STD_Z"
                    , "BodyAcceleration_FrequancyDomain_MeanFreq_X", "BodyAcceleration_FrequancyDomain_MeanFreq_Y"
                    , "BodyAcceleration_FrequancyDomain_MeanFreq_Z"
                    , "BodyAccelerationJerk_FrequancyDomain_Mean_X", "BodyAccelerationJerk_FrequancyDomain_Mean_Y"
                    , "BodyAccelerationJerk_FrequancyDomain_Mean_Z", "BodyAccelerationJerk_FrequancyDomain_STD_X"
                    , "BodyAccelerationJerk_FrequancyDomain_STD_Y",  "BodyAccelerationJerk_FrequancyDomain_STD_Z"
                    , "BodyAccelerationJerk_FrequancyDomain_MeanFreq_X",  "BodyAccelerationJerk_FrequancyDomain_MeanFreq_Y"
                    , "BodyAccelerationJerk_FrequancyDomain_MeanFreq_Z",  "BodyGyro_FrequancyDomain_Mean_X"
                    , "BodyGyro_FrequancyDomain_Mean_Y", "BodyGyro_FrequancyDomain_Mean_Z"
                    , "BodyGyro_FrequancyDomain_STD_X", "BodyGyro_FrequancyDomain_STD_Y"
                    , "BodyGyro_FrequancyDomain_STD_Z", "BodyGyro_FrequancyDomain_MeanFreq_X"
                    , "BodyGyro_FrequancyDomain_MeanFreq_Y", "BodyGyro_FrequancyDomain_MeanFreq_Z"
                    , "BodyAccelerationMagnitude_FrequancyDomain_Mean", "BodyAccelerationMagnitude_FrequancyDomain_STD"
                    , "BodyAccelerationMagnitude_FrequancyDomain_MeanFreq", "BodyAccelerationJerkMagnitude_FrequancyDomain_Mean"
                    , "BodyAccelerationJerkMagnitude_FrequancyDomain_STD", "BodyAccelerationJerkMagnitude_FrequancyDomain_MeanFreq"
                    , "BodyAccelerationGyroMagnitude_FrequancyDomain_Mean", "BodyAccelerationGyroMagnitude_FrequancyDomain_STD"
                    , "BodyAccelerationGyroMagnitude_FrequancyDomain_MeanFreq", "BodyAccelerationGyroJerkMagnitude_FrequancyDomain_Mean"
                    , "BodyAccelerationGyroJerkMagnitude_FrequancyDomain_STD", "BodyAccelerationGyroJerkMagnitude_FrequancyDomain_MeanFreq")
delete_cols = 1:561





selected_cols=paste("V", selected_cols, sep="")
#delete_cols=paste("V", delete_cols, seq="")

X = X[c("Subject",selected_cols)]
X[variables_names] = X[selected_cols]
X = X[,!(names(X) %in% selected_cols)]

X$label = y$V1
id = 1:6
label = c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

activity_labels = data.frame(id, label)

X$label = sapply(seq(length(X[,1])), function(i) {
  X$label[i] = activity_labels$label[X$label[i] == activity_labels$id]
})



clean_set = aggregate(X[2:80], FUN=mean, by=list(X$Subject, X$label))
write.csv(clean_set, "data/clean_data.txt")