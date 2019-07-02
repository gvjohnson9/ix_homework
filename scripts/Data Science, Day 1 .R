# Gordon Johnson
# July 1st; iX Data Science
# Day  1 

library(tidyverse)
fday <- mpg
table(fday$model)
summary(fday)
ggplot(data = fday) + 
  geom_point(mapping = aes(x=displ, y = hwy))
summary(fday)
# 234 rows, 11 columns 
?mpg

ggplot(data = fday) + 
  geom_point(mapping = aes(x = hwy, y = cyl))

ggplot(data = fday) + 
  geom_point(mapping = aes(x = class, y = drv))

plot(fday$displ, fday$hwy,
     type = "l",
     col = "blue",
     xlim = c (12,44),
     xlab = "Hwy", ylab = "Cyl",
     main = "Hwy vs Cyl")

ggplot(fday) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, size = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, alpha = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue") 

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)

ggplot(data = mpg) + 
  geom_smooth(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, group = drv))

view(diamonds)


