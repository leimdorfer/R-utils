library(stringr)

do_the_splits <- function(d,s) {
      
      if(!grep(s, d)){
            
            print("ERROR: Splitter not found in one or more columns. Please check the data.")
            break            
      }else{
            
            str_split_fixed(d, s, 2)
      }
}

split_col <- function(yourdata, col_to_split, splittr, filename, newcol1, newcol2){
      
      #First we do some checks and set defaults
  
      if(missing(filename)) {
            filename <- paste0("new_", yourdata)
      }
      if(missing(newcol1)) {
            newcol1 <- paste0(col_to_split, "1")
      }
      if(missing(newcol2)) {
            newcol2 <- paste0(col_to_split, "2")
      }
      
      if (!file.exists(yourdata)) {
            
            print("ERROR: Data file not found. Remember to include the .csv")
            break
      } else {
            
            data_in<-read.csv(yourdata,header=TRUE)
      }
      
      colidx <- which(colnames(data_in)==col_to_split) #get column index from colname
      
      if(length(colidx)<1){
            print("ERROR: Column not found. Remeber they are case-sensitive.")
            break
      }
      
      d <- as.data.frame(data_in[,colidx])
      s <- splittr
      
      tdf <- apply(d, 1, do_the_splits, s)
      
      # gives a matrix of dataframes as we get a df for each row (ahaaaaaa!!!)
      # so we need to cast result back to dataframe but first we transpose the matrix
        
      result <- as.data.frame(t(tdf))
      
      names(result) <- c(newcol1,newcol2)
      
      data_in[,colidx]<-NULL # Remove unwanted column from new df
      
      result <- cbind(result,data_in) # combine data_in with new df

      #View(result)
      
      write.csv(result, filename)
  
}