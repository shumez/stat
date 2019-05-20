# code

setwd('~/Developer/stat/PracticalStatisticsForDataScientists/01/')

state <- read.csv(file = 'data/state.csv')
View(state)

library(ggplot2)
library(GGally)
dat_state = data.frame(Population = state$Population, MurderRate=state$Murder.Rate, row.names = state$State)
View(dat_state)
p = ggpairs(dat_state)
p = ggplot(state, aes(Population)) + geom_histogram()

# 01.03.
mean(state[["Population"]])
mean(state$Population)
mean(state$Population, trim = .1)
median(state$Population)
weighted.mean(state$Murder.Rate, w = state$Population)

install.packages('matrixStats')
library('matrixStats')
weightedMedian(state$Murder.Rate, w = state$Population)

# 01.04.
sd(state$Population)
IQR(state$Population)
mad(state$Population)


# 01.05. 
quantile(state$Murder.Rate, p=c(.05, .25, .5, .75, .95))

boxplot(state$Population/1000000, ylab='Population (millions)')

p <- ggplot(state, aes(Population)) 
p <- p + geom_boxplot(aes(ymin=min(state$Population), lower=quantile(state$Population, .25), middle=median(state$Population), upper=quantile(state$Population, .75), ymax=max(state$Population)), stat='identity')


breaks <- seq(from=min(state$Population), to=max(state$Population), length=11)
pop_freq <- cut(state$Population, breaks=breaks, right=TRUE, include.lowest=TRUE)
table(pop_freq)

hist(state$Population, breaks=breaks, xlab='Population (millions)', main='Population')

hist(state$Murder.Rate, freq=FALSE, main='Murder Rate', xlab='Murder Rate')
lines(density(state$Murder.Rate), lwd=3, col='blue')


# 01.06.
cause = c('Carrier', 'ATC', 'Weather', 'Security', 'Inbound')
delay = c(23.02, 30.40, 4.03, 0.12, 42.43)
dfw = data.frame(delay=delay, row.names=cause)
View(dfw)
barplot(dfw$delay)



