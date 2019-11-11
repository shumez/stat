##### 医学統計勉強会18第7回生存時間解析　R code #####

library(survival)

x <- c(2, 4, 4, 5, 7, 8, 10)		# 生存時間
cens0 <- c(1, 1, 1, 1, 1, 1, 1)		# censoring status: 打ち切り状態（0：打ち切り無し，1：打ち切り有り）

Surv(x, cens0)

fit0 <- survfit(Surv(x, cens0) ~ 1)	# 生存関数のKaplan-Meier推定量を求める

plot(fit0)						# Kaplan-Meier curveの描画（信頼区間有り）
plot(fit0, conf.int=FALSE, xlab="time", ylab="Survival Function")		# Kaplan-Meier curveの描画（信頼区間有なし）



cens1 <- c(1, 1, 1, 1, 0, 1, 0)		# 7日目（5番目）と10日目（7番目）に打ち切り

Surv(x, cens1)

fit1 <- survfit(Surv(x, cens1) ~ 1)	# 生存関数のKaplan-Meier推定量を求める
plot(fit1, conf.int=FALSE, xlab="time", ylab="Survival Function")



### 白血病患者に対する寛解期間の臨床比較試験 ###

library(MASS)

data(gehan)

fit.gehan <- survfit(Surv(time, cens) ~ treat, data=gehan)
plot(fit.gehan, mark.time=TRUE, col=c("blue", "red"))
legend(25,1,legend=c("6-MP", "control"), col=c("blue", "red"), lty=1, bty="n")

survdiff(Surv(time, cens) ~ treat, data=gehan)		# log-rank検定

survdiff(Surv(time, cens) ~ treat, data=gehan, rho=1)		# the Peto & Peto modification of the Gehan-Wilcoxon test



### NCCTG Lung Cancer Data ###
fit.lung <- survfit(Surv(time, status) ~ pat.karno, data=lung)
plot(fit.lung, col=rainbow(8), main="NCCTG Lung Cancer Data")
label <- names(table(lung$pat.karno))
legend(800, 1, legend=label, lty=rep(1,8), col=rainbow(8), bty="n")

survdiff(Surv(time, status) ~ pat.karno, data=lung)
survdiff(Surv(time, status) ~ pat.karno + strata(inst), data=lung)



### Cox proportional hazard model: 白血病患者に対する寛解期間の臨床比較試験 ###

fit.ph <- coxph(Surv(time, cens) ~ treat, data=gehan)
summary(fit.ph)

### complementary log-log plot: Gehanの白血病データ ###

plot(fit.gehan, fun="cloglog", ylab="Log(-Log(survival))", xlab="time", lty=1:2)
legend(2, 0.6, c("control", "6-MP"), lty=1:2)

### Cox比例ハザードモデルにおける比例ハザード性の仮定についての、Schoenfeld residualによる検定 ###
cox.zph(fit.ph)



### 一般化加法モデルによる非線形モデル: 在郷軍人の肺がんデータ ###

fit <- coxph(Surv(time, status) ~ trt + karno + age, data=veteran)

cox.zph(fit)		# karno, ageのp値は小さく比例ハザード性の破綻が示唆される

library(mgcv)
fit.gam <- gam(time ~ trt + s(karno) + s(age), family=cox.ph(), weights=status, data=veteran)
summary(fit.gam)
plot(fit.gam)
