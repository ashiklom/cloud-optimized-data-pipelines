# NetCDF4 / HDF5 to COG

🚧 WIP 🚧 Configurable module for converting NetCDF4 / HDF5 to COG.

At this time, just a few configurations have been made in `example.ini`.

Before running the commands below, make sure you `cd cogify/`.

## Testing

`handler.py` by default is using an example with OMI NO2 data.

```bash
export EARTHDATA_USERNAME=xxx
export EARTHDATA_PASSWORD=XXX
export AWS_ACCESS_KEY_ID=XXX
export AWS_SECRET_ACCESS_KEY=XXX


docker build -t cogify .
# Runs an example in handler.py
docker run --env EARTHDATA_USERNAME --env EARTHDATA_PASSWORD --env AWS_ACCESS_KEY_ID --env AWS_SECRET_ACCESS_KEY cogify python -m handler \
--collection OMDOAO3e \
--href https://acdisc.gesdisc.eosdis.nasa.gov/data//Aura_OMI_Level3/OMDOAO3e.003/2022/OMI-Aura_L3-OMDOAO3e_2022m0105_v003-2022m0107t023328.he5 \
--upload
```

## Other supported collections

### GPM IMERG Example

[Update me]

### ERA5 Cloud Base Height Example

ERA5 data is fetched using `cdsapi` library which first requires registration and API configuration, see https://cds.climate.copernicus.eu/api-how-to for instructions. 

Current configuration is for the cloud base height variable.

```bash
# First fetch the data
python3 ERA5/fetch.py
# Generate the cog
python3 run.py -f download.nc -c ERA5
```

## IS2SITMOGR4

[ICESat-2 L4 Monthly Gridded Sea Ice Thickness, Version 1](https://nsidc.org/data/IS2SITMOGR4/versions/1)

```bash
# Assumes you have ~/.netrc credentials
curl -O https://n5eil01u.ecs.nsidc.org/ICESAT2_PO/IS2SITMOGR4.001/2021.03.01/IS2SITMOGR4_01_202103_004_001.nc
python -m handler --href IS2SITMOGR4_01_202103_004_001.nc --collection IS2SITMOGR4
```
