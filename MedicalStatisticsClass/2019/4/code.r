##### 医学統計勉強会18　第4回　回帰分析　R code #####

install.packages("ISｗR")	# ISwRパッケージのインストール。最初の一回のみ実行
library(ISwR)

# 散布図 #
thuesen <- na.omit(thuesen)	# 欠測値を除く #
attach(thuesen)

plot(blood.glucose, short.velocity)
plot(thuesen)			# 上と同じ

# 数量的データの要約（二変量） #
cov(blood.glucose, short.velocity)		# 共分散
cov(thuesen)				# 分散共分散行列
cor(blood.glucose, short.velocity)		# 相関係数
cor(thuesen)				# 相関行列

# 単回帰分析 #
fit <- lm(short.velocity ~ blood.glucose, data=thuesen)
summary(fit)		# 回帰分析の結果表示
plot(thuesen)		# 散布図
abline(fit)			# 推定された回帰直線の描画
confint(fit)		# 回帰パラメターの信頼区間

# 回帰診断 #
par(mfrow=c(2,2))
plot(fit)
par(mfrow=c(1,1))

# 重回帰 (CPUデータ) #
library(MASS)
head(cpus, n=2)
dim(cpus)			# cpusの行と列の数を確認
?cpus				# cpusのオンラインヘルプ起動

cpus2 <- cpus[, c(8, 2:7)]
head(cpus2, n=2)

pairs(cpus2)		# cpus2の散布図行列

cpus2.lm <- lm(perf ~ syct + mmin + mmax + cach + chmin + chmax, data=cpus2)				# 回帰モデルの当てはめ
cpus2.lm <- lm(perf ~ ., data=cpus2)	# 上と同じ

summary(cpus2.lm)	# 回帰分析の結果表示
confint(cpus2.lm)	# 回帰パラメターの信頼区間

# 回帰診断 #
par(mfrow=c(2,2))	# グラフィックスウィンドウを2行2列の4つの領域に分割する
plot(cpus2.lm)
par(mfrow=c(1,1))	# グラフィックスウィンドウを元に戻す

# Box-Cox変換 #
library(MASS)
bxcx <- boxcox(perf ~ ., data=cpus2, lambda=seq(0, 0.5, .01))
lambda <- bxcx$x[which.max(bxcx$y)]
lambda

perf.new <- (cpus2$perf^lambda -1)/lambda
cpus3 <- cpus2[, -1]
cpus3 <- cbind.data.frame(perf.new, cpus3)

cpus2.bxcx.lm <- lm(perf.new ~ ., data=cpus3)
summary(cpus2.bxcx.lm)	# 回帰分析の結果表示
confint(cpus2.bxcx.lm)	# 回帰パラメターの信頼区間

# 回帰診断 #
par(mfrow=c(2,2))	# グラフィックスウィンドウを2行2列の4つの領域に分割する
plot(cpus2.bxcx.lm)
par(mfrow=c(1,1))	# グラフィックスウィンドウを元に戻す