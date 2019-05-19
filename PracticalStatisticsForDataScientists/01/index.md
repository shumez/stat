<!--
Filename: 	index.md
Project: 	/Users/shume/Developer/stat/PracticalStatisticsForDataScientists/01
Author: 	shumez <https://github.com/shumez>
Created: 	2019-05-19 13:17:3
Modified: 	2019-05-19 16:04:30
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