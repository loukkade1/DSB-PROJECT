install.packages("nycflights13")
install.packages("tidyverse")
library(nycflights13)
library(tidyverse)

##ggplot2
#grammar of graphics
ggplot(data = mtcars, 
       mapping = aes(x=mpg, y=hp)) + 
  geom_point() + 
  geom_smooth(method = "lm" )

#what's discrete in R? It's called "factor" in R or categorical data
# 1,2,3,4,5 or "M", "F", or "high","med","low"

#continuous (measurement)
#height: 176.56 cm

#Quiz
#1. heart rate = discrete
#2. internet data (10 MB, 10.12345 GB): continuous

#change character to factor
gender <- c(rep("M",10), rep("F",8))
class(gender)

gender_factor <-  factor(gender,
                         levels = c("M","F"),
                         labels=c("M","F"))

print(gender_factor)
animals <- c("cat", "dog", "hippo")
animals <- factor(animals)

#count no. of factor 
table(gender_factor)

##ordinal_data
spending <- c("low","med","high")
factor(spending, 
       levels = c("low","med","high"),
       labels = c("low","med","high"),
       ordered = TRUE)
#factor => 1. categorical data 2. ordinal data
