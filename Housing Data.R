library(ggplot2)
library(tidyverse)
library(reshape2)

housing = read.csv('housing.csv')
head(housing)
summary(housing)

par(mfrow=c(2,5))
colnames(housing)

ggplot(data = melt(housing), mapping = aes(x = value)) + 
  geom_histogram(bins = 30) + facet_wrap(~variable, scales = 'free_x')

housing$total_bedrooms[is.na(housing$total_bedrooms)] = median(housing$total_bedrooms , na.rm = TRUE)

housing$mean_bedrooms = housing$total_bedrooms/housing$households
housing$mean_rooms = housing$total_rooms/housing$households

drops = c('total_bedrooms', 'total_rooms')

housing = housing[ , !(names(housing) %in% drops)]
