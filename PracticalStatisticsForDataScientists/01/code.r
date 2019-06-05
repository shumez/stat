# code

library(ggplot2)
library(GGally)
install.packages('matrixStats')
library('matrixStats')
install.packages("corrplot")
library(corrplot)#, method="ellipse")

setwd('~/Developer/stat/PracticalStatisticsForDataScientists/01/')
dir_data = '~/Developer/stat/PracticalStatisticsForDataScientists/data/'

state <- read.csv(file = file.path(dir_data, 'state.csv'))
View(state)



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
p

breaks <- seq(from=min(state$Population), to=max(state$Population), length=11)
pop_freq <- cut(state$Population, breaks=breaks, right=TRUE, include.lowest=TRUE)
table(pop_freq)

hist(state$Population, breaks=breaks, xlab='Population (millions)', main='Population')

hist(state$Murder.Rate, freq=FALSE, main='Murder Rate', xlab='Murder Rate')
lines(density(state$Murder.Rate), lwd=3, col='blue')


# 01.06.
dfw = read.csv(file.path(dir_data, 'dfw_airline.csv'))
View(dfw)
# cause = c('Carrier', 'ATC', 'Weather', 'Security', 'Inbound')
# delay = c(23.02, 30.40, 4.03, 0.12, 42.43)
# dfw = data.frame(cause=cause, delay=delay)

barplot(dfw)
p <- ggplot(dfw) + geom_col(aes(cause, delay))
p

# 01.07. 
sp500_px = read.csv(file.path(dir_data, 'sp500_px.csv'), row.names = 1)
sp500_sym = read.csv(file.path(dir_data, 'sp500_sym.csv'))
View(sp500_px)
View(sp500_sym)

etfs = sp500_px[row.names(sp500_px) > "2012-07-01", 
                sp500_sym[sp500_sym$sector=="etf", 'symbol']]
View(etfs)


corrplot(cor(etfs))
p <- ggcorr(etfs, palette='Viridis') + scale_colour_viridis_c()
p


p <- ggplot(sp500_px, aes(T, VZ)) + geom_point(alpha=.5)
p


# 01.08. 
house0 <- read.csv(file.path(dir_data, 'kc_tax.csv'))
View(house0)

p <- ggplot(house0, aes(SqFtTotLiving, TaxAssessedValue)) + stat_binhex(colour='white')
p <- p + theme_bw() + scale_fill_gradient(limits=c(0, 9000), low = 'white', high = 'blue')# + labs(x=)
p


airline_stats = read.csv(file.path(dir_data, 'airline_stats.csv'))
airline_stats$pct_delay = airline_stats$pct_atc_delay + airline_stats$pct_carrier_delay + airline_stats$pct_weather_delay
View(airline_stats)
boxplot(pct_carrier_delay ~ airline, data=airline_stats, ylim=c(0, 30), ylab='Percent of airline delays by carrier', title='Percent of airline delays by carrier')

p <- ggplot(airline_stats, aes(airline, pct_carrier_delay)) + 
  geom_violin(draw_quantiles = c(.25, .5, .75), fill='lightblue') +
  # geom_boxplot(alpha=.2) +
  # geom_jitter(height = 0, width = .1, alpha=.1)
  ylim(0, 30) +
  ylab('Percent Delayed')
p






