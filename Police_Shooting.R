#The data used in this project is a report that involves police shooting in the City of Seattle, WA. 
#Important details include the gender of the Police Officer, the race, the number of years in service, the age of the subject
#and whether the shooting is fatal or not. My goal here is to explore this dataset and Police officers who are more involving 
#in shooting, their rank, years of service, race, and whether the shooting is fatal or not. 



#Load required packages----

##Install pacman-----
if(!require("pacman")) install.packages("pacman")

##Load packages--------
pacman::p_load(pacman, rio, party, tidyverse)

#Import data------
Seattle <- read_csv("data/WA Police Shooting.csv")

#Data Wrangling ------------ 

Seattle %>%
  filter(Fatal == "Yes" & 
           `Officer Injured` == "Yes" & 
           `On-duty` == "Yes" 
           #`!Number of Rounds` ==1
           ) %>%
  print()

Seattle %>%
  plot()

  
  ## Another plot
  Seattle %>%
    select(Rank)%>%
    table()%>%
    sort(decreasing = T)%>%
    barplot() 
  #the barplot suggests that general police officers are more shot 
   #Sergeant police, detectives, and police officer students
  

#plots based on useful variables

Seattle %>%
  select(`Officer Race`)%>%
  table() %>%
  sort(decreasing = T)%>%
  barplot(
    main = "Race of Seattle Officers",
    xlab =  "Race of Officers",
    ylab =  "Frequency",
    ylim = c(0, 130)
  )

Seattle %>%
  select(`Subject Age`)%>%
  table() %>%
  sort(decreasing = T)%>% #Sorting the table in a decreasing order
  barplot(
    main = "The Age of the Subject",
    xlab = "Age",
    ylab = "Frequency"
  )
## The barplot suggests that most of the suspects who get shot or used their arms to shoot are 35 years old




#Plot based on the type of weapon used
Seattle %>%
  select('Type of Weapon') %>%
  table() %>% 
  sort(decreasing = T) %>%
  barplot(
    main= "Frequency of weapons used", 
    xlab = "Type of weapons",
    ylab= "Frequency",
    ylim = c(0, 50)
  )
#by refering to the diagram, it is clear that the handgun, gun, and knife are more used in this dataset

Seattle %>%
  select('Years of SPD Service') %>%
  table() %>% 
  sort(decreasing = T) %>%
  barplot(
    main = "Years in Service vs Frequency comparison",
    xlab =  " number of years being a Police Officer",
    ylab =  "Frequency",
    ylim = c(0, 25)
  )


Seattle %>%
  select('Officer Injured') %>%
  table() %>% 
  sort(decreasing = T) %>%
  barplot(
    main = "Officers Injured by gun shot",
    xlab =  "Injured vs Not-Injured",
    ylab = "Frequency",
    ylim = c(0, 140)
  )

Seattle %>%
  select('Number of Rounds') %>%
  table() %>% 
  sort(decreasing = T) %>%
  barplot()

Seattle %>%
  select('Subject Race') %>%
  table() %>% 
  sort(decreasing = T) %>%
  barplot()

Seattle %>%
  select('Subject Age') %>%
  table() %>% 
  sort(decreasing = T) %>%
  barplot()



names(Seattle)
?histogram

new <- Seattle %>%
  select(Rank, `Officer Gender`, `Officer Race`, `Years of SPD Service`,
         `Officer Injured`, `Number of Rounds`, `Subject Gender`, `Subject Race`,
         `Subject Age`, `Subject Weapon`, `Type of Weapon`, Fatal, Disposition,
         `Officer Disciplined?`) 
 plot(new)



#Summaries of the dataframe ------
 Seattle %>% summary()
 
 summary(Seattle)
 Seattle%>%
   select (`Subject Race`)%>%
   table() 
 
 Seattle %>%
   select(`Years of SPD Service`)%>%
   summary()


#Clean up -----------
rm (list = ls())
