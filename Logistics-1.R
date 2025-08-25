Logistics_complete <- read.csv("D:/MASTERS/FALL24/MGT256-BusinessAnalyticsForManagement/GRP_PROJECT/logistics1.csv")
head(Logistics_complete)
dim(Logistics_complete)

#####    HANDLING MISSING VALUES    #####

# Checking NA values
Logistics_complete[!complete.cases(Logistics_complete),]

# Removing NA values
Logistics <- na.omit(Logistics_complete)
dim(Logistics)
Logistics[!complete.cases(Logistics),]

#####    VISUALIZATIONS    #####

# BoxPlot for Delivery lead time

boxplot(Logistics$delivery_lead_time, ylab = "Delivery Lead Time (in days)")
unique(Logistics$delivery_lead_time)

# BoxPlot for Distance

boxplot(Logistics$distance_km, ylab = "Distance (in kms)")

# Scatter plot - Delivery lead time VS Distance

plot(Logistics$delivery_lead_time, Logistics$distance_km, xlab = "Delivery Lead Time (in days)", ylab = "Distance (in kms)", col="blue")
subset_DLT<- subset(Logistics, Logistics$delivery_lead_time>0)
plot(subset_DLT$delivery_lead_time, subset_DLT$distance_km, xlab = "Delivery Lead Time (in days)", ylab = "Distance (in kms)", col="blue")

# Number of stops
unique(Logistics$num_stops)

subset_no_stops <- subset(Logistics, Logistics$num_stops == 0)
mean(subset_no_stops$delivery_lead_time) # 3.8

subset_stops <- subset(Logistics, Logistics$num_stops > 0)
mean(subset_stops$delivery_lead_time) # 4.5

matrix_stops <- matrix(c(4.5, 3.8), ncol = 2, byrow = T)
colnames(matrix_stops)<- c("Number of stops are more than zero", "Number of stops are zero")
barplot(matrix_stops, col = "red", ylab = "Average Delivery Time (in days)")
abline(h=0)

boxplot(Logistics$num_stops)
hist(Logistics$num_stops, xlab = "Number of stops", main = "Histogram of number of stops", col="orange")
plot(Logistics$delivery_lead_time, Logistics$num_stops, xlab = "Delivery Lead Time (in days)", ylab = "Number of stops")

# Carrier Riliability
boxplot(Logistics$carrier_reliability, col="maroon", ylab = "Carrier Reliability (in %)")

subset_Reliable <- subset(Logistics, Logistics$carrier_reliability > 90)
mean(subset_Reliable$delivery_lead_time)

subset_Not_Reliable <- subset(Logistics, Logistics$carrier_reliability < 90)
mean(subset_Not_Reliable$delivery_lead_time)

matrix_reliable <- matrix(c(4, 4.3), ncol = 2, byrow = T)
colnames(matrix_reliable)<- c("Reliablity > 90%", "Reliablity < 90%")
barplot(matrix_reliable, col = "red", ylab = "Average Delivery Time (in days)")
abline(h=0)

plot(Logistics$delivery_lead_time, Logistics$carrier_reliability, xlab = "Delivery Lead Time (in days)", ylab = "Carrier Riliability")

# Weather conditions
unique(Logistics$weather_conditions)
freq_table_weather <- table(Logistics$weather_conditions)
barplot(freq_table_weather, ylab = "Frequency")
abline(h=0)

categories_weather <- factor(Logistics$weather_conditions)
plot(Logistics$delivery_lead_time, Logistics$distance_km, col= as.numeric(categories_weather), xlab = "Delivery Lead Time (in days)", ylab = "Distance (in kms)")

subset1 <- subset(Logistics, Logistics$weather_conditions== "Clear")
mean(subset1$delivery_lead_time)
# 4.0

subset2 <- subset(Logistics, Logistics$weather_conditions== "Rain" | Logistics$weather_conditions== "Snow" | Logistics$weather_conditions== "Storm" )
mean(subset2$delivery_lead_time)
# 4.8

matrix_weather <- matrix(c(4, 4.8), ncol = 2, byrow = T)
colnames(matrix_weather)<- c("Weather is clear", "Weather is not clear")
barplot(matrix_weather, col = "green", ylab = "Average Delivery Time (in days)")
abline(h=0)


# Custom Clearence 
unique(Logistics$customs_clearance)
freq_tab_customs <- table(Logistics$customs_clearance)
barplot(freq_tab_customs, ylab = "Frequency")
abline(h=0)

subset_customs <- subset(Logistics, Logistics$customs_clearance =="Yes")
mean(subset_customs$delivery_lead_time) # 5.5

subset_no_customs <- subset(Logistics, Logistics$customs_clearance =="No")
mean(subset_no_customs$delivery_lead_time) # 3.8

matrix_customs <- matrix(c(3.8, 5.5), ncol = 2, byrow = T)
colnames(matrix_customs)<- c("Customs clearance is not needed", "Customs clearance is needed")
barplot(matrix_customs, col = "blue", ylab = "Average Delivery Time (in days)")
abline(h=0)

# Shipment urgency

unique(Logistics$shipment_urgency)
freq_tab_urgency <- table(Logistics$shipment_urgency)
barplot(freq_tab_urgency, ylab = "Frequency")
abline(h=0)

subset_urgent <- subset(Logistics, Logistics$shipment_urgency == "High")
mean(subset_urgent$delivery_lead_time) # 3.4

subset_not_urgent <- subset(Logistics, Logistics$shipment_urgency == "Low")
mean(subset_not_urgent$delivery_lead_time) # 4.4

matrix_urgency <- matrix(c(3.4, 4.4), ncol = 2, byrow = T)
colnames(matrix_urgency)<- c("Shipment urgency is high", "Shipment urgency is low")
barplot(matrix_urgency, col = "yellow", ylab = "Average Delivery Time (in days)")
abline(h=0)

# Supply chain disruption

freq_tab_disruprion <- table(Logistics$supply_chain_disruption)
barplot(freq_tab_disruprion, ylab = "Frequency")
abline(h=0)

subset_no_disruption <- subset(Logistics, Logistics$supply_chain_disruption== "No")
mean(subset_no_disruption$delivery_lead_time) # 4.0

subset_disruption <- subset(Logistics, Logistics$supply_chain_disruption== "Yes")
mean(subset_disruption$delivery_lead_time) # 6.5

matrix_disruption <- matrix(c(4, 6.5), ncol = 2, byrow = T)
colnames(matrix_disruption)<- c("No Supply Chain Disruption", "Supply Chain Disruption")
barplot(matrix_disruption, col = "maroon", ylab = "Average Delivery Time (in days)")
abline(h=0)

# Order Volume

plot(Logistics$delivery_lead_time, Logistics$order_volume, xlab = "Delivery Lead Time (in days)", ylab = "Order Volume")

# Shipment weight

plot(Logistics$delivery_lead_time, Logistics$shipment_weight, xlab = "Delivery Lead Time (in days)", ylab = "Shipment Weight")

# Shipment Volume

plot(Logistics$delivery_lead_time, Logistics$shipment_volume, xlab = "Delivery Lead Time (in days)", ylab = "Shipment Volume")


#####    REMOVING OUTLIERS    #####

Q1 <- quantile(Logistics$distance_km, 0.25)
Q3 <- quantile(Logistics$distance_km, 0.75)
IQR <- Q3 - Q1

lower_bound <- Q1 - 1.5 * IQR
upper_bound <- Q3 + 1.5 * IQR

library(dplyr)
logistics_cleaned <- Logistics %>% filter(between(Logistics$distance_km, lower_bound, upper_bound))

boxplot(logistics_cleaned$distance_km, ylab = "Distance (in kms)")
boxplot(Logistics$distance_km, ylab = "Distance (in kms) with outliers")

# Removing negative delivery lead time values

logistics_cleaned <- logistics_cleaned %>% filter(logistics_cleaned$delivery_lead_time>0)
boxplot(logistics_cleaned$delivery_lead_time, ylab = "Delivery time")

# Removing unwanted columns

logistics_cleaned <- logistics_cleaned %>% select(-id, -factory_location, -destination)
logistics_cleaned <- logistics_cleaned %>% select(-X)
colnames(logistics_cleaned)

# More Visualizations

boxplot(logistics_cleaned$distance_km, ylab = "Distance (in kms)", col = "blue")

freq_table_transport <- table(logistics_cleaned$transport_mode)
barplot(freq_table_transport, xlab = "Transport mode", ylab = "Frequency", col = "blue")
abline(h=0)

hist(logistics_cleaned$num_stops, xlab = "Number of stops", ylab = "Frequency", col = "red")

freq_tab_urgency1 <- table(logistics_cleaned$shipment_urgency)
barplot(freq_tab_urgency1,xlab = "Shipment Urgency" ,ylab = "Frequency", col = "red")
abline(h=0)

freq_table_weather1 <- table(logistics_cleaned$weather_conditions)
barplot(freq_table_weather1,xlab = "Weather Conditions", ylab = "Frequency", col = "green")
abline(h=0)

freq_table_product <- table(logistics_cleaned$product_type)
barplot(freq_table_product ,xlab = "Product Type", ylab = "Frequency", col = "green")
abline(h=0)

freq_tab_customs1 <- table(logistics_cleaned$customs_clearance)
barplot(freq_tab_customs1,xlab = "Customs clearance needed", ylab = "Frequency", col = "yellow")
abline(h=0)

freq_tab_disruprion1 <- table(logistics_cleaned$supply_chain_disruption)
barplot(freq_tab_disruprion1,xlab="Supply chain disruption", ylab = "Frequency", col = "yellow")
abline(h=0)

#####    VARIABLE SELECTION AND MULTIPLE LINEAR REGRESSION    #####

logistics_cleaned$transport_mode <- as.factor(logistics_cleaned$transport_mode)
logistics_cleaned$shipment_urgency <- as.factor(logistics_cleaned$shipment_urgency)
logistics_cleaned$weather_conditions <- as.factor(logistics_cleaned$weather_conditions)
logistics_cleaned$product_type <- as.factor(logistics_cleaned$product_type)
logistics_cleaned$packaging_type <- as.factor(logistics_cleaned$packaging_type)
logistics_cleaned$special_handling <- as.factor(logistics_cleaned$special_handling)
logistics_cleaned$customs_clearance <- as.factor(logistics_cleaned$customs_clearance)
logistics_cleaned$supply_chain_disruption <- as.factor(logistics_cleaned$supply_chain_disruption)
logistics_cleaned$seasonality <- as.factor(logistics_cleaned$seasonality)
logistics_cleaned$temp_control <- as.factor(logistics_cleaned$temp_control)

# Data Partitioning for linear regression

set.seed(1)
train_indices <- sample(1:nrow(logistics_cleaned),
                        size=nrow(logistics_cleaned)*0.6,
                        replace=F)

logistics_train <- logistics_cleaned[train_indices,]
logistics_validation <- logistics_cleaned[-train_indices,]

# Variable selection

library(leaps)

# Best subset variable selection method

regfit.best <- regsubsets(delivery_lead_time ~ ., data = logistics_train, nvmax = 17)
reg.summary <- summary(regfit.best)
names(reg.summary)
reg.summary$adjr2

plot(reg.summary$adjr2, xlab = "Number of Variables",
     ylab = "Adjusted RSq", type = "l")

which.max(reg.summary$adjr2)

plot(reg.summary$adjr2, xlab = "Number of Variables",
     ylab = "Adjusted RSq", type = "l")

points(13, reg.summary$adjr2[13], col = "red", cex = 2, 
       pch = 20)

coef(regfit.best,13)

# Forward selection method

regfit.fwd <- regsubsets(delivery_lead_time ~ ., data = logistics_train, nvmax = 17, method = "forward")
reg.summary1 <- summary(regfit.fwd)
which.max(reg.summary1$adjr2)
coef(regfit.fwd,13)

# Linear regression using best subset variables #

Linear_reg_mod_bestsubset<- lm(delivery_lead_time ~ distance_km+ transport_mode+ num_stops+ shipment_urgency+ weather_conditions+ product_type+ customs_clearance+ supply_chain_disruption, data = logistics_train)
predicted.best <- predict(Linear_reg_mod_bestsubset, logistics_validation)
forecast::accuracy(predicted.best, logistics_validation$delivery_lead_time)
# RMSE: 0.542

summary(Linear_reg_mod_bestsubset)
# Adj R Squared: 0.9323

# Linear regression using all variables #

Linear_reg_mod_all<- lm(delivery_lead_time ~ ., data = logistics_train)
predicted.all <- predict(Linear_reg_mod_all, logistics_validation)
forecast::accuracy(predicted.all, logistics_validation$delivery_lead_time)
# RMSE: 0.544

summary(Linear_reg_mod_all)
# Adj R Squared: 0.9313


#####    K NEAREST NEIGHBOURS    #####

library(caret)

# Data partitioning for KNN

train_indices_knn <- sample(1:nrow(logistics_cleaned),
                        size=nrow(logistics_cleaned)*0.9,
                        replace=F)

logistics_train_valid <- logistics_cleaned[train_indices_knn,]
logistics_test <- logistics_cleaned[-train_indices_knn,]

# KNN

myCtrl<-trainControl(method="cv", number=10)

myGrid<-expand.grid(.k=c(1:15))

set.seed(1)
knn_logistics<-train(as.numeric(delivery_lead_time)~distance_km+ transport_mode+ num_stops+ shipment_urgency+ weather_conditions+ product_type+ customs_clearance+ supply_chain_disruption, 
                  data=logistics_train_valid,
                  method="knn",
                  trControl=myCtrl,
                  tuneGrid=myGrid,
                  preProc=c("center","scale"))

knn_logistics

predicted_knn<-predict(knn_logistics, newdata=logistics_test, type='raw') 

forecast::accuracy(predicted_knn,logistics_test$delivery_lead_time)
# RMSE: 1.131

#mean(logistics_cleaned$delivery_lead_time)
