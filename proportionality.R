test_df<-function(){

      
#       x<- c(1.5,3,7,4.5,1)
#       y<- c(6,12,28,18,4)

   
            x<- c(3,6,2,1.5,4)
            y<- c(6,3,9,12,4.5)
      
      df<-data.frame(x,y)
      
      plot(x,y)

      View(df)
}

inv_prop<-function(x){
      
     y <- 9-x
      
      return(y)
      
}