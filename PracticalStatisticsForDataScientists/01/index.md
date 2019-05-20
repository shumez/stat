<!--
Filename: 	index.md
Project: 	/Users/shume/Developer/stat/PracticalStatisticsForDataScientists/01
Author: 	shumez <https://github.com/shumez>
Created: 	2019-05-19 13:17:3
Modified: 	2019-05-20 10:27:17
-----
Copyright (c) 2019 shumez
-->

# 01. Exploratory Data Analysis

## ToC

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
* [01.06. Exploring Binary and Categorical Data][0106]
* [01.07. Correlation][0107]
* [01.08. Exploring Two or More Variables][0108]
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
[0106]: #0106_exploring_binary_and_categorical_data
[0107]: #0107_correlation
[0108]: #0108_exploring_two_or_more_variables
[0109]: #0109_conclusion

<!-- ref -->
[R Introduction / Basic data types]: http://www.r-tutor.com/r-introduction/basic-data-types
[SQL Data Types]: https://www.w3schools.com/sql/sql_datatypes.asp

<!-- fig -->

<!-- <style type="text/css">
	img{width: 51%; float: right;}
</style> -->