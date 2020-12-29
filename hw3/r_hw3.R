# read csv into data frame
all_2020_6 <-read.table("Indiegogo_2020_06.csv", header=TRUE,sep=",")
all_2019_6 <-read.table("Indiegogo_2019_06.csv", header=TRUE,sep=",")
all_2018_6 <-read.table("Indiegogo_2018_06.csv", header=TRUE,sep=",")
all_2017_6 <-read.table("Indiegogo_2017_06.csv", header=TRUE,sep=",")
all_2016_6 <-read.table("Indiegogo_2016_06.csv", header=TRUE,sep=",")

# count the key words

library(stringr)
key_list <- list(word=c("Education","Energy & Green Tech","Health & Fitness","Fashion & Wearables","Wellness"))
for ( i in 1:length(key_list$word)){
        keyword20 <- str_count(all_2020_6$category, key_list$word[i])
        count_20 <- sum(keyword20)
        keyword19 <- str_count(all_2019_6$category, key_list$word[i])
        count_19 <- sum(keyword19)
        keyword18 <- str_count(all_2018_6$category, key_list$word[i])
        count_18 <- sum(keyword18)
        keyword17 <- str_count(all_2017_6$category_name, key_list$word[i])
        count_17 <- sum(keyword17)
        keyword16 <- str_count(all_2016_6$category_name, key_list$word[i])
        count_16 <- sum(keyword16)
        
        word_list <- c(count_16, count_17, count_18, count_19, count_20)
        Years <- c(2016,2017,2018,2019,2020)
        barplot(word_list,names.arg=Years,main=key_list$word[i],col=c("green","yellow","orange","blue","red"),
                xlab="Year",ylab="Frequency")
}


#Question2

years <- c('2018', '2018', '2019', '2019', '2020', '2020')
Keywords <- c('Fashion & Wearables','Health & Fitness','Fashion & Wearables','Health & Fitness','Fashion & Wearables','Health & Fitness')
fw_count_18 <- sum(str_count(all_2018_6$category, 'Fashion & Wearables'))
hf_count_18 <- sum(str_count(all_2018_6$category, 'Health & Fitness'))
fw_count_19 <- sum(str_count(all_2019_6$category, 'Fashion & Wearables'))
hf_count_19 <- sum(str_count(all_2019_6$category, 'Health & Fitness'))
fw_count_20 <- sum(str_count(all_2020_6$category, 'Fashion & Wearables'))
hf_count_20 <- sum(str_count(all_2020_6$category, 'Health & Fitness'))
fw_count <-c(fw_count_18,fw_count_19,fw_count_20)
hf_count <- c(hf_count_18,hf_count_19,hf_count_20)

df_1 <- data.frame(fw_count,hf_count)

aovres = aov(fw_count~hf_count, data=df_1)
summary(aovres)

# KW-Test

list(fw_count,hf_count)
kruskal.test(list(fw_count,hf_count))

# MW-Test
list(fw_count,hf_count)
wilcox.test(fw_count,hf_count)

#effect size
#install.packages("effsize")
library("effsize")

res_cohen = cohen.d(fw_count,hf_count,return.dm=TRUE)
print(res_cohen)

res_cliff = cliff.delta(fw_count,hf_count,return.dm=TRUE)
print(res_cliff)

# Question3

#Pearson Coefficient
cor(fw_count,hf_count, method = "pearson")

#Spearman Coefficient

cor(fw_count,hf_count, method = "spearman")

#Kendall Coefficient
cor(fw_count,hf_count, method = "kendall")

