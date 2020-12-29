install.packages("RISmed")
library(RISmed)

case = c()
keywords <- c('Obesity', 'Cancer')

for(j in 1:length(keywords)){
  search_query <- EUtilsSummary(query=keywords[j],db="pubmed", retmax=100,datetype='pdat')
  records<- EUtilsGet(search_query)
  pubmed_data <- data.frame('Title'=ArticleTitle(records),
                            'Abstract'=AbstractText(records))
  pubmed_data = na.omit(pubmed_data)
  write.csv(pubmed_data,file=paste0(keywords[j],'.csv'))
  
}

