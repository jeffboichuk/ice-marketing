library(tidyverse)
library(glue)

tibble(
   date = mdy(
      "10-06-2022", # 1
      "10-11-2022", # 2
      "10-13-2022", # 3
      "10-18-2022", # 4
      "10-20-2022", # 5
      "10-25-2022", # 6
      "10-27-2022", # 7
      "11-01-2022", # 8
      "11-03-2022", # 9
      "11-10-2022", # 10
      "11-15-2022", # 11
      "11-17-2022", # 12
      "11-22-2022", # 13
      "11-29-2022", # 14
      "12-01-2022"  # 15
   ),
   topic = c(
      "Course Outline",                                                     # 1
      "Midterm Launch",                                                     # 2
      "J.C. Penney Case Discussion",                                        # 3
      "Hubspot Case Discussion",                                            # 4
      "Starbucks Case Discussion",                                          # 5
      "Tesla Case Discussion",                                              # 6
      "Midpoint Review and Allianz Project Working Session",                # 7
      "Just (A) Case Discussion",                                           # 8
      "The Sales Process",                                                  # 9
      "Midterm",                                                            # 10
      "The Road to Retail: Online and Offline",                             # 11
      "Midterm Feedback",                                                   # 12
      "Integrated Marketing Communications",                                # 13
      "Group Presentation Prep",                                            # 14
      "Review"                                                              # 15
   )
) %>% 
   mutate(
      class_number = row_number() %>% str_pad(2, "left", 0),
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
