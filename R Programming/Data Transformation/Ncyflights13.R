install.packages("nycflights13")
library(nycflights13)

#to show how many of dataset in the package
num_datasets <- nrow(data(package = "nycflights13")$result)

#to show the name of each dataset in package
data_info <- data(package = "nycflights13")

#explore your first dataset using dplyr package
library(dplyr)

#check the data in dataframe
head(flights)
str(flights)
glimpse(flights)
colnames(flights)

#filter for on-time flights
filter(flights,arr_delay == 0 & dep_delay == 0)

#use pipe operator with filter() for on-time flights
ontime_flights <- flights %>% filter(dep_delay == 0 & arr_delay == 0)

ontime_flights <- flights %>%
  select(year, carrier, dep_delay, arr_delay)%>%
  filter(dep_delay == 0 & arr_delay == 0)%>%
  arrange(carrier)

#Left join between flights and airlines
ontime_flights <- flights %>%
  left_join(airlines, by = "carrier")%>%
  select(year, carrier, name, dep_delay, arr_delay)%>%
  filter(dep_delay == 0 & arr_delay == 0)%>%
  arrange(carrier)

#Count On-Time Flights each airline
airlines_ontime <- ontime_flights %>%
  group_by(name) %>%  # Group data by carrier code
  summarize(performance= n())  # Count the number of on-time flights in each group

#Sort by On-Time Flight Count (Descending)
most_ontime_airlines <- airlines_ontime %>%
  group_by(name) %>%
  arrange(desc(performance))  # Arrange by count in descending order (most on-time first)

#View the top 5 airlines
head(most_ontime_airlines,5)

#Save file as .csv file for using in Excel
write.csv(most_ontime_airlines,"top_airlines.csv", row.names = F)
