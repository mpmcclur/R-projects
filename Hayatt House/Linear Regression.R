#function to check for installed packages
packages <- c("ggplot2","maps","gdata","mapproj","ggmap","zoom","zipcode","readxl","readr","csv","kernlab","e1071","gridExtra","caret","Rcmdr")
package.check <- lapply(packages, FUN = function(x){
  if(!require(x, character.only=TRUE)){
    install.packages(x, dependencies=TRUE)
    library(x, character.only=TRUE)
  }
})
search()

##############################################
###Read in the data
##############################################
#makecsv <-function(file_name)
#{
#  path = "C:/Data/"
#  extensions = ".csv"
#  print(path)
#  print(file_name)
#  print(extensions)
#  print((paste(path,file_name,extensions, sep="")))
#  full_path<-(paste(path,file_name,extensions, sep=""))
#  Original_CSV <- read.csv(full_path)
#  Reduced_CSV <- Original_CSV[, c(55,56,59,62,63,66,67,77,81,109,126,127,129,133,137:147,179,185:187,232)]
#  full_path2 = (paste(path,file_name,".reduced",extensions, sep=""))
#  write.csv(Reduced_CSV, file = full_path2)
#}
#makecsv ("out-201402")
#makecsv ("out-201403")
#makecsv ("out-201404")
#makecsv ("out-201405")
#makecsv ("out-201406")
#makecsv ("out-201407")
#makecsv ("out-201408")
#makecsv ("out-201409")
#makecsv ("out-201410")
#makecsv ("out-201411")
#makecsv ("out-201412")
#makecsv ("out-201501")

# read in full data -- Residual used to grab data if variable is needed outside of the restricted versions.
# mydata1raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201402.csv")
# mydata2raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201403.csv")
# mydata3raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201404.csv")
# mydata4raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201405.csv")
# mydata5raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201406.csv")
# mydata6raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201407.csv")
# mydata7raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201408.csv")
# mydata8raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201409.csv")
# mydata9raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201410.csv")
# mydata10raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201411.csv")
# mydata11raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201412.csv")
#mydata12raw <- read.csv("E:\\temp\\GradSchoolRData\\out-201501.csv")
#View(mydata12raw)

#reading in the data:
mydata1 <- read.csv("E:\\temp\\GradSchoolRData\\out-201402.reduced.csv")
mydata2 <- read.csv("E:\\temp\\GradSchoolRData\\out-201403.reduced.csv")
mydata3 <- read.csv("E:\\temp\\GradSchoolRData\\out-201404.reduced.csv")
mydata4 <- read.csv("E:\\temp\\GradSchoolRData\\out-201405.reduced.csv")
mydata5 <- read.csv("E:\\temp\\GradSchoolRData\\out-201406.reduced.csv")
mydata6 <- read.csv("E:\\temp\\GradSchoolRData\\out-201407.reduced.csv")
mydata7 <- read.csv("E:\\temp\\GradSchoolRData\\out-201408.reduced.csv")
mydata8 <- read.csv("E:\\temp\\GradSchoolRData\\out-201409.reduced.csv")
mydata9 <- read.csv("E:\\temp\\GradSchoolRData\\out-201410.reduced.csv")
mydata10 <- read.csv("E:\\temp\\GradSchoolRData\\out-201411.reduced.csv")
mydata11 <- read.csv("E:\\temp\\GradSchoolRData\\out-201412.reduced.csv")
mydata12 <- read.csv("E:\\temp\\GradSchoolRData\\out-201501.reduced.csv")

#examine example dataset:
head(mydata12)

#create month column and fill monthly dataframes with corresponding month number:
month <- paste("1")
mydata1 <- cbind(mydata1,month)

month <- paste("2")
mydata2 <- cbind(mydata2,month)

month <- paste("3")
mydata3 <- cbind(mydata3,month)

month <- paste("4")
mydata4 <- cbind(mydata4,month)

month <- paste("5")
mydata5 <- cbind(mydata5,month)

month <- paste("6")
mydata6 <- cbind(mydata6,month)

month <- paste("7")
mydata7 <- cbind(mydata7,month)

month <- paste("8")
mydata8 <- cbind(mydata8,month)

month <- paste("9")
mydata9 <- cbind(mydata9,month)

month <- paste("10")
mydata10 <- cbind(mydata10,month)

month <- paste("11")
mydata11 <- cbind(mydata11,month)

month <- paste("12")
mydata12 <- cbind(mydata12,month)

#omit NA's:
mydata1 <- na.omit(mydata1)
mydata2 <- na.omit(mydata2)
mydata3 <- na.omit(mydata3)
mydata4 <- na.omit(mydata4)
mydata5 <- na.omit(mydata5)
mydata6 <- na.omit(mydata6)
mydata7 <- na.omit(mydata7)
mydata8 <- na.omit(mydata8)
mydata9 <- na.omit(mydata9)
mydata10 <- na.omit(mydata10)
mydata11 <- na.omit(mydata11)
mydata12 <- na.omit(mydata12)

#combine all the data into one dataset:
myData <- rbind(mydata1,mydata2,mydata3,mydata4,mydata5,mydata6,mydata7,mydata8,mydata9,mydata10,mydata11,mydata12)

#examine dataset
#head(myDataRaw)
#str(myDataRaw)

#show only columns of interest:
#myData <- myDataRaw[,c("COUNTRY_CODE_R","LENGTH_OF_STAY_R","ROOM_NIGHTS_R","STATUS_CALCULATION_R","GOLDPASSPORT_FLG_R","MEMBER_STATUS_R","Likelihood_Recommend_H","e_status_I","e_hy_feedback_type_I","Age_Range_H","Clublounge_Used_H","Spa_Used_H","Checkin_Length_H","Status_H","Guest.NPS.Goal_PL","Hotel.Inventory_PL","NPS_Type", "month")]

#view my data
head(myData)
str(myData)

#update MEMBER_STATUS_R -- blank = "None" - for graphing reasons later.
summary(myData$MEMBER_STATUS_R)
myData$MEMBER_STATUS_R <- as.character(myData$MEMBER_STATUS_R)
myData$MEMBER_STATUS_R[myData$MEMBER_STATUS_R==""] <- "None"
myData$MEMBER_STATUS_R <- as.factor(myData$MEMBER_STATUS_R)
summary(myData$MEMBER_STATUS_R)

#reorder MEMBER_STATUS
myData$MEMBER_STATUS_R <- factor(myData$MEMBER_STATUS_R, levels = c("None","Gold","Platinum","Diamond", "Courtesy", "Lifetime Diamond"))
levels(myData$MEMBER_STATUS_R)

#filter for United States:
#USData_NA <- na.omit(USData_NA) #remarked out; best practice of keeping the old dataset not followed due to time
USData <- myData[myData$COUNTRY_CODE_R=="UNITED STATES",]
USData <- droplevels(USData)
head(USData)
str(USData)

###################
###Calculate Global NPS
###################
# Pull NPS Data into a separate vector
npsSum <- summary(as.factor(USData$NPS_Type))
# Find Length of npsSum
npsLen <- sum(npsSum)
# Calculate
nps <- (npsSum["Promoter"]/npsLen*100)-(npsSum["Detractor"]/npsLen*100)
cat("Global NPS is:",nps[[1]],"%")

###################
###Descriptive Statistics
###################

#likelihood to recommend vs length of stay:
scatterplot(Likelihood_Recommend_H~LENGTH_OF_STAY_R, xlab="Length of Stay", ylab="Likelihood to Recommend", main="Likelihood to Recommend vs. Length of Stay", reg.line=FALSE, smooth=FALSE, spread=FALSE, boxplots=FALSE, span=0.5, ellipse=FALSE, levels=c(.5, .9), data=USData)

#Member status NPS type:
with(USData, Barplot(MEMBER_STATUS_R, by=NPS_Type, style="divided", legend.pos="above", xlab="MEMBER_STATUS_R", ylab="Frequency"))#

#Anticipating NPS type via member status:
with(USData, Barplot(NPS_Type, by=MEMBER_STATUS_R, style="divided", legend.pos="above", xlab="NPS Type", ylab="Guests", conditional=FALSE))

#Plotting member status and NPS Type against mean of guest NPS goal.
with(USData_NA, plotMeans(Guest.NPS.Goal_PL, MEMBER_STATUS_R, NPS_Type, error.bars="none", xlab="Member Status", ylab="Mean of Guest NPS Goal", connect=TRUE, legend.pos="farright"))

#Plotting member status and NPS Type against mean of guest NPS goal.
summary(USData_NA$MEMBER_STATUS_R)
USData_NA <- USData
View(USData_NA)
USData_NA <- na.omit(USData_NA)
with(USData_NA, plotMeans(Guest.NPS.Goal_PL, MEMBER_STATUS_R, NPS_Type, error.bars="none", xlab="Member Status", ylab="Mean of Guest NPS Goal", connect=TRUE, legend.pos="farright"))

#Plot of means if spa was used
with(USData, plotMeans(Likelihood_Recommend_H, Spa_Used_H, error.bars="se", connect=TRUE, legend.pos="farright"))

#Plot of means if club was used
with(USData, plotMeans(Likelihood_Recommend_H, Clublounge_Used_H, error.bars="se", connect=TRUE, legend.pos="farright"))

#suggests those with access are more likely to rate higher
#Plot of means showing both
with(USData, plotMeans(Likelihood_Recommend_H, Clublounge_Used_H, Spa_Used_H, error.bars="se", connect=TRUE, legend.pos="farright"))

#Index plot of checikin length, length of stay, and room nights
indexplot(USData[,c('Checkin_Length_H', 'LENGTH_OF_STAY_R', 
                    'ROOM_NIGHTS_R'), drop=FALSE], type='h', id.method='y', id.n=2)

################################
#Linear Modeling
################################

lmOverall <- lm(formula=USData$Likelihood_Recommend_H ~ USData$Overall_Sat_H)
summary(lmOverall)
lmGuest <- lm(formula=USData$Likelihood_Recommend_H ~ USData$Guest_Room_H)
summary(lmGuest)
lmTranquil <- lm(formula=USData$Likelihood_Recommend_H ~ USData$Tranquility_H)
summary(lmTranquil)
lmConditions <- lm(formula=USData$Likelihood_Recommend_H ~ USData$Condition_Hotel_H)
summary(lmConditions)
lmInternet <- lm(formula=USData$Likelihood_Recommend_H ~ USData$Internet_Sat_H)
summary(lmInternet)
#Remarked out because LM is erroring out with these values despite the fact that they have content---investigate
#lmCheckIn <- lm(formula=USData$Likelihood_Recommend_H ~ Check_In_H)
#summary(lmCheckIn)
#lmFBFreq <- lm(formula=USData$Likelihood_Recommend_H ~ F.B_FREQ_H)
#summary(lmFBFreq)
#lmFBOverall <- lm(formula=USData$Likelihood_Recommend_H ~ F.B_Overall_Experience_H)
#summary(lmFBOverall)
#lmCustomer <- lm(formula=USData$Likelihood_Recommend_H ~ Customer_SVC_H)
#summary(lmCustomer)
#lmStaff <- lm(formula=USData$Likelihood_Recommend_H ~ Staff_Cared_H)
#summary(lmStaff)

lmBest <- lm(formula=USData$Likelihood_Recommend_H ~ USData$Guest_Room_H + USData$Condition_Hotel_H + USData$Tranquility_H)
summary(lmBest)

#Plot the R2 Values of Overall Satisfaction, Tranquility, and Internet Satisfaction
lmMetrics <- c("Overall Satisfaction","Guest Room Satisfaction","Tranquility","Hotel Condition","Internet Satisfaction")
lmR2 <- c(0.804, 0.490, 0.352, 0.442, 0.081)
dfLm <- data.frame(lmMetrics,lmR2)

gdflm <- ggplot(dfLm, aes(x=reorder(dfLm$lmMetrics, dfLm$lmR2),y=dfLm$lmR2))
gdflm <- gdflm + geom_col() + expand_limits(y=1)
dgflm <- gdflm + ggtitle("LTR Predictors") + ylab("R2") + xlab("Metrics")
dgflm

test <- data.frame(Overall_Sat_H=6, Tranquility_H=)

#Model of check in length or length of stay effect on likelihood to recommend
RegModel.2 <- lm(Likelihood_Recommend_H~Checkin_Length_H+LENGTH_OF_STAY_R, 
                 data=USData)

plot(allEffects(RegModel.2))

#Likelihood to recommend based on membership status
MemberStatusLM <- lm(formula=Likelihood_Recommend_H ~ MEMBER_STATUS_R, data=USData)
MemberStatusLM
plot(USData$Likelihood_Recommend_H~USData$MEMBER_STATUS_R,xlab="Member Status", ylab="Likelihood to Recommend")
abline(MemberStatusLM)
#---------------------------------------------
#Likelihood to recommend based on NPS Type
LinearModel.1 <- lm(Likelihood_Recommend_H ~ NPS_Type, data=USData)
crPlots(LinearModel.1, span=0.5)
avPlots(LinearModel.1, id.method="mahal", id.n=2)
plot(allEffects(LinearModel.1))
#linear model 2
LinearModel.2 <- lm(Likelihood_Recommend_H ~ Clublounge_Used_H + 
                      GOLDPASSPORT_FLG_R + LENGTH_OF_STAY_R + ...
