# Bank-Customer-Churn-Prediction-using-R-programming

#a. Gender versus Exited. 

![image](https://user-images.githubusercontent.com/77347918/111250235-ff9e8e00-8632-11eb-9d28-e31ba3c9c287.png)

#b. Geography versus Active Members Gender wise

![image](https://user-images.githubusercontent.com/77347918/111250273-104f0400-8633-11eb-8bd9-a0a71f9c0001.png)

#c. Age versus Exited (churn numbers)

![image](https://user-images.githubusercontent.com/77347918/111250299-1d6bf300-8633-11eb-9857-5aa62f49c578.png)

#d. Balance versus Exited

![image](https://user-images.githubusercontent.com/77347918/111250341-2e1c6900-8633-11eb-87f5-f368427af95b.png)

#e. Age versus Credit score 

![image](https://user-images.githubusercontent.com/77347918/111250380-3bd1ee80-8633-11eb-81dd-1f4a28af5383.png)

1.average credit score of females and males in France.
gender   gender_avg
male         649
female     650

2.average credit score of people in the age brackets 20-30,31-40,41-50.
age group     age_avg
1                       651
2                       651
3                       649
3.correlation between credit score and estimated salary.
                                 Credit Score            Estimated Salary
Credit Score             1.000000000        -0.001384293
Estimated Salary    -0.001384293         1.000000000

4.statistical model to explain and establish a mathematical relationship between credit score (dependent) and gender, age, estimate salary.
MULTI LINEAR REGRESSION
Residuals:
     Min       1Q   Median       3Q      Max 
-300.630  -66.880    1.262   66.930  201.174 

Coefficients:
                  Estimate Std. Error t value Pr(>|t|)    
(Intercept)      6.525e+02  4.254e+00 153.382   <2e-16 ***
Age             -3.739e-02  9.221e-02  -0.405    0.685    
GenderMale      -5.785e-01  1.942e+00  -0.298    0.766    
EstimatedSalary -2.416e-06  1.681e-05  -0.144    0.886    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 96.67 on 9996 degrees of freedom
Multiple R-squared:  2.659e-05,	Adjusted R-squared:  -0.0002735 
F-statistic: 0.0886 on 3 and 9996 DF,  p-value: 0.9663

