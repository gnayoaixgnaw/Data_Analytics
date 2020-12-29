install.packages("RISmed")
library(RISmed)

case = c()
keywords <- c('Influenza', 'Obesity', 'Cancer', 'Covid-19')
for ( i in 2014:2020){
  search_query <- EUtilsSummary(query="",db="pubmed", retmax=3000,datetype='pdat', mindate=i, maxdate=i)
  records<- EUtilsGet(search_query)
  pubmed_data <- data.frame('Title'=ArticleTitle(records),
                            'Year'=YearAccepted(records),
                            'journal'=ISOAbbreviation(records))
  
  pubmed_data = na.omit(pubmed_data)
  pubmed_data = pubmed_data[pubmed_data$Year==i,]
  for(j in 1:length(keywords)){
    a <- sum(grepl(pattern = paste0(keywords[j]),pubmed_data$Title,ignore.case = TRUE))
    case = append(case,a)
    #write.table(x = b,file = paste0(keywords[j],'.dat'),append = T,quote = F,sep = '')
  }
  write.csv(pubmed_data,file=paste0('Year',i,'.csv'))
  
}

year = c(rep(c(2014),4),rep(c(2015),4),rep(c(2016),4),rep(c(2017),4),rep(c(2018),4),rep(c(2019),4),rep(c(2020),4))
Word <- rep(c('Influenza','Obesity','cancer','COVID_19'),7)
tables <-  data.frame(year, Word, case)
ggplot()+ geom_area(aes(x=year, y=case, fill=Word), data=tables, stat='identity')
diagram