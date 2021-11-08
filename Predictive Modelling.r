#Load all relevant libraries
library(forecast)
library(MLmetrics)
library(astsa)

#Read in the bikeshare data (aggregated by month)
bshare <- read.csv("bikeshare_monthly.csv")

head(bshare)

#Convert bikeshare monthly data into a time series object
bshare_ts <- ts(df["Number.of.Trips"],frequency=12,start=c(2018,1))

print(bshare_ts)

#Plot the data on a line graph
plot.ts(bshare_ts,col="blue",xlab="Period", ylab="Number of Trips",main="Number of Trips per Month (2018-2020)", type='l',lwd=2)

#Decompose the data into trend, seasonal and random components
bshare_decomposed <- decompose(bshare_ts,"multiplicative")

plot(bshare_decomposed)

print(bshare_decomposed$seasonal)

#Create training and test sets
training <- window(bshare_ts, start = c(2018,1), end = c(2020,6))
validation <- window(bshare_ts, start = c(2020,7))


naive = snaive(training, h=length(validation))

#plot the actual values
plot(bshare_ts,col="blue",xlab="Period", ylab="Number of Trips",main="Seasonal Naive Forecast", type='l',lwd=2)
#plot the predicted values
lines(naive$mean,col="orange",lwd=2)
#add a legend
legend("topleft",inset=.03,legend=c("actual", "predicted"),col=c("blue","orange"),lty=1:1,cex=0.8)

MAPE(naive$mean, validation) * 100

RMSE(naive$mean, validation)

#Build and train a DSHW model
dshw_model = dshw(training, period1=2, period2 = 12, h=length(validation))

#plot the actual values
plot(bshare_ts,col="blue",xlab="Period", ylab="Number of Trips",main="DSHW Forecast", type='l',lwd=2)
#plot the predicted values
lines(dshw_model$mean,col="orange",lwd=2)
#add a legend
legend("topleft",inset=.03,legend=c("actual", "predicted"),col=c("blue","orange"),lty=1:1,cex=0.8)

MAPE(dshw_model$mean, validation)*100

RMSE(dshw_model$mean, validation)

sarima_forecast = sarima.for(training, n.ahead=length(validation),
                              p=1,d=1,q=1,P=1,D=1,Q=0,S=12)

#plot the actual values
plot(bshare_ts,col="blue",xlab="Period", ylab="Number of Trips",main="SARIMA Forecast", type='l',lwd=2)
#plot the predicted values
lines(sarima_forecast$pred,col="orange",lwd=2)
#add a legend
legend("topleft",inset=.03,legend=c("actual", "predicted"),col=c("blue","orange"),lty=1:1,cex=0.8)

MAPE(sarima_forecast$pred, validation) * 100

RMSE(sarima_forecast$pred, validation)

tbats_model = tbats(training)
tbats_forecast = forecast(tbats_model, h=length(validation))

#plot the actual values
plot(bshare_ts,col="blue",xlab="Period", ylab="Number of Trips",main="TBATS Forecast", type='l',lwd=2)
#plot the predicted values
lines(tbats_forecast$mean,col="orange",lwd=2)
#add a legend
legend("topleft",inset=.03,legend=c("actual", "predicted"),col=c("blue","orange"),lty=1:1,cex=0.8)

MAPE(tbats_forecast$mean, validation) * 100

RMSE(tbats_forecast$mean, validation)

nn_model <- nnetar(training)
nn_forecast <- forecast(nn_model, h=length(validation))

#plot the actual values
plot(bshare_ts,col="blue",xlab="Period", ylab="Number of Trips",main="Neural Network Forecast", type='l',lwd=2)
#plot the predicted values
lines(nn_forecast$mean,col="orange",lwd=2)
#add a legend
legend("topleft",inset=.03,legend=c("actual", "predicted"),col=c("blue","orange"),lty=1:1,cex=0.8)

MAPE(nn_forecast$mean, validation) * 100

RMSE(nn_forecast$mean, validation)


