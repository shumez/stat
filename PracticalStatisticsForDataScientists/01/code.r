# code

setwd('~/Developer/stat/PracticalStatisticsForDataScientists/01/')

state <- read.csv(file = 'data/state.csv')
View(state)

mean(state[["Population"]])
mean(state$Population)
mean(state$Population, trim = .1)
median(state$Population)
weighted.mean(state$Murder.Rate, w = state$Population)

install.packages('matrixStats')
library('matrixStats')
weightedMedian(state$Murder.Rate, w = state$Population)
