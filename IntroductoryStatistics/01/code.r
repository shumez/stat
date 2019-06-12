# Filename: 	code.r
# Project: 	/Users/shume/Developer/stat/IntroductoryStatistics/01
# Author: 	shumez <https://github.com/shumez>
# Created: 	2019-05-25 14:06:7
# Modified: 	2019-05-25 14:21:43
# -----
# Copyright (c) 2019 shumez

# 01

require(ggplot2)
install.packages("dplyr")
require(dplyr)
library(dplyr)
install.packages("tidyr")
library(tidyr)

dir = '~/Developer/stat/IntroductoryStatistics/01'
setwd(dir)
dir_fig = file.path(dir, 'fig')

# Collaborative Exercise

dat = c(5, 5.5, 6, 6, 6, 6.5, 6.5, 6.5, 6.5, 7, 7, 8, 8, 9)
df = data.frame(SleepingTime=dat)
View(df)

p <- ggplot(df, aes(SleepingTime))
p <- p + geom_dotplot(binwidth = .5, dotsize=1)#, method = "histodot")
p %+% geom_histogram(binwidth = .5)
p <- p + labs(x='Sleeping Time')
ggsave(file.path(dir_fig,'0102.png'), width = 3, height = 3)


# 01.01.


# 01.02. 
College = c('De Anza College', 'Foothill College')
FullTime = c(9200, 4059)
PartTime = c(13296, 10124)
df = data.frame(College=College, 'FullTime'=FullTime, 'PartTime'=PartTime)
View(df)

dat <- gather(df, 'category', 'number', -College)
dat$category[which(dat$category=='FullTime')] <- 'Full-time'
dat$category[which(dat$category=='PartTime')] <- 'Part-time'
dat$College <- as.character(dat$College)
dat$College[which(dat$College=='De Anza College')] <- 'De Anza'
dat$College[which(dat$College=='Foothill College')] <- 'Foothill'
View(dat)
ggplot(dat, aes(College, number, fill=category)) + geom_col()
ggsave(file.path(dir_fig, '0106.png'), width = 3, height = 3)


# 01.02.03. Variation in Data
cans = c(15.8, 16.1, 15.2, 14.8, 15.8, 15.9, 16.0, 15.5)
sd(cans)

# 01.03. Frequency, Frequency Tables, and Levels of Measurement

# 01.03.03. Frequency

StudentWorkHours = data.frame(DataValue=c(2, 3, 4, 5, 6, 7), Frequency=c(3, 5, 3, 6, 2, 1))
StudentWorkHours$RelativeFrequency = StudentWorkHours$Frequency/sum(StudentWorkHours$Frequency)
StudentWorkHours$CumulativeRelativeFrequency = rep(0, length(StudentWorkHours$RelativeFrequency))
for (i in 1:length(StudentWorkHours$RelativeFrequency)) {
  if(i == 1){
    StudentWorkHours$CumulativeRelativeFrequency[1] = StudentWorkHours$RelativeFrequency[1]
  }else{
    StudentWorkHours$CumulativeRelativeFrequency[i] = StudentWorkHours$RelativeFrequency[i] + StudentWorkHours$CumulativeRelativeFrequency[i-1]
  }
}
View(StudentWorkHours)

SoccerPlayerHeight = data.frame(height=c('59.95–61.95', '61.95–63.95', '63.95–65.95', '65.95–67.95', '67.95–69.95', '69.95–71.95', '71.95–73.95', '73.95–75.95'), 
                                height_from = c(59.95, 61.95, 63.95, 65.95, 67.95, 69.95, 71.95, 73.95),
                                height_to = c(61.95, 63.95, 65.95, 67.95, 69.95, 71.95, 73.95, 75.95),
                                frequency=c(5, 3, 15, 40, 17, 12, 7, 1))
SoccerPlayerHeight$RelativeFrequency = SoccerPlayerHeight$frequency / sum(SoccerPlayerHeight$frequency)
View(SoccerPlayerHeight)
