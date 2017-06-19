# Getting and cleaning data assignment submission

## Script

All code is in a single script called 'Run_analysis.R'

## Order

I have opted to switch the order of the steps, and first selected the variables
before merging the datasets. This means I do not have to read both the entire
test and the entire train dataset in memory; I remove the full datasets once I
have selected the variables. As I combine with rbind(), this will not result in 
any errors.

## Variables selected
I found the text 'Extracts only the measurements on the mean and standard deviation for each measurement.' vague.
I opted to only select those variables that end in '-mean()' or '-std()'.
That means I omitted the following:
- any column ending in meanFreq()
- 555 angle(tBodyAccMean,gravity)
- 556 angle(tBodyAccJerkMean),gravityMean)
- 557 angle(tBodyGyroMean,gravityMean)
- 558 angle(tBodyGyroJerkMean,gravityMean)
- 559 angle(X,gravityMean)
- 560 angle(Y,gravityMean)
- 561 angle(Z,gravityMean)

I expect that in a real-life example, the customer - perhaps me - will know
which data is required for further analysis.

If you choose to not award points on the basis of variable selection,
please let me know so I can update in a possible next submission

## Activity names
I have opted to adhere to the original labels for the activities as much as
possible, yet changed to all lowercase and removed underscores to make the
names 'tidy'.

## Variable names
For the variable names, I have tried to use a systematic approach to naming.
1. Each name starts with either 'body' or 'gravity', indicating whether the
variable is the body component of the measurement or the gravity component
2. Each name then lists whether it is a measurement of the accelerometer or
the gyroscope
3. If the variable concers a derived 'jerk' movement, 'jerk' is added
4. Then, an indicator 'time' or 'frequency' is used to indicate if it concerns
a measurement in time or frequency (Fourier transform) domain.
5. Then, 'x', 'y' or 'z' is added to indicate the direction where applicable
6. If the variable concerns a magnitude, 'magnitude' is added
7. Lastly, 'mean' or 'standarddeviation' is added to indicate the column type

This way, the variable name clearly indicates what the variable is and which
meter it originates from. As per 'tidy data' requirements, only lowercase
letters are used, and no separators (e.g. underscores) are used. Readability is
limited for some of the longer 

I opted not to indicate the variables are an average of the variable in the
final table, but rather indicated that in the code book as I felt it would
make the variable names less tidy.

## Calculating the averages
I couldn't figure out how to calculate an average using two indicator columns,
so I opted to write a loop. This is probably slower, but will work. Please let
me know if you opted not to grant full points because of this so I can update
in a possible future submission.
