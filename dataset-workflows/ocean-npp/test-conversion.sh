gdal_translate NETCDF:"sample-files/A20200012020031.L3m_MO_NPP_npp_vgpm_4km.nc":npp_vgpm A20200012020031.L3m_MO_NPP_npp_vgpm_4km.tif -a_srs EPSG:4326
gdal_translate A20200012020031.L3m_MO_NPP_npp_vgpm_4km.tif A20200012020031.L3m_MO_NPP_npp_vgpm_4km_cog.tif -of COG
