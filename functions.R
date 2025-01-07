# R course for beginners
# Week 9 - Functions
# assignment by Maya Pohes, id 315114744


# Packages and imports ----
library(dplyr)


# Variables ----
continuous_list = c("numeric", "integer")
categorial_list = c("factor")


# Functions ----

# This function creates a results df
create_results_dataframe <- function(df, subject_start=0, subject_end=0) {
  
  print(nrow(df))
  if (nrow(df) < 10){
    print("data is too short")
    return(NA)
  }
  
  if (subject_end > nrow(df)){
    print("end given not in range! we will use all participants")
    subject_end = 0
  }
  
  if (subject_end != 0){
    df <- df[df$participant_id >= subject_start & df$participant_id <= subject_end, ]
  }
  
  summery_df <- data.frame(
                            Name = character(),
                            Min = numeric(), 
                            Max = numeric(), 
                            Mean = numeric(), 
                            Levels_Count = numeric(), 
                            Observations_Count_in_Each_Level = I(list())
                          )
  
  for (col in names(df)) {
    
    col_data =  c(df[[col]])
    col_class = class(col_data)
    
    if (col_class %in% continuous_list) {
      
      new_data = data.frame(
        Name = col,
        Min = min(col_data, na.rm = TRUE),
        Max = max(col_data, na.rm = TRUE),
        Mean = mean(col_data, na.rm = TRUE),
        Levels_Count = NA,
        Observations_Count_in_Each_Level = NA
      )
    }
    
    else if (col_class %in% categorial_list) {
      
      table_data <- table(col_data)
      data = paste(names(table_data), table_data, sep = ':')
      length_data = length(data)
      data = paste(data, collapse = " ")
      
      new_data = data.frame(
          Name = col,
          Min = NA,
          Max = NA,
          Mean = NA,
          Levels_Count = length_data,
          Observations_Count_in_Each_Level = data
        )
    }
    
    summery_df <- rbind(
      summery_df, new_data
    )
  }
  
  return(summery_df)
  
}


