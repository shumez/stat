<!--
Filename: 	note.md
Project: 	/Users/shume/Developer/stat/StatisticalModelsTheoryAndPractice/01
Author: 	shumez <https://github.com/shumez>
Created: 	2019-05-18 15:13:3
Modified: 	2019-05-19 11:05:20
-----
Copyright (c) 2019 shumez
-->

# 01. Observational Studies and Experiments

## ToC

* [01.01. Introduction][0101]
* [01.02. The HIP trial][0102]
* [01.03. Snow on cholera][0103]
* [01.04. Yule on the causes of poverty][0104]


## 01.01. Introduction

regressin models used for

1. to summarize data
2. to predict future
3. to predict the secults of interventions (caisal inferece)

the key problem:  
**confounding**

handled by 

* subdividing the population (**stratification** aka **cross-tabulation**)
* modeling

"control"

* control: subject NOT get treatment
* controlled experiment: study where the investigators decide who will be in the treatment group

**association**

as we control for more var, study groups get smaller, more room for chance effects  
problem w/ cross-tabulation

&rArr; use stat model


## 01.02. The HIP trial

Health Insurance Plan

intention-to-treat analysis


## 01.03. Snow on cholera

[![][outbreak map]][John Snow]
[![][outbreak map legend]][John Snow]

**natural experiment**: observational study as if randomized by nature

[John Snow] 

[Broad street pump] in Soho


## 01.04. Yule on the causes of poverty

regression technique

Legendre (1805), Gauss (1809)


Yule (1899) 

\[ \Delta \text{Paup} = a + b \times \Delta\text{Out} + c \times \Delta\text{Old} + d \times \Delta\text{Pop} + \text{error} \tag{1} \]

\(\Delta\) percentaage change over time

\(\text{Paup}\) percentage of paupers
\(\text{Out}\) out-relief ration \(\frac{N}{D}\)
\[ N = \text{number on welfare outside the poor-house} \]
\[ D = \text{number inside} \]
\(\text{Old}\) percentage of the population aged over 65
\(\text{Pop}\) population

\[ \sum{( \Delta\text{Paup} - a - b \times \Deltatext{Out} - c \times \Delta\text{Old} - d \times \Delta\text{Pop} )^2} \]

\[ \Delta \text{Paup} = 13.19 + 0.755 \Delta\text{Out} - 0.022 \Delta\text{Old} - 0.322 \Delta\text{Pop} + \text{error} \tag{2} \]

\[ \Delta \text{Paup} = 1.36 + 0.324 \Delta\text{Out} + 1.37 \Delta\text{Old} - 0.369 \Delta\text{Pop} + \text{error} \tag{3} \]

\(\Delta\text{Out}\) relatively large and pos

\[
	\begin{align*}
		\Delta\text{Out} &= 5 - 100 = -95 \\
		\Delta\text{Old} &= 104 - 100 = 4 \\
		\Delta\text{Pop} &= 136 - 100 = 36
	\end{align*}
\]

\(\Deltatext{Paup}\) 

\[ 13.19 + 0.755 \times (-95) - 0.022 \times 4 - 0.322 \times 36 = -70 \]

actual val for \(\Delta\text{Paup}\) \(-73\), so \(\text{error}\) \(-3\)


* **Quantitative inference**:
	* \(\Delta\text{Out} +1\text{percent age pts}\) &rArr; \(\Delta\text{Paup} +0.755\text{pecentage pts}\)
* **Qualitative inference**:
	* Out-relief causes an increase in pauperism


##

[0101]: #0101_introduction
[0102]: #0102_the_hip_trial
[0103]: #0103_snow_on_cholera
[0104]: #0104_yule_on_the_causes_of_poverty

<!-- ref -->

[John Snow]: https://en.wikipedia.org/wiki/John_Snow
[Broad street pump]: https://en.wikipedia.org/wiki/Soho#Cholera_outbreak

<!-- fig -->
[outbreak map]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Chol_an.gif/300px-Chol_an.gif "outbreak map"
[outbreak map legend]: https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Choleramaplondon1866.png/300px-Choleramaplondon1866.png "outbreak map "

<style type="text/css">
	img{width: 51%; float: right;}
</style>