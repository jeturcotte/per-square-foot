library(dplyr)
library(rgdal)

# manipulate the per-square-foot state data from zillow
# http://www.zillow.com/research/data/
psf <- read.csv("data/psf_by_state.csv")
remove_these <- c('RegionName','SizeRank')
#n$Year <- as.factor(format(as.Date( paste(n$Year,'01'), 'X%Y.%m %d' ), '%Y'))
psf <- psf[,!(names(psf) %in% remove_these)]
psf <- rename(psf, GEOID=RegionID)

# prepare the state data for joining
# https://www.census.gov/geo/maps-data/data/cbf/cbf_state.html
states <- readOGR("shp/cb_2015_us_state_20m.shp", layer="cb_2015_us_state_20m", verbose=F)
states$GEOID <- as.numeric(levels(states$GEOID))[states$GEOID]
states@data <- left_join(states@data, psf)