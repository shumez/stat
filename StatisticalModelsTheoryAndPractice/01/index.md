<!--
Filename: 	note.md
Project: 	/Users/shume/Developer/stat/StatisticalModelsTheoryAndPractice/01
Author: 	shumez <https://github.com/shumez>
Created: 	2019-05-18 15:13:3
Modified: 	2019-05-18 18:03:8
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

\[ \Delta \text{Paup} = a + b \times \Delta\text{Out} + c \times  \Delta\text{Old} + d \times \Delta\text{Pop} + \text{error} \]



##

[0101]: #0101_introduction
[0102]: #0102_the_hip_trial
[0103]: #0103_snow_on_cholera
[0104]: #0104_yule_on_the_causes_of_poverty

<!-- ref -->

[John Snow]: https://en.wikipedia.org/wiki/John_Snow
[Broad street pump]: https://en.wikipedia.org/wiki/Soho#Cholera_outbreak

<!-- fig -->

[outbreak map]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Chol_an.gif/300px-Chol_an.gif
[outbreak map legend]: https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Choleramaplondon1866.png/300px-Choleramaplondon1866.png

<style type="text/css">
	img{width: 51%; float: right;}
</style>