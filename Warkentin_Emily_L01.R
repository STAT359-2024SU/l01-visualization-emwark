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
 
# get rid of empty space with y = NULL

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.20) +
  labs(
    title = "Number of Diamonds by Carat",
    caption = "Source: ggplot2 package",
    y = ""
  )


# Ex 6
# plotting carat versus cut in diamonds
# carat is numeric, cut is categorical

# option 1 boxplot
ggplot(diamonds, aes(x = cut, y = carat)) +
  geom_boxplot()

# option 2 density
ggplot(diamonds, aes(x = carat, color = cut, fill = cut)) +
  geom_density(alpha = 0.5)

# could also use histogram with facet

# Ex 7
# Construct a barplot of `cut`. Add in `aes(fill = carat > 0.7)`.

# did not use position = "fill" because I still wanted to see total count #
ggplot(diamonds, aes(x = cut, fill = carat > 0.7)) +
  geom_bar()

# Ex 8 
# facet_grid()vs facet_wrap()

# Case Study
# messages sent v messages received geom_point

# scatter plot
ggplot(tinder_data, aes(x = messages_sent, y = messages_received)) +
  geom_jitter(alpha = 0.25)

ggplot(tinder_data, aes(x = messages_sent, y = messages_received, color = user_gender )) +
  geom_jitter(alpha = 0.25)

# try facet
ggplot(tinder_data, aes(x = messages_sent, y = messages_received)
) +
  geom_jitter(alpha = 0.25) +
  facet_wrap(~user_gender)

# add abline

ggplot(tinder_data, aes(x = messages_sent, y = messages_received)
) +
  geom_jitter(alpha = 0.25) +
  facet_wrap(~user_gender) +
  geom_abline()

# try received with histogram
ggplot(tinder_data, aes(x = messages_received)) +
  geom_histogram(binwidth = 500)

# add facet_wrap

ggplot(tinder_data, aes(x = messages_received)) +
  geom_histogram(binwidth = 500) +
  facet_wrap(~user_gender)

# color 
ggplot(tinder_data, aes(x = messages_received, color = user_gender)) +
  geom_histogram(binwidth = 500)

ggplot(tinder_data, aes(x = messages_received, color = user_gender)) +
  geom_density(binwidth = 500)
  # coord_fixed(ratio = 1)
# coord_fixed doesn't work here or I am not understanding

# boxplot

ggplot(tinder_data, aes(x = messages_sent, y = messages_received)) +
  geom_boxplot() 

ggplot(tinder_data, aes(x = messages_sent, y = messages_received)) +
  geom_boxplot() +
  facet_wrap(~user_gender)
  
ggplot(tinder_data, aes(x = messages_sent, y = messages_received)) +
  geom_violin() +
  facet_wrap(~user_gender) +
  coord_fixed(ratio = 1)

# trying scatter again
ggplot(tinder_data, aes(x = messages_sent, 
                        y = messages_received,
                        color = user_interested_in,
                        size = median_convo_length_msgs)
) +
  geom_jitter(alpha = 0.25) +
  facet_wrap(~user_gender) +
  geom_abline() +
  coord_fixed(ratio = 2)

# trying scatter again
ggplot(tinder_data, aes(x = messages_sent, 
                        y = messages_received)
) +
  geom_jitter(aes(color = user_gender), alpha = 0.25) +
  facet_wrap(~user_gender) +
  geom_smooth() +
  coord_fixed(ratio = 1) +
  labs(
    title = "Messages Sent and Received by Gender"
    )


# trying scatter again
ggplot(tinder_data, aes(x = messages_sent, 
                        y = messages_received,
                        color = user_gender)
) +
  geom_jitter( alpha = 0.25) +
  geom_smooth() +
  coord_fixed(ratio = 1) +
  labs(
    title = "Messages Sent and Received by Gender"
  )

ggsave(filename = "plots/dist_message_gender.png")
       
# saving a file

# ggsave(filename = "plots/dist_message_received.png")
# this will save the last plot ran






