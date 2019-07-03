# Filename: 	code.r
# Project: 	/Users/shume/Developer/stat/MedicalStatisticsClass2015/01
# Author: 	shumez <https://github.com/shumez>
# Created: 	2019-06-26 20:15:5
# Modified: 	2019-07-03 16:24:11
# -----
# Copyright (c) 2019 shumez

x <- c(0.684, 1.406, -0.663, -0.124, 0.849, -0.888, -0.492, -0.044, -0.188, 0.536, 2.063, -1.379, 0.920, 0.453, 1.239)
df <- data.frame(x=x, class=rep('x', length(x)))
diamonds

View(df)

library('ggplot2')
length(df$carat)
round(1 + log2(length(diamonds$carat)))

p <- ggplot(df, aes(x)) + geom_histogram(binwidth=.5)
p <- ggplot(diamonds, aes(carat, fill=cut)) + geom_histogram(bins=round(1 + log2(length(diamonds$carat))))
p <- ggplot(df, aes(class, x)) + 
  geom_boxplot() + 
  geom_jitter(width=0)# +
p <- p + annotate('text', aes(label='25% quantile'), x=1, y=quantile(df$x, .25))
  # geom_text(aes(x=1, y=quantile(df$x, .25), label='25% quantile'))

p <- ggplot(df, aes(class, x)) + geom_violin(draw_quantiles = c(0.25, 0.5, 0.75)) + geom_jitter(width=0)

p <- ggplot(df, aes(class, x)) + geom_point()
p


# Two sample test
x1 <- c(8, 17, 9, 5, 14, 13, 13, 3, 9, 0)
x2 <- c(19, 13, 13, 18, 21, 18, 11, 21, 20, 11)

boxplot(x1, x2)

# Welch's t test
t.test(x1, x2)
# Mann-Whitney test, Wilcoxon’s rank sum test
wilcox.test(x1, x2)
