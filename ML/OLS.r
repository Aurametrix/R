### Ordinary Least Squares (OLS) regression  - Lm function used to fit liner models
### linear model that seeks to find a set of coefficients for a line/hyper-plane that minimise the sum of the squared errors.
# load data
data(longley)
# fit model
fit <- lm(Employed~., longley)
# summarize the fit
summary(fit)
# make predictions
predictions <- predict(fit, longley)
# summarize accuracy
rmse <- mean((longley$Employed - predictions)^2)
print(rmse)
