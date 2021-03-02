# Create Antarctica shape
# Author: Kimberlee Baldry
# Created: 12022021
#
#
library(rgdal)
library(sf)
### Prepare the data to be saved
# The shape was downloaded from the ArcGIS repository
ant = readOGR(dsn = "./data/Antarctica", layer = "Antarctica")
# read the map shapefile
ant = st_read("./data/Antarctica/Antarctica.shp")
# reproject the map
ant = st_transform(ant, crs = "+proj=merc +lon_0=0 +k=1 +x_0=0 +y_0=0 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")
# crop the bottom of Antarctica. The cropping offset is "+ 15000000".
ant = st_crop(ant, xmin = -20037510, ymin = -32493690 + 15000000, xmax = 20037510, ymax = -8475436) 

### Save the data for the package
# if you are adjusting this data in the package the file needs to point to the git directory from which you commit changes.
save(ant, file = "C:/Users/kabaldry/OneDrive - University of Tasmania/Documents/R_packages/mapSOOSWG/data/Antarctica.rda")
# After running the script you need to remember to commit changes to the online mapSOOS repository
print("remember to commit to KimBaldry/mapSOOSWG")