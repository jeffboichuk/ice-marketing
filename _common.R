library(tidyverse)
library(lubridate)
library(glue)

tibble(
   date = mdy(
      "10-07-2021", # 1
      "10-14-2021", # 2
      "10-19-2021", # 3
      "10-21-2021", # 4
      "10-26-2021", # 5
      "10-28-2021", # 6
      "11-02-2021", # 7
      "11-04-2021", # 8
      "11-09-2021", # 9
      "11-11-2021", # 10
      "11-16-2021", # 11
      "11-18-2021", # 12
      "11-23-2021", # 13
      "11-30-2021", # 14
      "12-02-2021"  # 15
   ),
   topic = c(
      "Course Outline and Midterm Launch",                                  # 1
      "Hubspot Case Discussion",                                            # 2
      "Business-to-Business Sales and Marketing",                           # 3
      "J.C. Penney Case Discussion",                                        # 4
      "Tesla Case Discussion",                                              # 5
      "Starbucks Case Discussion",                                          # 6
      "Just (A) Case Discussion",                                           # 7
      "Midpoint Review and Allianz Project Working Session",                # 8
      "Midterm",                                                            # 9
      "The Sales Process",                                                  # 10
      "The Road to Retail (Online and Offline)",                            # 11
      "Just (B) Case Discussion",                                           # 12
      "Integrated Marketing Communications",                                # 13
      "1-800-Flowers.com and Under Armour Case Discussions",                # 14
      "Review"                                                              # 15
   )
) %>% 
   mutate(
      class_number = row_number() %>% str_pad(width = 2, side = "left", pad = 0),
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
         str_replace_all(" ", "-"),
      rmd_file = glue("{class_number}-{rmd_file}")
   ) ->
   class_session
