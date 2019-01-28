
### 1. Load packages
is.installed <- function(mypkg){
  is.element(mypkg, installed.packages()[,1])
} 

if (!is.installed("ggplot2")){ devtools::install_github('hadley/ggplot2') } 
require("ggplot2") 
if (!is.installed("plotly")){ install.packages("plotly") }
require("plotly") 
if (!is.installed("gridExtra")){ install.packages("daattali/ggExtra") }
require("gridExtra") 

### 2. Load data

SinusNoise = read.table(file = paste("./data/5m/SinusNoise.csv", sep = ""), sep = ",", header = TRUE)

DailyHumanNoise = read.table(file = paste("./data/5m/DailyHumanNoise.csv", sep = ""), sep = ",", header = TRUE)
WeeklyHumanNoise = read.table(file = paste("./data/5m/WeeklyHumanNoise.csv", sep = ""), sep = ",", header = TRUE)

SpikesLow = read.table(file = paste("./data/5m/SpikesLow.csv", sep = ""), sep = ",", header = TRUE)
SpikesMedium = read.table(file = paste("./data/5m/SpikesMedium.csv", sep = ""), sep = ",", header = TRUE)
SpikesHigh = read.table(file = paste("./data/5m/SpikesHigh.csv", sep = ""), sep = ",", header = TRUE)


Real1 = read.table(file = paste("./data/5m/Real1.csv", sep = ""), sep = ",", header = TRUE)
Real2 = read.table(file = paste("./data/5m/Real2.csv", sep = ""), sep = ",", header = TRUE)
Real3 = read.table(file = paste("./data/5m/Real3.csv", sep = ""), sep = ",", header = TRUE)
Real4 = read.table(file = paste("./data/5m/Real4.csv", sep = ""), sep = ",", header = TRUE)
Real5 = read.table(file = paste("./data/5m/Real5.csv", sep = ""), sep = ",", header = TRUE)
Real6 = read.table(file = paste("./data/5m/Real6.csv", sep = ""), sep = ",", header = TRUE)

### 3. Basic plot
ts = WeeklyHumanNoise

gg_ts = ggplot(ts, aes(x = timestamp, y = value))
gg_ts =  gg_ts + geom_line()
ggplotly( gg_ts )


### 4. FFT

# 4.a calculate the FFT for several SinusNoise and DailyHumanNoise time series. 
# What is the season according to the spectrum? Which algorithm can we derive from this observation.


#HINT : use the R function spectrum, type "?spectrum" fro the help


# 4.b Do the same for SpikesLow, SpikesMedium, SpikesHigh
# Is youre algorithm will work in such a case ? What is the problem?


# 4.c Do the same for WeeklyHumanNoise
# Is youre algorithm will work in such a case ? What is the problem?





spectrum = spectrum(ts$value)
spectrum = data.frame(freq =   spectrum$freq, spec =   spectrum$spec)

gg_spectrum = ggplot(spectrum, aes(x = freq, y = spec))
gg_spectrum = gg_spectrum + geom_vline(xintercept = 300/(3600 * 24), color = "red")
#gg_spectrum = gg_spectrum + geom_vline(xintercept = 2 * 300/(3600 * 24), color = "orange")
#gg_spectrum = gg_spectrum + geom_vline(xintercept = 3 * 300/(3600 * 24), color = "yellow")
gg_spectrum = gg_spectrum + geom_line()
gg_spectrum = gg_spectrum + xlim(0, 5 * 300/(3600 * 24))
ggplotly( gg_spectrum )


### 5. ACF

acf = acf(ts$value, lag.max = 5 * (3600 * 24) / 300)
acf = data.frame(lag = 300 *  acf$lag, acf =   acf$acf)

gg_acf = ggplot(acf, aes(x = lag, y = acf))
gg_acf = gg_acf + geom_point() + geom_bar(width = 5, stat = "identity")
ggplotly( gg_acf )

grid.arrange(gg_ts, gg_spectrum, gg_acf, ncol = 1)