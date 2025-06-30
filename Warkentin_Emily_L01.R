# L01-visualization ----
# Stat

# load packages and data --------------------------------------------------
library(tidyverse)

tinder_data <- read_csv("data/tinder_data.csv")


# Exercises ---------------------------------------------------------------


# Ex 1



# Ex 2
# scatterplot of 'hwy' v 'cty' using mp

ggplot(data  = mpg,
       mapping = aes( x = hwy, y = cty)) +
  geom_point()

ggplot(data  = mpg,
       mapping = aes( x = hwy, y = cty)) +
  geom_point(alpha = 0.2)
# alpha attempt to solve overplotting issues

ggplot(data  = mpg,
       mapping = aes( x = hwy, y = cty)) +
  geom_jitter(alpha = 0.2)
# geom_jitter instead of geom_point 
