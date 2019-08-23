<!--
Filename: 	note.md
Project: 	/Users/shume/Developer/stat/MedicalStatisticsClass2015/01
Author: 	shumez <https://github.com/shumez>
Created: 	2019-06-26 14:31:9
Modified: 	2019-08-23 17:29:34
-----
Copyright (c) 2019 shumez
-->

# [01. Fundamental Statistics]

## Contents

- [01. Statistics][01]
    - [01.01. Data Analysis][0101]
    - [01.02. Problem Setting & Data Analysis][0102]
- [02. Raw data][02]
- [03. Descriptive Statistics][03]
    - [03.01. Importance of Descriptive Statistics][0301]
    - [03.02. Numerical Summary][0302]
        - [03.02.01. Location][030201]
        - [03.02.02. Variance][030202]
    - [03.03. Graphical summary][0303]
        - [03.03.01. Histogram][030301]
        - [03.03.02. Box-plot][030302]
        - [03.03.03. Histogram & Boxplot][030303]

## 01. Statistics

### 01.01. Overview of Data Analysis

1. 問題設定
2. データの収集
3. データの要約
    - Descriptive statistics
        - Numerical summary (数量的要約)
        - Graphical summary (視覚的要約)
4. 解析手法の選択
5. Model building
6. Model diagnositics
7. Decision & Report


### 01.02. Problem Setting & Data Analysis

- Population (母集団)  
    解析対象となる個体の集合
- Parameter  
    population を特徴づける定数
- Sample (標本)
- Sampling frame  
    sample として抽出されうる個体の集合
- Variable  
    母集団において, 個体間で確率的に異なりうる特性, 量
- Statistic (統計量)


## 02. Raw Data


## 03. Descriptive Statistics

### 03.01. Importance of Descriptive Statistics

- **location**
- **variance**
- **shape**


### 03.02. Numerical Summary

#### 03.02.01. Location

- Mean 

\[ \bar{x} = \frac{x_1 + \cdots x_n}{n} = \frac{1}{n}\sum_{i=1}^n{x_i} \]

- Median

\[ \tilde{x} = \begin{cases}
    x_{ \frac{(n+1)}{2} } & n \text{ is odd} \\
    \frac{ \Big( x_{  \frac{n}{2}  } + x_{\frac{(n+1)}{2}} \Big) }{2} & n \text{ is even}
\end{cases} \]

- Percentile

**k-th percentile**

- Quantile
    - First quantile
    - Third quantile
  
- Trimmed mean (刈り込み平均)

k% trimmed mean: 上下k%を取り除いたあとの平均


#### 03.02.02. Variance

Variability (変動), Dispersion (散らばり)

- Variance, Standard deviation

**Variance** (分散), **Standard deviaton** (標準偏差)

\[ 
    \begin{align*}
        \text{Variance: } s^2 &= \frac{1}{n-1} \sum_{i=1}^n{(x_i - \bar{x})^2} \\
        \text{Standard deviation: } s &= \sqrt{s^2} 
    \end{align*}
\]

- Inter Quantile Range (IQR)

\[ f_s = \text{75-th percentile} - \text{25-th percentile} \]


standard error (標準誤差):　Standard error of mean (標本平均の標準偏差)

\[ \text{Standard error: } \frac{s}{\sqrt{n}} \]

- \(\text{Mean} \pm \text{SD}\)  
    - 平均分布に従うならば, \(\text{Mean} \pm \text{SD}\)の範囲にデータの60-70%が分布している
    - 観測データの散らばりを意味する
- \(\text{Mean} \pm \text{SE}\)
    - \(\text{Mean} \pm \text{SE}\)の範囲に, 標本平均の60-70%が分布している
    - SEは標本平均による母集団平均お推定の正確さを意味する


### 03.03. Graphical summary 

- Histogram
- Box plot


#### 03.03.01. Histogram

Class/Bin (階級), 階級値
Frequency (度数)

Sturges formula:
\[ k \approx 1 + \log_2{n} \]


##### 03.03.01.01. Shape

- Unimodal
- Bimodal
- Multimodal

- Symmetric
- Positively/Right skewed
- Negatively/Left skewed


#### 03.03.02. Box-plot

Outlier (はずれ値)


#### 03.03.03. Histogram & Boxplot


## 04. Mean / Median 

群間での平均値, 中央値の差


### 04.01. Two sample test

\(H_0\): \(\mu_1 = \mu_2\) 母集団平均が一定  
\(H_1\): \(\mu_1 \neq \mu_2\) 母集団平均が異なる

- Welch's t-test: 
    - 正規分布に従う
    - 2群の分散は等しくなくてもいい
    - \(\text{Mean} \pm \text{SD}\) に対応
- Mann-Whitney test, Wilcoxon's rank sum test: 
    - 同じ形の分布に従う
    - 等分散
    - \(\text{Median(IQR)}\) に対応


### 04.02. Three sample 

\(H_0\): \(\mu_1 = \cdots = \mu_k\) 母集団平均が一定   
\(H_1\): 少なくとも1つの母集団平均が他からことなる

- **ANOVA** (Analysis of variance) 分散分析
- **Kruskal-Wallis** test

**等分散の仮定**

**分散を安定化する**必要がある

- **対数変換**
- **Box-Cox変換**

か必要


### 04.03. Multiple Comparison

どの母集団平均が異なっているか

- **Turkey's HSD** (**Honestly Significant Difference**)  
    \((\mu_i - \mu_j)\), \(i \ne j\)  
    \(\frac{k(k-1)}{2}\)
- **Dunnett**  
    ctrl と他を比較  
    \(H_1\): \(\mu_1 \ne \mu_2, \mu_1 \ne \mu_3, \cdots, \mu_1 \ne \mu_k \)  
    \((k-1)\)通り
- **Williams**  
    単調性 
    \(H_1\): \(\mu_1 \le \mu_2 \le \cdots \le \mu_k\) or \(H_1\): \(\mu_1 \ge \mu_2 \ge \cdots \ge \mu_k\)


non-parametric: 正規分布に従う仮定を必要としない

|               |               |           |                   |
|---------------|---------------|-----------|-------------------|
| parametric    | Turkey        | Dunnet    | Williams          |
| non-parametric| Steel-Swass   | Steel     | Shirley-Williams  |


##
<!-- toc -->
[01. Fundamental Statistics]: https://drive.google.com/drive/u/0/folders/0B-_Hpdri56S1bUJsZGcxX1RJS1E
[01]: #01_statistics
[0101]: #0101_overview_of_data_analysis
[0102]: #0102_problem_setting_data_analysis
[02]: #02_raw_data

[03]: #03_descriptive_statistics
[0301]: #0301_importance_of_descriptive_statistics
[0302]: #0302_numerical_summary
[030201]: #030201_location
[030202]: #030202_variance
[0303]: #0303_graphical_summary
[030301]: #030301_histogram
[03030101]: #03030101_shape
[030302]: #030302_box-plot
[030303]: #030303_histogram_boxplot

[04]: #04_mean_median

<!-- ref -->

<!-- fig -->

<!-- term -->

<style type="text/css">
	img{width: 51%; float: right;}
</style>