data= read.csv("Grip.csv")

data=data.frame(data)

model_regression <- lm(data = data, Scores~Hours)
summary(model_regression)
prediction <- predict(model_regression,interval = "predict")
newdata <- cbind(data,prediction)

library(ggplot2)

ggplot(newdata,aes(Hours,Scores)) +
      geom_point() +
      geom_smooth(method=lm)

n <- data.frame(Hours=c(9.25))
n$op <- predict(model_regression,n,interval="predict")
n
