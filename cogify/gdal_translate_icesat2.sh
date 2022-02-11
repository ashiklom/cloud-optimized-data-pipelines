#!/bin/bash
# xmin -3837500.0 xmax 3737500.0 ymin -5337500.0 ymax 5837500.0
gdal_translate -a_ullr -3837500 5837500 3737500 -5337500 \
  -a_srs EPSG:3411 \
  NETCDF:"IS2SITMOGR4_01_202103_004_001.nc":ice_thickness out.tif

# xmin -180.0 xmax 179.81398010253906 ymin 31.102672576904297 ymax 89.8368148803711
# webmercator bounds: -180.0 -85.06 180.0 85.06
gdalwarp -overwrite -t_srs EPSG:4326 -te -180 31.103 179.814 89.837 out.tif out_4326.tif

# <ulx> <uly> <lrx> <lry>
gdal_translate -projwin -180 85.0 179.814 31.103 -of COG out_4326.tif out_4326_clipped_for_3857.tif

gdalwarp -overwrite -s_srs epsg:4326 -t_srs epsg:3857 out_4326.tif out_3857.tif
