# *------------------------------------------------------------------
# | PROGRAM NAME: Plot1.R
# | DATE: June 2015
# | CREATED BY: Andrew Leimdorfer 
# | PROJECT FILE: Exploratory Data Analysis Project2            
# *----------------------------------------------------------------
# | PURPOSE:               
# |Have total emissions from PM2.5 decreased in the United States from 1999 
# |to 2008? Using the base plotting system, make a plot showing the total 
# |PM2.5 emission from all sources for each of the years 1999, 2002, 2005, 
# |and 2008.
# *------------------------------------------------------------------
# | COMMENTS:               
# |
# |  1:  
# |  2: 
# |  3: 
# |*------------------------------------------------------------------
# | DATA USED:            
# | National Emissions Inventory (NEI)
# |       https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
# |
# |*------------------------------------------------------------------




# *------------------------------------------------------------------
# |                
# |  get rid of any existing data 
# |   
# |  
# *-----------------------------------------------------------------
rm(list=ls()) 
ls() # view open data sets