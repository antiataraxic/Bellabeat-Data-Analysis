minuteMETsNarrow_merged_2 <- minuteMETsNarrow_merged %>% mutate(ActivityMinute=mdy_hms(ActivityMinute))

minuteMETsNarrow_merged_2 <- minuteMETsNarrow_merged_2 %>% mutate(Hour=hour(ActivityMinute))

MET_avg <- minuteMETsNarrow_merged_2 %>% group_by(Hour) %>% summarize(METs=mean(METs)/10)

mean_METs <- mean(MET_avg$METs)

MET_avg <- MET_avg %>% 
  mutate(more_than_average_METs = ifelse(METs > mean_METs, TRUE, FALSE))

ggplot(data=MET_avg, aes(y=METs, x=Hour))+
  geom_smooth(show.legend=FALSE, color="#2A322E")+
  theme_minimal()+
  xlab("Time (in hours)")

