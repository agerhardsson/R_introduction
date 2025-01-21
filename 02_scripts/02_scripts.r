#Load libraries
library(readr)
library(arsenal)

#Load data
dat <- read_csv("data.csv")

#Specify factor variables
dat$item.1 <- factor(dat$item.1, 
                     levels = c(1,2), 
                     labels = c("M", "F"))

dat$item.3 <- factor(dat$item.3, 
                     levels = c(1,2,3,4), 
                     labels = c("No", "Sometimes", 
                                "Often", "Always"))
#Rename variables
names(dat)[names(dat) == "item.1"] <- "sex"
names(dat)[names(dat) == "item.2"] <- "age"
names(dat)[names(dat) == "item.3"] <- "hearing"

#Create variables for PTA
dat$PTA4.R <- (dat$R500 + dat$R1000 + dat$R2000 + dat$R4000) / 4

#Create variable for PTA4 Left
dat$PTA4.L <- (dat$L500 + dat$L1000 + dat$L2000 + dat$L4000) / 4

#Create variable of column names relevant to THI
THI.names <- paste("THI", 1:25, sep="_")

#Calculate total THI score per subject
dat$THIscore <- apply(dat[,THI.names], MARGIN = 1, FUN = sum)

#Create table using tableby()
tab1 <- tableby(sex ~ THIscore, data = dat, 
                digits = 1, 
                total = FALSE)

#Print table
summary(tab1, text = TRUE)

#Box plot of THI score for sex
plot(dat$sex, dat$THIscore,
     main = "THI score for Male (M) and Female (F)",
     xlab = "Sex",
     ylab = "THI total score")

#Save linear regression model to variable
linear.reg.L <- lm(data = dat, PTA4.L ~ age)
linear.reg.R <- lm(data = dat, PTA4.R ~ age)

#Print summary of linear regression model
summary(linear.reg.L)
summary(linear.reg.R)

#Set plot space to two columns
par(mfrow=c(1,2))

#Scatter plot of PTA LEFT as function of age
plot(dat$age, dat$PTA4.L,
     pch = 20,
     main = "PTA Left ear vs age",
     xlab = "Age (years)",
     ylab = "PTA Left (dB HL)")
#Best fit linear regression LEFT
abline(linear.reg.L, lwd = 2, col = "red")

#Scatter plot of PTA RIGHT as function of age
plot(dat$age, dat$PTA4.R,
     pch = 20,
     main = "PTA Right ear vs age",
     xlab = "Age (years)",
     ylab = "PTA Right (dB HL)")
#Best fit linear regression RIGHT
abline(linear.reg.R, lwd = 2, col = "red")