all(dailyActivity_merged$TrackerDistance == dailyActivity_merged$TotalDistance, na.rm=FALSE)

daily_tracker_total_wrong_data <- subset(dailyActivity_merged,dailyActivity_merged$TrackerDistance != dailyActivity_merged$TotalDistance) 

dailyActivity_merged_2 <- dailyActivity_merged %>% filter(dailyActivity_merged$TrackerDistance==dailyActivity_merged$TotalDistance)

dailyActivity_merged_2$ActivityDate <- mdy(dailyActivity_merged_2$ActivityDate)

Total_Distance <- ceiling(dailyActivity_merged_2$TotalDistance)

dailyActivity_merged_2 <- dailyActivity_merged_2 %>% mutate(Time=VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes)
dailyActivity_merged_2 <- dailyActivity_merged_2 %>% mutate(Distance=TotalDistance)

ggplot(data=dailyActivity_merged_2, aes(x=Distance, y=Time))+
  geom_smooth(color="#2A322E")+
  theme_minimal()+
  xlab("Distance (in kms)")+
  ylab("Time (in mins)")

mean_distance <- mean(dailyActivity_merged_2$TotalDistance, na.rm=FALSE)
mean_time <- mean(dailyActivity_merged_2$TotalMinutes, na.rm=FALSE)

# Pie Chart of Types of Distance

mean_va_dis <- mean(dailyActivity_merged_2$VeryActiveDistance)
mean_ma_dis <- mean(dailyActivity_merged_2$ModeratelyActiveDistance)
mean_la_dis <- mean(dailyActivity_merged_2$LightActiveDistance)

df <- df %>% mutate(lab.ypos1 = c(10, 217.7, 111))

df <- data.frame(
  Types = c("Very Active", "Moderately Active", "Lightly Active"),
  Distances = c(1.5, 0.6, 3.3))

ggplot(data=df, aes(x="",y=Distances, fill=Types))+
  geom_bar(width=1, stat="identity", color = "black")+
  coord_polar("y", start=0)+
  scale_fill_manual(values=c("#EC6B56", "#FFC154", "#47B39c"))+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank())+
  theme_void()

# Pie Chart of how minutes were spent per day

mean_va_mins <- mean(dailyActivity_merged_2$VeryActiveMinutes)
mean_fa_mins <- mean(dailyActivity_merged_2$FairlyActiveMinutes)
mean_la_mins <- mean(dailyActivity_merged_2$LightlyActiveMinutes)

df1 <- data.frame(
  Types = c("Very Active", "Fairly Active", "Lightly Active"),
  Minutes = c(21, 13, 191)
)
df1 <- df1 %>% mutate(lab.ypos = c(10, 217.7, 111))
df$lab.ypos = c(9, 200, 111)

ggplot(df1, aes(x="", y=Minutes, fill=Types))+
  geom_bar(width=1, stat="identity", color = "black")+
  coord_polar("y", start=0)+
  theme_minimal()+
  scale_fill_manual(values=c("#EC6B56", "#FFC154", "#47B39c"))+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank())+
  theme_void()

mean_steps <- mean(dailyActivity_merged_2$TotalSteps)

mean_calories <- mean(dailyActivity_merged_2$Calories)
