##### 医学統計勉強会18第6回ロジスティック回帰分析　R code #####

### Low Infant Birth Weightデータの準備 ###

library(MASS)
data(birthwt)
head(birthwt, n=2)

birthwt2 <- birthwt[, -10]		# bwt: 出生体重を除く
birthwt2$race <- factor(birthwt2$race, label=c("white", "black", "other"))	# 因子型に変換し、水準のラベルを1, 2, 3から、white, black, otherに変更する。
birthwt2$ptl[birthwt2$ptl >= 1] <- "1+"		# ptl: 1以上の値を "1+" とする。
birthwt2$ftv[birthwt2$ftv >= 1] <- "1+"		# ftv: 1以上の値を "1+" とする。
head(birthwt2, n=2)

attach(birthwt2)	# birthwt2に含まれる変数を、個別に扱えるようにする。

### 連続説明変数の要約 ###
summary(age)
summary(lwt)

sd(age); IQR(age)
sd(lwt); IQR(lwt)

## boxplot ##
boxplot(age ~ low)
p <- t.test(age ~ low)$p.value	# Welch's t-test p-value
p <- round(p, 3)				# 小数点以下第3位まで四捨五入
boxplot(age ~ low, main="age", sub=paste("Welch's t-test p =", p))

boxplot(lwt ~ low)
p <- t.test(lwt ~ low)$p.value	# Welch's t-test p-value
p <- round(p, 3)				# 小数点以下第3位まで四捨五入
boxplot(lwt ~ low, main="lwt", sub=paste("Welch's t-test p =", p))

## scatter plot ##
plot(age, lwt)
x1 <- cov(age, lwt); x1 <- round(x1, 3)		# 共分散
x2 <- cor(age, lwt); x2 <- round(x2, 3)		# 相関係数
plot(age, lwt, pch = 16, sub=paste("cov =", x1, ": cor =", x2))

### 離散説明変数の要約 ###
tbl <- table(low, race)
print(tbl)
fisher.test(tbl)

tbl <- table(low, smoke)
print(tbl)
fisher.test(tbl)

tbl <- table(low, ptl)
print(tbl)
fisher.test(tbl)

tbl <- table(low, ht)
print(tbl)
fisher.test(tbl)

tbl <- table(low, ui)
print(tbl)
fisher.test(tbl)

tbl <- table(low, ftv)
print(tbl)
fisher.test(tbl)



### logistic regression ###

fit <- glm(low ~ age + lwt + race + smoke + ptl + ht + ui + ftv, family=binomial, data=birthwt2)
summary(fit)

## 係数の信頼区間 ##
confint(fit)

## オッズ比の信頼区間 ##
exp(confint(fit))

## イベントの予測確率 ##
fit$fitted



### goodness of fit test for logistic regression ###

## Hosmer-Lemeshow検定 ##
install.packages("ResourceSelection")	# 初回のみ 
library(ResourceSelection)
hl <- hoslem.test(low, fit$fitted, g=10)

## ROC曲線とAUC ##
library(pROC)
tbl.roc <- roc(low, fit$fitted)
plot(tbl.roc, print.auc=TRUE, print.thres=TRUE)				# ROC曲線の描画
opt.sp <- tbl.roc$sp[which.max(tbl.roc$se+tbl.roc$sp)]		# 最適な特異度
opt.se <- tbl.roc$se[which.max(tbl.roc$se+tbl.roc$sp)]		# 最適な感度
abline((opt.sp+opt.se), -1)		# 最適なカットポイントを通る45度線



## 変数選択 ##
library(MASS)
fit.aic1 <- stepAIC(fit, direction="backward")			# backward elimination #
summary(fit.aic1)

fit0 <- glm(low ~ 1, family=binomial, data=birthwt2)	# forward selection #
fit.aic2 <- stepAIC(fit0, direction="forward", scope=list(upper=fit, lower=fit0))
summary(fit.aic2)

fit.aic3 <- stepAIC(fit0, direction="both", scope=list(upper=fit, lower=fit0))	# both #
summary(fit.aic3)



### Generalized Additive Model ###
install.packages("mgcv")	# 初回のみ 
library(mgcv)
fit.gam <- gam(low ~ s(age) + s(lwt) + race + smoke + ptl + ht + ui, family=binomial, data=birthwt2)
summary(fit.gam)

par(mfrow=c(1,2))
plot(fit.gam)


## additive model ##
fit.gam2 <- gam(lwt ~ s(age), family=gaussian, data=birthwt2)

summary(fit.gam2)

plot(age, lwt)

ord <- order(age)

lines(age[ord], fit.gam2$fitted[ord], col="red", lwd=2)

fit.lm <- lm(lwt ~ age, data=birthwt2)

summary(fit.lm)

lines(age[ord], fit.lm$fitted[ord], col="green", lwd=2)