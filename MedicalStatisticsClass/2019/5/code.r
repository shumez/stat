##### 医学統計勉強会18第五回比率と分割表　R code #####

## Low Infant Birth Data ##

# birthwt2 の準備 #
library(MASS)
data(birthwt)
head(birthwt, n=2)

birthwt2 <- birthwt[, -10]		# bwt: 出生体重を除く
birthwt2$race <- factor(birthwt2$race, label=c("white", "black", "other"))	# 因子型に変換し、水準のラベルを1, 2, 3から、white, black, otherに変更する。
birthwt2$ptl[birthwt2$ptl >= 1] <- "1+"		# ptl: 1以上の値を "1+" とする。
birthwt2$ftv[birthwt2$ftv >= 1] <- "1+"		# ftv: 1以上の値を "1+" とする。
head(birthwt2, n=2)

attach(birthwt2)	# birthwt2に含まれる変数を、個別に扱えるようにする。

# 度数と相対度数 #
tbl <- table(race)	# 度数 #
tbl

prop.table(tbl)		# 相対度数 #

## event rate (person-time) : confidence interval and hypothesis testing ##

library(epitools)

##Examples from Rothman 1998, p. 238
bc <- c(Unexposed = 15, Exposed = 41)
pyears <- c(Unexposed = 19017, Exposed = 28010)
dd <- matrix(c(41,15,28010,19017),2,2)
dimnames(dd) <- list(Exposure=c("Yes","No"), Outcome=c("BC","PYears"))
dd

pois.exact(15,19117)
pois.exact(41,28010)

rateratio.wald(dd)



## Test of Proportion : proportions test with continuity correction
prop.test(96, 189, p=0.6)

## Test of Equal or Given Proportion : Clopper-Pearson exact confidence interval ##

binom.test(0, 10)



## 分割表：正答率、感度、特異度、陽性的中率、陰性的中率 ##

table(low, smoke)

library(pROC)

tbl.coords <- roc(low, smoke)

coords(tbl.coords, x="best", ret=c("accuracy", "1-sensitivity", "sensitivity", 
"1-specificity", "specificity", "ppv", "npv"))



## ROC曲線とAUC ##

library(pROC)

x <- c(1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1)		# 疾患あり:1，疾患なし:0
y <- c(0,0,0,0,0,0,0,0,0,0,1,1,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,4,4,4,4,4)		# 検査数値
tbl <- table(x, y)
tbl

y2 <- rep((0:5), each=10)
tbl2 <- table(x, y2)
tbl2

tbl.roc <- roc(x, y)
plot(tbl.roc, print.auc=TRUE, print.thres=TRUE)				# ROC曲線の描画
opt.sp <- tbl.roc$sp[which.max(tbl.roc$se+tbl.roc$sp)]		# 最適な特異度
opt.se <- tbl.roc$se[which.max(tbl.roc$se+tbl.roc$sp)]		# 最適な感度
abline((opt.sp+opt.se), -1)		# 最適なカットポイントを通る45度線

tbl.roc2 <- roc(x, y2)
roc.test(tbl.roc, tbl.roc2)		# Compare the AUC of two ROC curves 

### Fisherの直接法とχ二乗検定 ###

tbl <- matrix(c(405, 173, 416, 152), 
				nrow=2, 
				dimnames=list("β-Blocker" = c("(+)", "(-)"), 
							  "Olmesartan" = c("(+)", "(-)")))
tbl
fisher.test(tbl)				# Fisherの直接法
chisq.test(tbl)					# カイ二乗検定（連続補正あり）
chisq.test(tbl, correct=FALSE)	# カイ二乗検定（連続補正なし）

### McNemar検定 ###

tbl2 <- matrix(c(175, 54, 16, 188), 
				nrow=2, 
				dimnames=list("2004 election" = c("Democrat", "Repablican"), 
							  "2008 election" = c("Democrat", "Repablican")))
tbl2
binom.test(16, (16 + 54))	# 二項分布による正確検定
mcnemar.test(tbl2)			# McNemar検定（連続補正あり）
mcnemar.test(tbl2)			# McNemar検定（連続補正なし）

### Mantel-Haenszel検定 ###

tbl3 <- array(c(80,160,16,160, 50, 10, 452, 452), dim=c(2,2,2))
tbl3
mantelhaen.test(tbl3)

### Cochran-Armitage Trend Test ###

tbl4 <- matrix(c(17066, 14464, 788, 126, 37, 48, 38, 5, 1, 1), 
				nrow=2, byrow=TRUE, 
				dimnames=list("Malformation" = c("Absent", "Present"), 
							  "Alcohol Consumption" = c("0", "< 1", "1-2", "3-5", ">= 6")))
tbl4
event <- tbl4[2, ]
total <- apply(tbl4, 2, sum)
prop.trend.test(event, total, score=c(0, 0.5, 1.5, 4.0, 7.0))		# Cochran-Armitage Trend Test
prop.test(event, total)				# （傾向無しの）独立性の検定