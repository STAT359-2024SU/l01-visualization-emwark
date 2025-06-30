# L01-visualization ----
# Stat

# load packages and data --------------------------------------------------
library(tidyverse)

tinder_data <- read_csv("data/tinder_data.csv")


# Exercises ---------------------------------------------------------------


# Ex 1

#definitions of geom and aesthetic mapping


# Ex 2
# scatterplot of 'hwy' v 'cty' using mpg set

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

# Ex 3
#scatterplot of 'hwy' v 'cty' with color of points to 'drv'
ggplot(mpg, aes(x = hwy, y = cty, color = drv)
) +
  geom_point ()
ggplot(mpg, aes(x = hwy, y = cty, color = drv)
) +
  geom_jitter(alpha = 0.2)
# scatterplot of `hwy` versus `cty` w/ color of the points favorite color 
# `facet` by `drv`. Read `?facet_wrap` and adjust the `ncol` and `scales` as necessary.

ggplot(mpg, aes(x = hwy, y = cty)
) +
  geom_point(color = "slateblue") +
  facet_wrap(~drv)

ggplot(mpg, aes(x = hwy, y = cty)
) +
  geom_jitter(alpha = 0.2, color = "slateblue") +
  facet_wrap(~drv)