# code

setwd('~/Developer/stat/PracticalStatisticsForDataScientists/01/')

state <- read.csv(file = 'data/state.csv')
View(state)

library(ggplot2)
library(GGally)
dat_state = data.frame(state$Population, state$Murder.Rate, row.names = state$State)
# View(state_tbl)
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