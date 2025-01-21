
# R is a calculator ============================================
#Sum
4 + 7
#Subtract
5 - 3
#Multiply
4 * 2
#Divide
12 / 3

# Assign and use variables =====================================
a <- 7
b <- 3

a + b

# Create a variable and us some built in functions =============

#Specify observations of length (cm)
length.cm <- c(183, 201, 165, 178, 169, 191, 174, 187)

#How tall is the shortest person?
min(length.cm)

#How tall is the tallest person?
max(length.cm)

#Calculate mean length
mean(length.cm)

#Calculate standard deviation of length
sd(length.cm)

# Use functions within other functions =========================
# Here round() of sd()
round(sd(length.cm), 2)

# Use the index of variables to fetch datapoints ===============

#The fourth value in variable "length.cm"
length.cm[4]

# Using boolean operators for evaluation =======================
a < b  # Is a smaller/less than b? 
a > b  # Is a larger/more than b? 
a == b # Is a equal to b?

# Combine indexing and booleans to answer questions ============
#How tall is the tallest person?
max(length.cm)

#Who in "length.cm" is 201 cm tall?
length.cm == 201

#What is the index of the subjects that is 201 cm tall?
which(length.cm == 201)

#As one combined command or line of conde
which(length.cm == max(length.cm))

# Collecting data in data frames ===============================
#Create new variable "age"
age <- c(27,36,29,42,51,32,22,35)

#Combine variables to data frame "df"
df <- data.frame(age, length.cm)

#Show first columns and rows of "df"
head(df)

# Use index or column names to access what's in data frame =====

#What is in row 3 in the 2nd column in data frame "df"?
df[3,2]

#What is in the 2nd column in data frame "df"?
df[,2]

#What is in column "length.cm" in data frame "df" ?
df[,"length.cm"]

#Dollar sign ($) is easy to use for accessing columns
df$length.cm

#Using functions on variables in a data frame ==================
#Mean of length
mean(df$length.cm)

#Mean of age
mean(df$age)

#Plot data from a data frame ===================================
#Scatter plot of length as function of age
plot(df$age, df$length.cm, 
     xlab = "Age (years)",
     ylab = "Length (cm)")

#Perform statistical tests on data in data frame ===============
#Pearsons correlation test of age and length
cor.test(df$age, df$length.cm)