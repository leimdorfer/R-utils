# Data source: https://www.eia.gov/petroleum/gasdiesel/
# Load packages
library(tidyverse) 
library(lubridate) 
library(readxl)
library(scales)

setwd('/Users/leimda01/Sites/code/R/training2018/Session 1 Exercises')

# load data from xls and csv
crude_oil_production<-read_excel('PET_CRD_CRPDN_ADC_MBBL_M.xls',sheet=2, col_names=FALSE)

petrol_prices<-as.data.frame(read_csv('prices_data.csv'))

#Convert ot data frame and remove unwanted rows

crude_oil_production<-as.data.frame(
  crude_oil_production[-c(1:3),1:2]
)

#Rename columns

colnames(crude_oil_production) <- c('month_year' , 'field_production')

#Convert month_year to numeric

crude_oil_production$month_year <- as.numeric(
  crude_oil_production$month_year
)

#Convert month_year to Date

crude_oil_production$month_year <- as.Date(
  crude_oil_production$month_year,
  origin = '1900-01-01'
)

crude_oil_production$field_production <- as.numeric(crude_oil_production$field_production/1000)

#Here get rid of scientific numbers
point <- format_format(big.mark = " ", decimal.mark = ",", scientific = FALSE)

#draw the plot
ggplot(crude_oil_production, 
  aes(x = month_year, y = field_production)) + 
  geom_line(colour="#bbbbbb") +
  geom_smooth(colour="#59668d") +
  theme_light() +
  xlab("Date")+
  ylab("Field Production (000s of Barrels)") +
  ggtitle("Crude Oil Production 1920-2020")+
  scale_y_continuous(labels = point)

#######################

#colnames tolower
colnames(petrol_prices)<-tolower(colnames(petrol_prices))
petrol_prices$date<-as.Date(petrol_prices$date, format='%b %d, %Y')

#create new month and year columns then new month-year column

petrol_prices <-
petrol_prices %>%
  mutate(n_month = month(date)) %>%
  mutate(n_year = year(date)) %>%
  mutate(
    month_year = as.Date(paste0(n_year, "-", n_month, "-17"))
  )


### group petrol_prices by date and return average price
petrol_prices_monthly <- petrol_prices %>%
  select(month_year, price) %>%
  group_by(month_year) %>%
  summarise(price = mean(price))

# Add the two dataframes together join on month_year
petrol_prices_monthly <- petrol_prices_monthly %>% inner_join(crude_oil_production)

# convert from wide to long
#gather(#thedata, #newcol_for_old_cols, #newcol_for_values, #cols_to_gather)
petrol_prices_monthly <- 
  gather(petrol_prices_monthly, price_prod, values, 2:3)

petrol_prices_monthly$values<-as.numeric(petrol_prices_monthly$values)

#draw the plot
ggplot(petrol_prices_monthly, 
       aes(
         x = month_year, 
         y = values
    )
  ) + 
  geom_line(colour="#666666") +
  facet_grid(price_prod ~ ., scales = "free")+
  ggtitle("Crude Oil Production 1920-2020")+
  scale_y_continuous(labels = point)

write_csv(petrol_prices_monthly, './petrol_prices.csv')

