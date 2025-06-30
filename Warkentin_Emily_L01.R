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
       mapping = aes( x = cty, y = hwy)) +
  geom_point()

ggplot(data  = mpg,
       mapping = aes( x = cty, y = hwy)) +
  geom_point(alpha = 0.2)
# alpha attempt to solve overplotting issues

ggplot(mpg, aes( x = cty, y = hwy)) +
  geom_jitter(alpha = 0.2)
# geom_jitter instead of geom_point 

# Ex 3
#scatterplot of 'hwy' v 'cty' with color of points to 'drv'
ggplot(mpg, aes(x = cty, y = hwy, color = drv)) +
  geom_point ()
ggplot(mpg, aes(x = cty, y = hwy, color = drv)) +
  geom_jitter(alpha = 0.2)
# scatterplot of `hwy` versus `cty` w/ color of the points favorite color 
# `facet` by `drv`. Read `?facet_wrap` and adjust the `ncol` and `scales` as necessary.

# add color
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point(color = "slateblue") +
  facet_wrap(~drv)

# add jitter 
ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_jitter(alpha = 0.2, color = "slateblue") +
  facet_wrap(~drv)

# Ex 4
#  mapping numeric to 'color', 'size', 'shape'
#color

ggplot(mpg, aes(x = cty, y = hwy, color = displ)) +
  geom_point()

# size
ggplot(mpg, aes(x = cty, y = hwy, size = displ)) +
  geom_point()

# shape
# ggplot(mpg, aes(x = cty, y = hwy, shape = displ)) +
# geom_point()
# error

# mapping categorical to color, size, shape

ggplot(mpg, aes(x = cty, 
                y = hwy, 
                color = trans,
                shape = trans,
                size = trans)) +
  geom_point()
# continuous var should not map to shape

# Ex 5
# histogram of the `carat` variable in the `diamonds` dataset w adjustments
ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 200) +
  labs(
    title = "Number of Diamonds by Carat",
    caption = "Source: ggplot2 package",
    y = ""
  )
# binwidth 200 too large

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 20) +
  labs(
    title = "Number of Diamonds by Carat",
    caption = "Source: ggplot2 package",
    y = ""
  )
# still too large. looking at actual data, this should be obvious

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.20) +
  labs(
    title = "Number of Diamonds by Carat",
    caption = "Source: ggplot2 package",
    y = ""
  )
