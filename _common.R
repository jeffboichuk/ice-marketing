library(tidyverse)
library(lubridate)

tibble(
   date = mdy(
      "10-10-2019", # 1
      "10-16-2019", # 2
      "10-17-2019", # 3
      "10-23-2019", # 4
      "10-24-2019", # 5
      "10-30-2019", # 6
      "10-31-2019", # 7
      "11-06-2019", # 8
      "11-07-2019", # 9
      "11-13-2019", # 10
      "11-14-2019", # 11
      "11-20-2019", # 12
      "11-21-2019", # 13
      "11-26-2019", # 14
      "12-02-2019", # 15
      "12-03-2019"  # 16
   ),
   topic = c(
      "Course Outline and Midterm Launch",                                  # 1
      "Generating Market Intelligence",                                     # 2
      "Disseminating Market Intelligence",                                  # 3
      "Responding to Market Intelligence",                                  # 4
      "J.C. Penney Case Discussion",                                        # 5
      "Just (A) Case Discussion",                                           # 6
      "Formula Complete Fitness Presentations",                             # 7
      "Hubspot Case Discussion",                                            # 8
      "Midpoint Review and Margaritaville Project Working Session",         # 9
      "Midterm Presentations",                                              # 10
      "Hard Discounters vs. Online Orders Presentations",                   # 11
      "Starbucks Case Discussion",                                          # 12
      "MarieBette Presentations",                                           # 13
      "Under Armour Case Discussion",                                       # 14
      "Just (B) Presentations",                                             # 15
      "1-800-Flowers.com Case Discussion"                                   # 16
   )
) %>% 
   mutate(
      date = str_c(
         wday(date, label = TRUE, abbr = FALSE),
         ", ",
         month(date, label = TRUE, abbr = FALSE),
         " ",
         mday(date)
      ),
      rmd_file = topic %>% 
         str_remove_all("[[:punct:]]") %>% 
         str_to_lower() %>% 
         str_replace_all(" ", "-")
   ) ->
   class_session
