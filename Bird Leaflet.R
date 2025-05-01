

library(tidyverse) #Tidy dataset
library(ggplot2) #Graphing
library(dplyr) #Data exploration functions
library(leaflet) #Map creation
library(leaflet.providers) #Assists map creation
library(sf) #Work with geopoint data
library(plotly) #Work with interactive plots (just in case)
library(lubridate) #Seperate year from date column to graph new whales in cat. per year


#Create a working directory using getwd()
getwd()

#Set the working directory to the OneDrive folder storing all Data Science files
setwd("C:/Users/dan iovino/OneDrive - go.Stockton.edu/DSSA 2025")

#Read the csv. file data to give the data a shorthand for all future lines of code
Bird <- read.csv("birddata.csv", header = TRUE)




#Check that lat and long values are integers not characters
str(Bird$latitude)
str(Bird$longitude)
#Both lat and long coords are characters, need to be integers



lat <- Bird$latitude
long <- Bird$longitude


birdmap <- leaflet() %>%   
  addTiles() %>% 
  setView(lng = -98.5795, lat = 39.8283, zoom = 4) %>%  # Center of U.S.
  addScaleBar(position = "bottomleft") %>%
  addCircleMarkers(
    lng = long,
    lat = lat,
    radius = 1.5,
    stroke = FALSE,
    fillOpacity = 0.8,
    color = "yellowgreen"
  ) %>%
  addProviderTiles("Esri.WorldImagery")

birdmap

