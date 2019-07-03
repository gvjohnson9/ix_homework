# Gordon Johnson
# Chapter 5 Code and Exercises 
# Data Science
# July 3, 2019

library(tidyverse)
install.packages('nycflights13')
library(nycflights13)
view(flights)

#5.24 

#1.1
two_more_delay <- filter(flights, arr_delay > 120)

#1.2
flew_to_houston <- filter(flights, dest == "IAH" 
                          | dest == "HOU")

#1.3
op_UAD <- filter(flights, carrier == "AA" 
                 | carrier == "DL"
                 | carrier == "UA")
#1.4
depart_summer <- filter(flights, month == 8
                        | month == 7
                        | month == 6)
#1.5
arriv_late <- filter(flights, arr_delay > 120 
                     & dep_delay == 0)

#1.6 
del_hour_speed <- filter(flights, dep_delay > 60
                         & arr_delay < 30)

#1.7
dep_mid_six <- filter(flights, dep_time == 2400
                      | dep_time <= 600)

#2 Between function, helpful with between months instead of writing | 6 | 7 | 8 as asked in 1.4  
dep_mid_bet <- filter(flights, between(month, 6,8))

#3 8255 have NAs 
count(filter(flights, is.na(dep_time)))

#4 
NA^0
NA|TRUE

#5.3.1

#1 Arranges all NA values 
arrange(flights, desc(is.na(dep_time)), dep_time)

#2
#Arranged to show earliest flights 
arrange(flights, dep_delay)
arrange(flights, desc(dep_delay))

#3 Fastest
fast <- arrange(flights, distance / air_time * 60)

#4 Longest Shortest Journies 
arrange(flights, desc(distance))
arrange(flights, distance)

#Practice coding with mutate

#Creating a new df with gain and speed 
flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time,
                      dep_time)

mutate(flights_sml,
       gain = dep_delay - arr_delay,
       speed = distance / air_time * 60)

#add an easier time function to flights 
mutate(flights_sml, dep_time, 
       hour = dep_time %/% 100,
       minutes = dep_time %/% 100,
       )

#5.6 
summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

by_day <- group_by(flights, year, month, day)
summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

#5.6.1
by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)
delay <- filter(delay, count > 20, dest != "HNL")

#Plot 
ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

#Option 2

delays <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")

#5.6.3
not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(mean = mean(dep_delay))

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )

ggplot(data = delays, mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)
