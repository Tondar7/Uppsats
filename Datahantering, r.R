### Datahantering NEK uppsats

#install.packages("readxl")
library("readxl")
#install.packages("tidyverse")
library("tidyverse")

#library("selectr")
#library("xml2")
#library("rvest")
library("stringr")
#library("jsonlite")



data_kommun <- as.data.frame(read_excel("raw_data.xlsx"))
treatment_data <- as.data.frame(read_excel("Treatmentdata - for matching.xlsx"))

brf_t <- c()

brf_c <- c()

empty_df_treatment <- data_kommun[FALSE,]


empty_df_control <- data_kommun[FALSE,]


#-------------------------------------------------------
#sort by treatment and control

for (i in 1:nrow(data_kommun)){
  if (data_kommun$adress[i] %in% treatment_data$Adress){
    empty_df_treatment <- rbind(empty_df_treatment, data_kommun[i,])
    #brf_t <-c(brf_t, treatment_data[i, 1])
  }
  else {
    empty_df_control <- rbind(empty_df_control, data_kommun[i,])
    }
}


View(empty_df_treatment)
View(empty_df_control)

## Adding BRF-vector to DF:

df_treatment <- inner_join(empty_df_treatment, treatment_data, by = c("adress" = "Adress"))
df_control <- empty_df_control

View(df_treatment)
View(df_control)
#---------------------------------------------------
#Separate into columns for grouping 

split_treatment <- df_treatment %>% 
  separate(col = kvmpris, into = c("kvmpris", " "), sep = "k", extra = "merge") %>%
  separate(col = adress, into = c("gatunamn", "gatunummer", "1", "2", "3"), sep = " ") %>%
  separate(col = datum, into= c("dag","månad","år"))

View(split_treatment)
    
split_control <- df_control %>% 
  separate(col = kvmpris, into = c("kvmpris", " "), sep = "k", extra = "merge") %>%
  separate(col = adress, into = c("gatunamn", "gatunummer", "1", "2", "3"), sep = " ") %>%
  separate(col = datum, into= c("dag","månad","år"))

#View(split_control)

#rio::export(split_treatment, "pregrouped_treatment_data.xlsx")
#rio::export(split_control, "pregrouped_control_data.xlsx")


#-----------------------------------------------------
# Group by street and year and find average kvm price per year per street


pregrouped_treatment_data <- read_excel("pregrouped_treatment_data.xlsx")
pregrouped_control_data <- read_excel("pregrouped_control_data.xlsx")


grouped_by_streetnyear_treatment <- pregrouped_treatment_data %>%
  group_by(BRF, år) %>%
  summarize(snittkvmpris = mean(kvmpris, rm.na = TRUE))
warnings()


grouped_by_streetnyear_control <- pregrouped_control_data %>%
  group_by(gatunamn, år) %>%
  summarize(snittkvmpris = mean(kvmpris, rm.na = TRUE))
warnings()

#View(grouped_by_streetnyear_treatment)
#View(grouped_by_streetnyear_control)

#rio::export(grouped_by_streetnyear_treatment, "grouped_treatment_data.xlsx")
#rio::export(grouped_by_streetnyear_control, "grouped_control_data.xlsx")



forgraphing1 <- read_excel("grouped_treatment_data_aktuell.xlsx")
forgraphing_t <- na.omit(forgraphing1)

average_peryear_treatment <- forgraphing_ %>%
  group_by(år) %>%
  summarize(snittperyear = mean(snittkvmpris, rm.na = T))
warnings()

View(average_peryear_treatment)


forgraphing2 <- read_excel("grouped_control_data_aktuell.xlsx")
forgraphing_c <- na.omit(forgraphing2)

average_peryear_control <- forgraphing_c %>%
  group_by(år) %>%
  summarize(snittperyear = mean(snittkvmpris, rm.na = T))
warnings()

View(average_peryear_control)



