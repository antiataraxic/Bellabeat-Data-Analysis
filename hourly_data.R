hourlyCalories_merged_2 <- hourlyCalories_merged %>% mutate(ActivityHour=mdy_hms(ActivityHour))

hourlyCalories_merged_2 <- hourlyCalories_merged_2 %>% mutate(Hour=hour(ActivityHour))

hourlySteps_merged_2 <- hourlySteps_merged %>% mutate(ActivityHour=mdy_hms(ActivityHour))

hourlySteps_merged_2 <- hourlySteps_merged_2 %>% mutate(Hour=hour(ActivityHour))

hourlyIntensities_merged_2 <- hourlyIntensities_merged %>% mutate(ActivityHour=mdy_hms(ActivityHour))

hourlyIntensities_merged_2 <- hourlyIntensities_merged_2 %>% mutate(Hour=hour(ActivityHour))

calorie_avg <- hourlyCalories_merged_2 %>% group_by(Hour) %>% summarize(Calories=mean(Calories))

steps_avg <- hourlySteps_merged_2 %>% group_by(Hour) %>% summarize(Steps=mean(StepTotal))

intensity_avg <- hourlyIntensities_merged_2 %>% group_by(Hour) %>% summarize(Intensity=mean(TotalIntensity))

mean_calories <- mean(hourlyCalories_merged_2$Calories)
mean_steps <- mean(hourlyCalories_merged_2$StepTotal)
mean_intensities <- mean(hourlyIntensities_merged_2$TotalIntensity)


cal <- ggplot(data=calorie_avg, aes(y=Calories, x=Hour))+
  geom_smooth(color="#2A322E")+
  theme_minimal()+
  xlab("Time (in hours)")

ste <- ggplot(data=steps_avg, aes(y=Steps, x=Hour))+
  geom_smooth(color="#2A322E")+
  theme_minimal()+
  xlab("Time (in hours)")

int <- ggplot(data=intensity_avg, aes(y=Intensity, x=Hour))+
  geom_smooth(color="#2A322E")+
  theme_minimal()+
  ylab("Intensity")+
  xlab("Time (in hours)")

mets <- ggplot(data=MET_avg, aes(y=METs, x=Hour))+
  geom_smooth(show.legend=FALSE, color="#2A322E")+
  theme_minimal()+
  xlab("Time (in hours)")

library(ggpubr)

ggarrange(ste, int, cal, mets,
          ncol = 2, nrow = 2)


