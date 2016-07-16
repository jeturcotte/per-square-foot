library(dplyr)

psf <- read.csv("data/psf_by_county.csv")

do_not_melt <- c('RegionID','RegionName','State','Metro','StateCodeFIPS','MunicipalCodeFIPS','SizeRank')
keep_these <- c('FIPS','Year','MeanPrice') 

n <- melt(psf, id.vars=do_not_melt, variable.name="Year", value.name="MeanPrice")
n <- subset(n, grepl(".01$", Year))
n$Year <- as.factor(format(as.Date( paste(n$Year,'01'), 'X%Y.%m %d' ), '%Y'))
n$FIPS <- as.factor(n$StateCodeFIPS * 1000 + n$MunicipalCodeFIPS)
n <- n[,keep_these]
