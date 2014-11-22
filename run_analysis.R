library(data.table)
library(plyr)

#Load training data into R 
#(assumes folder "UCI HAR DATASET" is in present working directory)
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#rename variables of trainY and trainsubject
names(trainY) <- "ActivityLabel"
names(trainsubject) <- "SubjectLabel"

#add trainsubject and trainY as columns to trainX
train<-cbind(trainX,trainsubject,trainY)

#Load test data into R 
#(assumes folder "UCI HAR DATASET" is in present working directory)
testX <- read.table("./UCI HAR Dataset/test/X_test.txt")
testY <- read.table("./UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#rename variables of testY and testsubject
names(testY) <- "ActivityLabel"
names(testsubject) <- "SubjectLabel"

#add testsubject and testY as columns to testX
test<-cbind(testX,testsubject,testY)

#Merge training and test data
data <- rbind(train,test)

#change variable names to those found in features.txt(features)
featuresRead <- read.table("./UCI HAR Dataset/features.txt")
setnames(data, old = head(names(data),n=561), new = as.character(featuresRead[,2]))
features <- featuresRead[,2]

#extract only the features containing some mean or std for each measurement
mean.and.std <- c(1:6,41:46,81:86,121:126,161:166,201:202,214:215,227:228,240:241,253:254,266:271,345:350,424:429,503:504,516:517,529:530,542:543)
features.short <- factor(features[mean.and.std])
num.features.short <- nlevels(features.short)
other.vars <- c(562:563) #also need to keep  ActivityLabel and SubjectLabel
data <- data[c(mean.and.std,other.vars)]

#add descriptive activity names (based on original data codebook)
new.activ.names <- c("Walking","WalkingUp","WalkingDown","Sitting","Standing","Laying")
for(index in 1:6){
        data$ActivityName[data$ActivityLabel==index]<-new.activ.names[index]
}

#create second independent data set with averages of each variable
#for each combination of (Subject,Activity)
new.data <- data.frame(matrix(ncol=num.features.short,nrow=0)) #empty data frame for populating
colnames(new.data) <- features.short #put in feature names so we can refer to them later
for (subject in 1:30){
        for(activity in 1:6){
                
                #fill in entries for new row of data frame
                new.row <-data.frame(matrix(NA,ncol=num.features.short))
                colnames(new.row) <- features.short
                new.row$ActivityLabel <- activity
                new.row$ActivityName <- new.activ.names[activity]
                
                for(index in 1:num.features.short){
                        #calculate average of feature for current subject/activity
                        tmp <- mean(data[which(data$SubjectLabel==subject & data$ActivityLabel==activity),index])
                        
                        #put this feature average in row
                        curFeatureName <- as.character(features.short[index])
                        new.row[[curFeatureName]] <- tmp
                        new.row$SubjectLabel <- subject

                }
                #add this new row to data frame
                new.data<-rbind(new.data,new.row)
        }       
}

#Remove illegal characters from names
names(new.data) <-make.names(gsub('[:():]','',as.character(names(new.data))))
#Also fix "BodyBody" names to have only one "Body"
not.BodyBody.names = c(
        "fBodyBodyAccJerkMag.mean"="fBodyAccJerkMag.mean",
        "fBodyBodyAccJerkMag.std"="fBodyAccJerkMag.std",
        "fBodyBodyGyroMag.mean"="fBodyGyroMag.mean",
        "fBodyBodyGyroMag.std"="fBodyGyroMag.std",
        "fBodyBodyGyroJerkMag.mean"="fBodyGyroJerkMag.mean",
        "fBodyBodyGyroJerkMag.std"="fBodyGyroJerkMag.std")
new.data <- rename(new.data,not.BodyBody.names)

#Finally, reorder SubjectLabel and ActivityName to be first two columns
new.data <- new.data[c(69,67:68,1:66)]

#Save tidy data to disc
write.table(new.data,"tidydata.txt",row.name=FALSE)
