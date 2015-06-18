these_rows<-function(){
      
      r.a<-c("Bill","Bill and Bob","Jane and Bob")
      r.b<-c(4,5,6)
      
      df<-data.frame(r.a,r.b)
      
      names(df) <- c("a","b")
          
      #View(df)
      finds <- grep("bob", df$a, ignore.case = TRUE)
      
      #print(finds)
      df2<-df[finds, ]
      
      View(df2)
}