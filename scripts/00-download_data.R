library(opendatatoronto)
library(tidyverse)
library(janitor)

data_url <- "https://open.toronto.ca/dataset/ttc-subway-delay-data/"

packages <- data_url |> 
  list_package_resources()

delay_data_2022 <- filter(packages, name == "ttc-subway-delay-data-2022")

not_cleaned <- delay_data_2022 |> 
  get_resource()

# Checks the total number of records imported from the URL
not_cleaned |> 
  count()

# Checks if the column names needs cleaning
not_cleaned |>
  head() 

# Checks the data type of our variable, which should be a data frame
not_cleaned |>
  class() 

l1 <- "Line 01 Yellow"
l2 <- "Line 02 Green"
l3 <- "Line 03 Scarborough"
l4 <- "Line 04 Sheppard"

# Changes the line column names to the custom names

ttc_data_cleaned <- not_cleaned |>  
  clean_names() |> 
  mutate(
    line =
      recode(
        line,
        "BD" = l2,
        "SHP" = l4,
        "SRT" = l3,
        "YU" = l1,
      )
  )

# Checks if the class is still a data frame
ttc_data_cleaned |> 
  class()

# Checks if all the records are imported after filtering
ttc_data_cleaned |> 
  count()

# writes the csv file that will be imported through our Quarto file
write_csv(
  x = ttc_data_cleaned,
  file = "inputs/data/ttc-delay-data-2022.csv"
)
