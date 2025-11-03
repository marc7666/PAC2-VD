tryCatch({
  data <- read.csv("Violin_data_cleaned.csv", header=TRUE)
  print("Fitxer llegit correctament")
}, error = function(e){
  cat("Error en llegir el fitxer:", conditionMessage(e))
})

library(dplyr)
data_filtered <- data %>% # Ref.10
  select(sql_marks, excel_marks, python_marks, power_bi_marks, english_marks)
data_filtered

library(ggplot2) # Ref.11, Ref.12, Ref.13 i Ref.14
ggplot() +
  geom_violin(data = data_filtered, aes(x = "SQL", y = sql_marks), fill = "#58E49C") +
  geom_boxplot(data = data_filtered, aes(x = "SQL", y = sql_marks), width = 0.15, fill = "white") +
  
  geom_violin(data = data_filtered, aes(x = "Python", y = python_marks), fill = "#7A5DDF") +
  geom_boxplot(data = data_filtered, aes(x = "Python", y = python_marks), width = 0.15, fill = "white") +
  
  geom_violin(data = data_filtered, aes(x = "Power Bi", y = power_bi_marks), fill = "#DFE854") +
  geom_boxplot(data = data_filtered, aes(x = "Power Bi", y = power_bi_marks), width = 0.15, fill = "white") +
  
  geom_violin(data = data_filtered, aes(x = "Excel", y = excel_marks), fill = "#F3498C") +
  geom_boxplot(data = data_filtered, aes(x = "Excel", y = excel_marks), width = 0.15, fill = "white") +
  
  geom_violin(data = data_filtered, aes(x = "English", y = english_marks), fill = "#47F4F5") +
  geom_boxplot(data = data_filtered, aes(x = "English", y = english_marks), width = 0.15, fill = "white") +
  
  labs(x = "Assignatura", y = "Notes", title = "Distribució de notes per assignatura")


