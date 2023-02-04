# making four columns with simulated data in each:

# sample data simulating delay time from 1 to 5 minutes, 10 rows
column_01 <- sample(x = 1:5, size = 10, replace = TRUE)

# sample data simulating static station name in, 10 rows
column_02 <- sample(x = c("Station Name"), size = 10, replace = TRUE)

# sample data simulating possible directions of trains, 10 rows
column_03 <- sample(x = c("North", "South", "East", "West"), size = 10, replace = TRUE)

# sample data simulating four types of trains, 10 rows
column_04 <- sample(x = c("Yellow", "Green", "Blue", "Magenta"), size = 10, replace = TRUE) 

# creates a data frame with column names being populated with the four respective column variables
simulation_01 <- data.frame("station" = column_02,
                            "direction" = column_03,
                            "train" = column_04,
                            "delay_time" = column_01)

# calls in the data frame
simulation_01