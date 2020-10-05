library(tidyverse)
library(lubridate)
library(glue)

tibble(
   date = mdy(
      "10-06-2020", # 1
      "10-08-2020", # 2
      "10-13-2020", # 3
      "10-15-2020", # 4
      "10-20-2020", # 5
      "10-22-2020", # 6
      "10-27-2020", # 7
      "10-29-2020", # 8
      "11-03-2020", # 9
      "11-05-2020", # 10
      "11-10-2020", # 11
      "11-12-2020", # 12
      "11-17-2020", # 13
      "11-19-2020"  # 14
   ),
   topic = c(
      "Course Outline and Midterm Launch",                                  # 1
      "Hubspot Case Discussion",                                            # 2
      "Tesla Case Discussion",                                              # 3
      "J.C. Penney Case Discussion",                                        # 4
      "Just (A) Case Discussion",                                           # 5
      "Starbucks Case Discussion",                                          # 6
      "Midpoint Review and Allianz Project Working Session",                # 7
      "Business-to-Business Marketing",                                     # 8
      "Midterm",                                                            # 9
      "Integrated Marketing Communications",                                # 10
      "The Road to Retail (Online and Offline)",                            # 11
      "Just (B) Case Discussion",                                           # 12
      "1-800-Flowers.com and Under Armour Case Discussions",                # 13
      "Review"                                                              # 14
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
