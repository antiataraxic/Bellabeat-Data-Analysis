sleepDay_merged_2 <- sleepDay_merged %>%
  mutate(minutes = TotalTimeInBed-TotalMinutesAsleep)

ggplot(data=sleepDay_merged_2, aes(x=TotalMinutesAsleep))+
  geom_bar(fill="#2A322E")+
  theme_minimal()+
  xlab("Time (in mins)")+
  theme(axis.title.y=element_blank())

mean_minutes <- mean(sleepDay_merged_2$minutes, na.rm=TRUE)

sleepDay_merged_2 <- sleepDay_merged_2 %>% mutate(Minutes=minutes)
