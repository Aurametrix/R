Structural Equation Modeling
multivariate statistical analysis technique to analyze structural relationships.  
This technique is the combination of factor analysis and multiple regression analysis, and it is used to analyze the structural 
relationship between measured variables and latent constructs.

Structural Equation Modeling may be thought of as regression corrected for attentuation. The sem package developed by John Fox uses the RAM path notation of Jack McCardle and is fairly straightforward. 

http://personality-project.org/r/r.sem.html

https://cran.r-project.org/web/packages/sem/sem.pdf

Measurement model: The measurement model represents the theory that specifies how measured variables come together to represent the theory.

Structural model: Represents the theory that shows how constructs are related to other constructs.

Structural equation modeling is also called casual modeling because it tests the proposed casual relationships.  The following assumptions are assumed:

Multivariate normal distribution: The maximum likelihood method is used and assumed for multivariate normal distribution.  Small changes in multivariate normality can lead to a large difference in the chi-square test.

Linearity: A linear relationship is assumed between endogenous and exogenous variables.

Outlier: Data should be free of outliers.  Outliers affect the model significance.

Sequence: There should be a cause and effect relationship between endogenous and exogenous variables, and a cause has to occur before the event.

Non-spurious relationship: Observed covariance must be true.

Model identification: Equations must be greater than the estimated parameters or models should be over identified or exact identified. Under identified models are not considered.

Sample size: Most of the researchers prefer a 200 to 400 sample size with 10 to 15 indicators.  As a rule of thumb, that is 10 to 20 times as many cases as variables.

Uncorrelated error terms: Error terms are assumed uncorrelated with other variable error terms.

Data: Interval data is used.

Steps:

Defining individual constructs: The first step is to define the constructs theoretically.  Conduct a pretest to evaluate the item.  A confirmatory test of the measurement model is conducted using CFA.

Developing the overall measurement model: The measurement model is also known as path analysis.  Path analysis is a set of relationships between exogenous and endogens variables.  This is shown by the use of an arrow.  The measurement model follows the assumption of unidimensionality.  Measurement theory is based on the idea that latent constructs cause the measured variable and that the error term is uncorrelated within measured variables.  In a measurement model, an arrow is drawn from the measured variable to the constructs.

Design the study to produce the empirical results: In this step, the researcher must specify the model.  The researcher should design the study to minimize the likelihood of an identification problem.  Order condition and rank condition methods are used to minimize the identification problem.

Assessing the measurement model validity: Assessing the measurement model is also called CFA.  In CFA, a researcher compares the theoretical measurement against the reality model.  The result of the CFA must be associated with the constructs’ validity.

Specifying the structural model: In this step, structural paths are drawn between constructs.  In the structural model, no arrow can enter an exogenous construct.  A single-headed arrow is used to represent a hypothesized structural relationship between one construct and another.  This shows the cause and effect relationship.  Each hypothesized relationship uses one degree of freedom.  The model can be recursive or non-recursive.

Examine the structural model validity: In the last step, a researcher examines the structural model validity.  A model is considered a good fit if the value of the chi-square test is insignificant, and at least one incremental fit index (like CFI, GFI, TLI, AGFI, etc.) and one badness of fit index (like RMR, RMSEA, SRMR, etc.) meet the predetermined criteria.



the standardized regression weights (betas) solve the problem of the path coefficients nicely.


After the evaluation of the F-value and R2, it is important to evaluate the regression beta coefficients.  The beta coefficients can be negative or positive, and have a t-value and significance of the t-value associated with each.  The beta coefficient is the degree of change in the outcome variable for every 1-unit of change in the predictor variable.  The t-test assesses whether the beta coefficient is significantly different from zero.
