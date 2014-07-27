#### Create a tidy data set

#define the folder
DataFolder<-"UCI HAR Dataset/"

##Merges the training and the test sets to create one data set.

#put all the data in one data frame
TestSet<-read.table(paste(DataFolder,"test/X_test.txt",sep=""))
TrainSet<-read.table(paste(DataFolder,"train/X_train.txt",sep=""))
RawData<-rbind(TestSet,TrainSet)

#get the column names for the data set
Features<-read.table(paste(DataFolder,"features.txt",sep=""))
colnames(RawData)<-Features[,2]


##Extracts only the measurements on the mean and standard deviation for each measurement. 
StdMeanVec<-grep("std|mean",tolower(Features$V2))
RawData_S_M_Cols<-RawData[,StdMeanVec]

##Uses descriptive activity names to name the activities in the data set

#Get the activities of the data
TestAct<-read.table(paste(DataFolder,"test/y_test.txt",sep=""))
TrainAct<-read.table(paste(DataFolder,"train/y_train.txt",sep=""))
Act<-rbind(TestAct,TrainAct)

#Add the activity names row to the data 
ActLab<-read.table(paste(DataFolder,"activity_labels.txt",sep=""))
ActNames<-ActLab[Act$V1,2]
RawData_S_M_Cols<-cbind(ActNames,RawData_S_M_Cols)
names(RawData_S_M_Cols)[1]<-"Activity"

#Add the Subject
TestSubject<-read.table(paste(DataFolder,"test/subject_test.txt",sep=""))
TrainSubject<-read.table(paste(DataFolder,"train/subject_train.txt",sep=""))
Subject<-rbind(TestSubject,TrainSubject)
RawData_S_M_Cols<-cbind(Subject,RawData_S_M_Cols)
names(RawData_S_M_Cols)[1]<-"Subject"


##Appropriately labels the data set with descriptive variable names. 

#remove the "(" ")" in the label names
TidyNames<-gsub("\\(|\\)", "",names(RawData_S_M_Cols))
names(RawData_S_M_Cols)<-TidyNames

##Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
library(plyr)
groupColumns=c("Subject","Activity")
dataColumns=TidyNames[3:88]
res=ddply(RawData_S_M_Cols,groupColumns,function(x) colMeans(x[dataColumns]))
library(stringr)
ChangeName<-c(ChangeName[1:2],str_c(ChangeName[3:88],'.AVG'))
names(res)<-ChangeName
write.table(res, file = "tidy.txt")



