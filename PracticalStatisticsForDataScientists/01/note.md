<!--
Filename: 	note.md
Project: 	/Users/shume/Developer/stat/PracticalStatisticsForDataScientists/01
Author: 	shumez <https://github.com/shumez>
Created: 	2019-05-19 13:17:3
Modified: 	2019-06-12 14:44:52
-----
Copyright (c) 2019 shumez
-->

# 01. Exploratory Data Analysis

## Contents

* [01.01. Elements of Structured Data][0101]
    * [01.01.01. Further Reading][010101]
* [01.02. Rectangular Data][0102]
    * [01.02.01. Data Frames and Indexed][010201]
    * [01.02.02. Graph Data][010202]
    * [01.02.03. Further Reading][010203]
* [01.03. Estimates of Location][0103]
    * [01.03.01. Mean][010301]
    * [01.03.02. Median and Robust Estimates][010302]
        * [01.03.02.01. Outliers][01030201]
    * [01.03.03. Example: Location Estimates of Population and Murder Rates][010303]
    * [01.03.04. Further Reading][010304]
* [01.04. Estimates of Variability][0104]
    * [01.04.01. Standard Deviation and Related Estimates][010401]
    * [01.04.02. Estimates Based on Percentiles][010402]
    * [01.04.03. Example: Variability Estimated of State Population][010403]
* [01.05. Exploring the Data Distribution][0105]
    * [01.05.01. Percentiles and Boxplots][010501]
    * [01.05.02. Frequency Table and Histograms][010502]
    * [01.05.03. Density Estimates][010503]
* [01.06. Exploring Binary and Categorical Data][0106]
    * [01.06.01. Mode][010601]
    * [01.06.02. Expected Value][010602]
    * [01.06.03 Further Reading][010603]
* [01.07. Correlation][0107]
    * [01.07.01. Scatterplots][010701]
* [01.08. Exploring Two or More Variables][0108]
    * [01.08.01. Hexagonal Binning and Contours (plotting numeric vs. numeric)][010801]
    * [01.08.02. Two Categorical Variables][010802]
    * [01.08.03. Categorical and Numerical Data][010803]
    * [01.08.04. Visualizing Multiple Variables][010804]
    * [01.08.05. Further Reading][010805]
    * [01.09. Conclusion][0109]
* [01.09. Conclusion][0109]


## 01.01. Elements of Structured Data

* numeric
    * contiuous
    * discrete
* categorical
    * binary
    * ordinal: ordered

### 01.01.01. Further Reading

* [R Introduction / Basic data types]
* [SQL Data Types]


## 01.02. Rectangular Data

### 01.02.01. Data Frames and Indexed

### 01.02.02. Graph Data

### 01.02.03. Further Reading


## 01.03. Estimates of Location

### 01.03.01. Mean

\[ \text{Mean} = \bar{x} = \frac{\sum_i^N{x_i}}{N} \]

**trimmed mean**

\(p\) smallest and largest val omitted

\[ \text{Trimmed Mean} = \bar{x} = \frac{\sum_{i=p+1}^{N-p}{x_{(i)}}}{N-2p} \]

**weighted mean** 

multiplying data val \(x_i\) by weight \(w_i\) & dividing sum of weights

\[ \text{Weighted Mean} = \bar{x}_w = \frac{\sum_{i=1}^N{w_i x_i}}{\sum_i^N{w_i}} \]


### 01.03.02. Median and Robust Estimates

**weighted median**

#### 01.03.02.01. Outliers

median: **robust** estimate of location since NOT influenced by **outliers**

### 01.03.03. Example: Location Estimates of Population and Murder Rates

```r
state <- read.csv(file = 'data/state.csv')

mean(state[["Population"]])
mean(state$Population)
mean(state$Population, trim = .1)
median(state$Population)
weighted.mean(state$Murder.Rate, w = state$Population)

library('matrixStats')
weightedMedian(state$Murder.Rate, w = state$Population)
```


### 01.03.04. Further Reading


## 01.04. Estimates of Variability

**variability**, aka, **dispersion**

* **Deviatons** (errors, residuals)
* **Variance** (mean-squared-error)
* **Standard Deviation** (l2-norm, Euclidean norm)
* **Mean Absolute Deviation** (l1-norm, Manhattan norm)
* **Median Absolute Deviation from the Median**
* **Range**
* **Order Statistics** (ranks)
* **Percentile**
* **Interquantile Range** (IQR)


### 01.04.01. Standard Deviation and Related Estimates

**deviations**

\[ \text{Mean Absolution Deviation} = \frac{\sum_{i=1}^N{|x_i - \bar{x}|}}{N} \]

sample mean \(\bar{x}\)

**variance**, **standard deviation**

\[
    \begin{align*}
        \text{Variance} &= s^2 = \frac{\sum{(x - \bar{x})^2}}{N-1} \\
        \text{Standard Deviation} &= s = \sqrt{\text{Variance}} 
    \end{align*}
\]


variance, sd, mean absolute deviation NOT robust

robust estimate of variablity is **median absolute deviation from the median** (MAD)

\[ \text{Median Absolution Deviation} = \text{Median}(|x_1 - m|, |x_2 - m|, \cdots, |x_N - m|) \]

median \(m\)


### 01.04.02. Estimates Based on Percentiles

**order statistics**

**range**: diff between max & min

**percentile**

**interquantile range**: diff between 25th percentile & 75th percentile


### 01.04.03. Example: Variability Estimated of State Population

```r
sd(state$Population)
IQR(state$Population)
mad(state$Population)
```


### 01.04.04. Further Reading



## 01.05. Exploring the Data Distribution

**moments**

3rd moment **skewness**, 4th moment **kurtosis**


### 01.05.01. Percentiles and Boxplots

[![Fig.1-2][fig0102]][fig0102]

quantiles (25th, 50th, 75th percentiles)

deciles (10th, 20th, ..., 90th percentiles)

```r
quantile(state$Murder.Rate, p=c(.05, .25, .5, .75, .95))
```

```r
boxplot(state$Population/1000000, ylab='Population (millions)')
```


### 01.05.02. Frequency Table and Histograms

[![Fig.1-3][fig0103]][fig0103]

```r
breaks <- seq(from=min(state$Population), to=max(state$Population), length=11)
pop_freq <- cut(state$Population, breaks=breaks, right=TRUE, include.lowest=TRUE)
table(pop_freq)

hist(state$Population, breaks=breaks, main='Population', xlab='Population (millions)')
```


### 01.05.03. Density Estimates

[![Fig.1.4][fig0104]][fig0104]

```r
hist(state$Murder.Rate, freq=FALSE, main='Murder Rate', xlab='Murder Rate')
lines(density(state$Murder.Rate), lwd=3, col='blue')
```


## 01.06. Exploring Binary and Categorical Data

* **Mode**: most commonly occurring category / val 
* **Expected Value**
* **Bar Charts**
* **Pie Charts**


### 01.06.01. Mode

**mode**: simple summary for categorical data


### 01.06.02. Expected Value

\[ \text{EV} = 0.05 \times 300 + 0.15 \times 50 + 0.80 \times 0 = 22.5 \]


### 01.06.03 Further Reading

* [misleading graphs]


## 01.07. Correlation

* **Correlation coefficient**: 
* **Correlation mat**
* **Sctter plot**Alchemy 


\[ r = \frac{\sum_{i=1}^N{(x_i - \bar{x}) (y_i - \bar{y})}}{(N-1) s_x s_y} \]

### 01.07.01. Scatterplots

[![Fig.1-7][fig0107]][fig0107]


## 01.08. Exploring Two or More Variables

* **Contingency Tables**
* **Hexagonal Binning**
* **Contour Plots**
* **Violin Plots**


### 01.08.01. Hexagonal Binning and Contours (plotting numeric vs. numeric)


### 01.08.02. Two Categorical Variables


### 01.08.03. Categorical and Numerical Data

[![Fig.1.10][fig0110]][fig0110]


[![Fig.1.11][fig0111]][fig0111]

### 01.08.04. Visualizing Multiple Variables


### 01.08.05. Further Reading

## 01.09. Conclusion




##

[0101]: #0101_elements_of_structured_data
[010101]: #010101_further_reading
[0102]: #0102_rectangular_data
[010201]: #010201_data_frames_and_indexed
[010202]: #010202_graph_data
[010203]: #010203_further_reading
[0103]: #0103_estimated_of_location
[010301]: #010301_mean
[010302]: #010302_median_and_robust_estimates
[01030201]: #01030201_outliers
[010303]: #010303_example_location_estimates_of_population_and_murder_rates
[010304]: #010304_further_reading
[0104]: #0104_estimates_of_variability
[010401]: #010401_standard_deviation_and_related_estimates
[010402]: #010402_estimates_based_on_percentiles
[010403]: #010403_example_variability_estimated_of_state_population
[0105]: #0105_exploring_the_data_distribution
[010501]: #010501_percentiles_and_boxplots
[010502]: #010502_frequency_table_and_histograms
[010503]: #010503_density_estimates
[0106]: #0106_exploring_binary_and_categorical_data
[010601]: #010601_mode
[010602]: #010602_expected_value
[010603]: #010603_further_reading
[0107]: #0107_correlation
[010701]: #010701_scatterplots
[0108]: #0108_exploring_two_or_more_variables
[010801]: #010801_hexagonal_binning_and_contours_plotting_numeric_vs_numeric
[010802]: #010802_two_categorical_variables
[010803]: #010803_categorical_and_numerical_data
[010804]: #010804_visualizing_multiple_variables
[010805]: #010805_further_reading
[0109]: #0109_conclusion

<!-- ref -->
[R Introduction / Basic data types]: http://www.r-tutor.com/r-introduction/basic-data-types
[SQL Data Types]: https://www.w3schools.com/sql/sql_datatypes.asp
[misleading graphs]: http://passyworldofmathematics.com/misleading-graphs/

<!-- fig -->
[fig0102]: https://raw.githubusercontent.com/shumez/stat/master/PracticalStatisticsForDataScientists/01/fig/0102.png
[fig0103]: https://raw.githubusercontent.com/shumez/stat/master/PracticalStatisticsForDataScientists/01/fig/0103.png
[fig0104]: https://raw.githubusercontent.com/shumez/stat/master/PracticalStatisticsForDataScientists/01/fig/0104.png
[fig0107]: https://raw.githubusercontent.com/shumez/stat/master/PracticalStatisticsForDataScientists/01/fig/0107.png
[fig0110]: https://raw.githubusercontent.com/shumez/stat/master/PracticalStatisticsForDataScientists/01/fig/0110.png
[fig0111]: https://raw.githubusercontent.com/shumez/stat/master/PracticalStatisticsForDataScientists/01/fig/0111.png


<style type="text/css">
	img{width: 51%; float: right;}
</style>