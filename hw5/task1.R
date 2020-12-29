install.packages("syuzhet")
library("syuzhet")

Google_News_Entry <-read.table("/Users/wangxiaoyang/Desktop/cs_code/cs688/hw5_xiaoyang_wang/result.csv", header=TRUE, sep=",")
Google_News_Entry
df <- as.vector(Google_News_Entry$text)

affin_list <-c()
nrc_list <-c()
bing_list <-c()

for ( i in 1:length(df)){
  affin_vector	<-	get_sentiment(df[i],	method="afinn")	
  nrc_vector	<-	get_sentiment(df[i],	method="nrc")	
  bing_vector	<-	get_sentiment(df[i],	method="bing")
  
  affin_list<-c(affin_list,affin_vector)
  nrc_list<-c(nrc_list,nrc_vector)
  bing_list<-c(bing_list,bing_vector)
  
  
}
a = data.frame(df,affin_list,nrc_list,bing_list)
write.csv(a,file = "/Users/wangxiaoyang/Desktop/cs_code/cs688/hw5_xiaoyang_wang/mydata.csv",row.names = F)


