check_memory <- function(){
      # Read computer available memory
      # available.memory <- memory.limit() ##### Windows only :(
      
      available.memory <- 2000
      
      # Since this information has been provided in advance,
      # I choose to not perform any extra work to guess them
      number.of.rows <- 2075259
      number.of.cols <- 9
      bytes.per.cell <- 8
      
      data.size.bytes <- number.of.rows * number.of.cols * bytes.per.cell
      
      data.size.mb <- data.size.bytes / (1024 ^ 2)
      
      message("Checking if there's enough memory available")
      if(data.size.mb > available.memory) {
            stop("There's no available memory to load dataset required to run this script, exiting...")
      } else {
            print(paste("data size is ok at (MB): ", data.size.mb))
      }
}