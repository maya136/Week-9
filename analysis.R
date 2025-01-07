# R course for beginners
# Week 9 - Analysis
# assignment by Maya Pohes, id 315114744


# Packages and imports ----
library(dplyr)


# Variables ----
n <- 20
gender_values <- c("Female", "Male")

participant_id <- as.numeric(1:n)
age <-  as.numeric(floor(sample(18:60, n, replace = TRUE)))
reaction_time_avg <- as.numeric(floor(sample(200:6000, n, replace = TRUE)))
gender <-  factor(sample(gender_values, n, replace = TRUE))
depression <- as.numeric(floor(sample(0:100, n, replace = TRUE)))
sleep_time_avg <- as.numeric(floor(sample(2:12, n, replace = TRUE)))


# Code ----
df <- data.frame(participant_id, age, gender, reaction_time_avg, 
                 depression, sleep_time_avg)

save(df, file = file.path("./", "df.rdata"))
View(df)

summery_df = create_results_dataframe(df)
print(summery_df)