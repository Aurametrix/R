### Stepwise Linear Regression - with step function stepfun {stats}
### each iteration of the method makes a change to the set of attributes and creates a model to evaluate the performance of the set
# load data
data(longley)
# fit model
base <- lm(Employed~., longley)
# summarize the fit
summary(base)
# perform step-wise feature selection
fit <- step(base)
# summarize the selected model
summary(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)
