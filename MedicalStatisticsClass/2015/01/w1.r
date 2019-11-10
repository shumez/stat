##### 医学統計勉強会15第一回基本統計量　R code #####

x <- c(0.684, 1.406, -0.663, -0.124, 0.849, -0.888, -0.492, -0.044, -0.188, 0.536, 2.063, -1.379, 0.920, 0.453, 1.239)

## 数量的なデータの要約 ##

sum(x)			# x の要素の和
length(x)		# x の長さ
mean(x)			# x の平均
median(x)		# x の中央値
quantile(x)		# x の四分位点．Five numbers summary
quantile(x, 0.2)	# x の20%パーセント点
summary(x)			# Five numbers summary + 平均

var(x)			# x の分散
sd(x)			# x の標準偏差
sqrt(x)			# x の平方根
sqrt(var(x))	# x の分散の平方根 = x の標準偏差
IQR(x)			# x の四分位点間距離
quantile(x, 0.75) - quantile(x, 0.25)	# 四分位点間距離の定義の確認

## 視覚的なデータの要約 ##

x <- rnorm(100)	# ランダムなサンプルの生成

hist(x)			# ヒストグラム（頻度）
hist(x, freq=F)	# ヒストグラム（相対頻度）

boxplot(x)		# ボックスプロット

# ヒストグラムとボックスプロット #

# 二峰型 #
x1 <- rnorm(100, mean=0)
x2 <- rnorm(100, mean=4)
x <- c(x1, x2)
hist(x)
boxplot(x)

# 裾の重い分布 #
y1 <- rnorm(100, sd=1)
y2 <- rnorm(100, sd=4)
y <- c(y1, y2)
hist(y)
boxplot(y)



## 二標本問題 ##
x1 <- c(8, 17, 9, 5, 14, 13, 13, 3, 9, 0)
x2 <- c(19, 13, 13, 18, 21, 18, 11, 21, 20, 11)

boxplot(x1, x2)

t.test(x1, x2)		# Welch's t test
wilcox.test(x1, x2)	# Mann-Whitney test, Wilcoxon’s rank sum test



## 分散分析 ##

# サンプルデータ #
Data <- data.frame(
  z = c(8, 16, 7, 18, 6, 11, 15, 11, 20, 7, 19, 20, 21, 19, 24), 
  group = factor(c(rep(1,5), rep(2,5), rep(3,5)), label=c("placebo", "drugA", "drugB")))
print(Data)
boxplot(z ~ group, data=Data)

# ANOVA #
fit.aov <- aov(z ~ group, data=Data)
summary(fit.aov)

# Kruskal-Wallis rank sum test #
kruskal.test(z ~ group, data=Data)



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