Sleep <- 7
In_Bed_Before_Sleep <- 0.65
Sedentary <- 9.5
Lightly_Active <- 3.2
Very_Active <- 0.35
Fairly_Active <- 0.22

df2 <- data.frame(
  Types = c("Sleep", "In Bed Before Sleep", "Sedentary", "Very Active", "Fairly Active", "Lightly Active"),
  Minutes = c(7, 0.65, 9.5, 0.35, 0.22, 3.2))

ggplot(data=df2, aes(x="",y=Minutes, fill=Types))+
  geom_bar(width=1, stat="identity", color = "black")+
  coord_polar("y", start=0)+
  scale_fill_manual(values=c("#FFEC21", "#378AFF", "#FFA32F", "#F54F52", 
                                      "#93F03B", "#9552EA"))+
  theme(axis.title.x=element_blank(),
        axis.text.x=element_blank(),
        axis.ticks.x=element_blank(),
        axis.title.y=element_blank())+
  theme_void()
