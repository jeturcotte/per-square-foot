library(dplyr)
library(rgdal)

# manipulate the per-square-foot state data from zillow
# http://www.zillow.com/research/data/
psf <- read.csv("data/psf_by_state.csv")
keep_these <- c('RegionID','X1996.04','X1997.04','X1998.04','X1999.04','X2000.04','X2001.04',
                'X2002.04','X2003.04','X2004.04','X2005.04','X2006.04','X2007.04','X2008.04',
                'X2009.04','X2010.04','X2011.04','X2012.04','X2013.04','X2014.04','X2015.04',
                'X2016.04')
psf <- psf[,keep_these]
psf <- rename(psf, GEOID=RegionID)
names(psf) <- gsub("X","PSF_", names(psf))
names(psf) <- gsub("\\.\\d\\d$","", names(psf))

# prepare the state data for joining
# https://www.census.gov/geo/maps-data/data/cbf/cbf_state.html
states <- readOGR("shp/cb_2015_us_state_20m.shp", layer="cb_2015_us_state_20m", verbose=F)
states$GEOID <- as.numeric(levels(states$GEOID))[states$GEOID]
states@data <- left_join(states@data, psf)

writeOGR(states, "shp/", "states_per_square_foot", driver="ESRI Shapefile")