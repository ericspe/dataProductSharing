# sharing
---
title: 'Data Products: Week 2 assignement'
author: "Eric"
date: "October 9, 2018"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE, warning=FALSE, comment = FALSE, message = FALSE)
```

## Interactive map


```{r DP1}
#install.packages("leaflet")
library(leaflet)
library(dplyr)

# coordinates of the place (ruined castle Bilstein)
df <- data.frame(lat = c(48.1954, 48.1954),
                 lng = c(7.2697,7.2697))

# links to pictures on Google map
bilsteinPics <- c(
  "<a href='https://goo.gl/maps/GxXNvfybAgC2'>ruined castle</a>",
  "<a href='https://goo.gl/maps/kUkhTzmUcTK2'>view from tower</a>"
)

#create map, markers and popups
df %>% 
  leaflet() %>%
  addTiles() %>%
  addMarkers(popup = bilsteinPics, clusterOptions = markerClusterOptions())

```

