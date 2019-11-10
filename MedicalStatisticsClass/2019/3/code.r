# Filename:	code.r
# Project:	/Users/shume/Developer/stat/MedicalStatisticsClass/2019/3
# Authors:	shumez <https://github.com/shumez>
# Created:	2019-10-23 16:38:57
# Modified:	2019-11-10 15:02:05
# -----
# Copyright (c) 2019 shumez

##### 医学統計勉強会18　第3回　連続変数の比較　R code #####

# 二標本問題 ##
x1 <- c(8, 17, 9, 5, 14, 13, 13, 3, 9, 0)
x2 <- c(19, 13, 13, 18, 21, 18, 11, 21, 20, 11)

boxplot(x1, x2)

t.test(x1, x2)		# Welch's t test
wilcox.test(x1, x2)	# Mann-Whitney test, Wilcoxon's rank sum test

# QQ-norm plot #

qqplot(x1)
qqline(x1)

qqplot(x2)
qqline(x2)

# Shapiro-Wilk normality test #

shapiro.test(x1)



## 分散分析 ##

# サンプルデータ #
Data <- data.frame(
	z = c(8, 16, 7, 18, 6, 11, 15, 11, 20, 7, 19, 20, 21, 19, 24), 
	group = factor(c(rep(1,5), rep(2,5), rep(3,5)), label=c("placebo", "drugA", "drugB")))
print(Data)
boxplot(z ~ group, data=Data)

# One-way ANOVA #
fit.aov <- aov(z ~ group, data=Data)
summary(fit.aov)

# One-way ANOVA (not assuming equal variances) #
oneway.test(z ~ group, data=Data)

# Kruskal-Wallis rank sum test #
kruskal.test(z ~ group, data=Data)



## モデル診断 (model diagnostics) ##

par(mfrow=c(2,2))
plot(fit.aov)
par(mfrow=c(1,1))



## Box-Cox transformation ##

library(MASS)
bxcx <- boxcox(fit.aov)
lambda <- bxcx$x[which.max(bxcx$y)]

fit.aov2 <- aov((z^lambda - 1)/lambda ~ group, data=Data)
summary(fit.aov2)

par(mfrow=c(2,2))
plot(fit.aov2)
par(mfrow=c(1,1))



## 多重比較 ##

# Tukey's method #
library(MASS)
fit.mc <- TukeyHSD(fit.aov)
print(fit.mc)
plot(fit.mc)

# Dunnett's method (Dunnett post hoc test) #
install.packages("multcomp")	# 最初の一回のみ実行
library(multcomp)
fit.dunnett <- glht(fit.aov, linfct = mcp(group = "Dunnett"))
confint(fit.dunnett, level=0.95)
summary(fit.dunnett)

# William's method #
fit.williams <- glht(fit.aov, linfct = mcp(group = "Williams"))
confint(fit.williams, level=0.95)
summary(fit.williams)