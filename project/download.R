install.packages("RISmed")
library(RISmed)

case = c()
for ( i in 2010:2020){
  search_query <- EUtilsSummary(query="",db="pubmed", retmax=3000,datetype='pdat', mindate=i, maxdate=i)
  records<- EUtilsGet(search_query)
  pubmed_data <- data.frame('Title'=ArticleTitle(records),
                            'Year'=YearAccepted(records),
                            'journal'=ISOAbbreviation(records))
  
  pubmed_data = na.omit(pubmed_data)
  pubmed_data = pubmed_data[pubmed_data$Year==i,]
  
  write.csv(pubmed_data,file=paste0('Year',i,'.csv'))
  
}

