

Real10 = read.table(file = paste("./data/1d/Real10.csv", sep = ""), sep = ",", header = TRUE)
Real11 = read.table(file = paste("./data/1d/Real11.csv", sep = ""), sep = ",", header = TRUE)
Real12 = read.table(file = paste("./data/1d/Real12.csv", sep = ""), sep = ",", header = TRUE)
Real13 = read.table(file = paste("./data/1d/Real13.csv", sep = ""), sep = ",", header = TRUE)



#####


ts = Real11

gg_ts = ggplot(ts, aes(x = timestamp, y = value))
gg_ts =  gg_ts + geom_line()
ggplotly( gg_ts )


acf(ts$value)
pacf(ts$value)

model = arima(ts$value, order = c(1, 1, 1))

plot(forecast(model))


summary(model)


#####


ts = Real12

gg_ts = ggplot(ts, aes(x = timestamp, y = value))
gg_ts =  gg_ts + geom_line()
ggplotly( gg_ts )


acf(ts$value)
pacf(ts$value)

model = arima(ts$value, order = c(1, 0, 1),  seasonal = list(order = c(1, 0, 1), period = 7 ))

plot(forecast(model, h =  30))


summary(model)