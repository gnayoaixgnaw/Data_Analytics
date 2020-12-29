install.packages("ggalt")

library(ggalt)

health <- read.csv("data1.csv")
health$keyword  <- factor(health$keyword , levels=as.character(health$keyword ))
ggplot(health, aes(x=st_2019, xend=end_2020, y=keyword)) + 
  geom_segment(data = health, aes(x=st_2019, 
                                  xend=end_2020, 
                                  y=keyword, 
                                  yend=keyword), 
               color="#b2b2b2", size=1.5)+
  # ??????????????????????????????????????????
  geom_dumbbell(size_x=2.5, 
                size_xend = 2.5,
                colour_x="#edae52", 
                colour_xend = "#9fb059")+
  labs(x=NULL, y=NULL, 
       title="Dumbbell Chart", 
       subtitle="case Change: 2019 vs 2020")+
  # ??????????????????
  geom_text(color="black", size=3, hjust=-0.5,vjust= 1,
            aes(x=st_2019, label=st_2019))+
  geom_text(aes(x=end_2020, label=end_2020), 
            color="black", size=3, hjust=0.5,vjust= -1)

  
  

