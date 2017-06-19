# This file is a submission for the final assigment
# for the course 'Getting and Cleaning data' by John Hopkins on Coursera

# Clean the workspace

rm(list=ls(all=TRUE))

# read test data from Xtest.txt file
# file is assumbed to be in subdirectory 'test'

testdata <- read.table("./test/X_test.txt", header = FALSE)

# define column numbers to be selected 

tBodyAcc <- 1:6
tGravityAcc <- 41:46
tBodyAccJerk <-81:86
tBodyGyro <- 121:126
tBodyGyroJerk <- 161:166
tBodyAccMag <- 201:202
tGravityAccMag <- 214:215
tBodyAccJerkMag <- 227:228
tBodyGyroMag <- 240:241
tBodyGyroJerkMag <- 253:254
fBodyAcc <- 266:271
fBodyAccJerk <- 345:350
fBodyGyro <- 424:429
fBodyAccMag <- 503:504
fBodyBodyAccJerkMag <- 516:517
fBodyBodyGyroMag <- 529:530
fBodyBodyGyroJerkMag <-542:543

# create 'selection' vector containing all columns specified above

selection <- c(tBodyAcc,tGravityAcc,tBodyAccJerk,tBodyGyro,
		tBodyGyroJerk, tBodyAccMag, tGravityAccMag, tBodyAccJerkMag,
		tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc, fBodyAccJerk, fBodyGyro,
		fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag,
		fBodyBodyGyroJerkMag)
		

# remove all columns but those listed in 'selection

testdata <- testdata[, selection]
	
# read labels of activities in y_text.txt file.
# file is assumbed to be in subdirectory 'test'

testactivities <- read.table("./test/y_test.txt", header = FALSE)

# assign a name to the activity vector to avoid duplicate names
names(testactivities) = "activity"

# read labels of test subjects in subject_test.txt file.
# file is assumbed to be in subdirectory 'test'

testsubjects <- read.table("./test/subject_test.txt", header = FALSE)

# assign a name to the subjects vector to avoid duplicate names

names(testsubjects) = "subject"

# combine test data, activity and subject lables into single dataframe

testtable <- cbind(testactivities, testsubjects, testdata)

# remove files no longer needed to save on memory

rm(testsubjects, testactivities, testdata)

# read train data from Xtrain.txt file
# file is assumbed to be in subdirectory 'train'
traindata <- read.table("./train/X_train.txt", header = FALSE)

# remove all columns but those listed in 'selection'

traindata <- traindata[, selection]

# read labels of activities in y_train.txt file.
# file is assumbed to be in subdirectory 'train'

trainactivities <- read.table("./train/y_train.txt", header = FALSE)

# assign a name to the activity vector to avoid duplicate names
names(trainactivities) = "activity"

# read labels of test subjects in subject_train.txt file.
# file is assumbed to be in subdirectory 'test'

trainsubjects <- read.table("./train/subject_train.txt", header = FALSE)

# assign a name to the subjects vector to avoid duplicate names

names(trainsubjects) = "subject"

# combine training data, activity and subject lables into single dataframe

traintable <- cbind(trainactivities, trainsubjects, traindata)

# remove files no longer needed to save on memory

rm(trainactivities, trainsubjects, traindata)

# combine test and training into a single dataframe

completetable <- rbind(testtable, traintable)

# remove files no longer needed to save on memory

rm(testtable, traintable)

# change the activity column into a factor

completetable$activity <- as.factor(completetable$activity)

# change the subject column into a factor

completetable$subject <- as.factor(completetable$subject)


# assing the labels in the 'activity_labels.txt' file to the activity factor

levels(completetable$activity)<-c("walking","walkingupstairs",
		"walkingdownstairs", "sitting", "standing", "laying")

# assign appropriate variable names for all the columns

names(completetable) = c("activity", "subject",
		"bodyaccelerometertimexmean",
		"bodyaccelerometertimeymean",
		"bodyaccelerometertimezmean",
		"bodyaccelerometertimexstandarddeviation",
		"bodyaccelerometertimeystandarddeviation",
		"bodyaccelerometertimezstandarddeviation",
		"gravityaccelerometertimexmean",
		"gravityaccelerometertimeymean",
		"gravityaccelerometertimezmean",
		"gravityaccelerometertimexstandarddeviation",
		"gravityaccelerometertimeystandarddeviation",
		"gravityaccelerometertimezstandarddeviation",
		"bodyaccelerometerjerktimexmean",
		"bodyaccelerometerjerktimeymean",
		"bodyaccelerometerjerktimezmean",
		"bodyaccelerometerjerktimexstandarddeviation",
		"bodyaccelerometerjerktimeystandarddeviation",
		"bodyaccelerometerjerktimezstandarddeviation",
		"bodygyroscopetimexmean",
		"bodygyroscopetimeymean",
		"bodygyroscopetimezmean",
		"bodygyroscopetimexstandarddeviation",
		"bodygyroscopetimeystandarddeviation",
		"bodygyroscopetimezstandarddeviation",
		"bodygyroscopejerktimexmean",
		"bodygyroscopejerktimeymean",
		"bodygyroscopejerktimezmean",
		"bodygyroscopejerktimexstandarddeviation",
		"bodygyroscopejerktimeystandarddeviation",
		"bodygyroscopejerktimezstandarddeviation",
		"bodyaccelerometertimemagnitudemean",
		"bodyaccelerometertimemagnitudestandarddeviation",
		"gravityaccelerometertimemagnitudemean",
		"gravityaccelerometertimemagnitudestandarddeviation",
		"bodyaccelerometerjerktimemagnitudemean",
		"bodyaccelerometerjerktimemagnitudestandarddeviation",
		"bodygyroscopetimemagnitudemean",
		"bodygyroscopetimemagnitudestandarddeviation",
		"bodygyroscopejerktimemagnitudemean",
		"bodygyroscopejerktimemagnitudestandarddeviation",
		"bodyaccelerometerfrequencyxmean",
		"bodyaccelerometerfrequencyymean",
		"bodyaccelerometerfrequencyzmean",
		"bodyaccelerometerfrequencyxstandarddeviation",
		"bodyaccelerometerfrequencyystandarddeviation",
		"bodyaccelerometerfrequencyzstandarddeviation",		
		"bodyaccelerometerjerkfrequencyxmean",
		"bodyaccelerometerjerkfrequencyymean",
		"bodyaccelerometerjerkfrequencyzmean",
		"bodyaccelerometerjerkfrequencyxstandarddeviation",
		"bodyaccelerometerjerkfrequencyystandarddeviation",
		"bodyaccelerometerjerkfrequencyzstandarddeviation",
		"bodygyroscopefrequencyxmean",
		"bodygyroscopefrequencyymean",
		"bodygyroscopefrequencyzmean",
		"bodygyroscopefrequencyxstandarddeviation",
		"bodygyroscopefrequencyystandarddeviation",
		"bodygyroscopefrequencyzstandarddeviation",
		"bodyaccelerometerfrequencymagnitudemean",
		"bodyaccelerometerfrequencymagnitudestandarddeviation",		
		"bodyaccelerometerjerkfrequencymagnitudemean",
		"bodyaccelerometerjerkfrequencymagnitudestandarddeviation",
		"bodygyroscopefrequencymagnitudemean",
		"bodygyroscopefrequencymagnitudestandarddeviation",		
		"bodygyroscopejerkfrequencymagnitudemean",
		"bodygyroscopejerkfrequencymagnitudestandarddeviation")

# create placeholder for table of averages
tableofaverages <- completetable[1:180,]
tableofaverages[3:ncol(tableofaverages)] <- NA

# loop through completetable:
# 1 - loop through all six actvities
# 2 - for each activity, loop through all subjects
# 3 - for each combination of activity and subject, loop through all
#		columns and calculate the mean of each column.
# each combination of activity and subject needs a row. Thus, the next row
# starts after each loop through all columns.

row <- 1
for(i in levels(completetable$activity)) {
		for(j in levels(completetable$subject)) {
			tableofaverages[row, 1] <- i
			tableofaverages[row, 2] <- j
				for(k in 3:ncol(completetable)) {
						tableofaverages[row,k] <- mean(
								completetable[completetable$activity == i &
										completetable$subject == j, k]
								)		
						}
				row <- row + 1
				}
		}

# write the table of averages to a file called tableofaverages.txt
		
write.table(tableofaverages, "tableofaverages.txt", row.names = FALSE)