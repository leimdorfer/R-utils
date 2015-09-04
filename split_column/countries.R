df<-read.csv("countries-regions.csv")

fun <- function(x) {
  str_split_fixed(x, "\x89\xdb\xd2", 2)
  grep("<(.*?)>", testRegex)
}



# using a user defined function 'fun'
tdf <- apply(df, 1, fun)

# or ... using str_split_fixed in apply
# tdf <- apply(df, 1, str_split_fixed, "\x89\xdb\xd2", 2)

# gives a matrix of dataframes as we get a df for each row (ahaaaaaa!!!)
# so we need to cast result back to dataframe but first we transpose the matrix

result <- as.data.frame(t(tdf))

names(result) <- c("country", "region")

result$region <- gsub("to", "", result$region)
write.csv(result, "countries_by_region.csv")




########## SOME previous attempts ->
# testRegex <- c("Albania<89><db><d2> toEurope","Togo<89><db><d2>toSub-Saharan Africa")
# 
# #result <- grep("<(.*?)>", testRegex)
# #toSomewhere <- gsub("to.*","", testRegex)
# 
# nn <- gsub("<(.*?)>","%%", testRegex)
# d <- unlist(strsplit(nn, "%%+"))
# a <- str_split_fixed(df$country[1], "<89><db><d2>", 2)