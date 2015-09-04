init<-function(){
      
      r.a<-c("Bill","Bills","boll", "Bob", "Fred", "Frid")
      r.b<-c(4,5,6,2,3,4)
      
      df<-data.frame(r.a,r.b)
      
      names(df) <- c("Names","values")
       
      count<-1
      
      for (n in 1:nrow(df)){
            
            thisString<-df[n,1]
            nextString<-df[n+1,1]
            
            if(agrepl(thisString, nextString, 
                        max.distance = 0.1, 
                        costs = NULL, 
                        ignore.case = TRUE)){
                  
                  df[n+1,1]<-thisString                
            }           
      }
      View(df)
      
}