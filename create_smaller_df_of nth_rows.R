create_testset<-function(){
      
      df<-load_data() # call your function to load big(ish)data here
      
      n <- 30 # Give me every nth row e.g. 30
      
      df.sub<-df[(seq(1, to=nrow(df), by=n)), ]
      
      #View(df.sub) #Take a look if you want
      
      write.csv(df.sub, file = "test_data.csv") #write a small file for testing
      
}
