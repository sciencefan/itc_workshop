if (!is.installed("forecast")){ install.packages("forecast") }  
require("forecast") 

Real10 = read.table(file = paste("./data/1d/Real10.csv", sep = ""), sep = ",", header = TRUE)
Real11 = read.table(file = paste("./data/1d/Real11.csv", sep = ""), sep = ",", header = TRUE)
Real12 = read.table(file = paste("./data/1d/Real12.csv", sep = ""), sep = ",", header = TRUE)
Real13 = read.table(file = paste("./data/1d/Real13.csv", sep = ""), sep = ",", header = TRUE)

ts = Real11

#####


#1. Open the 1d directory. Load and plot the data

#2. Try to fit an arima for Real11

#3. Make a forecast and plot it

#4. Refine the model with Box-Jenkins method

#5. Find the best model with auto.arima

#6. Do the same with Real12

#7. Try to estimate a seasonal arima for a weekly 5m time series


