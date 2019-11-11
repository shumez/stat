##### 医学統計勉強会18第2回基本統計量　R code #####

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