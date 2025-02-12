INSERT INTO pgstac.collections (content) VALUES('{
    "id": "OMI_trno2-COG",
    "type": "Collection",
    "links": [],
    "title": "OMI_trno2 - 0.10 x 0.10 Annual as Cloud-Optimized GeoTIFFs (COGs)",
    "extent": {
        "spatial": {
            "bbox": [
                [
                    -180,
                    -90,
                    180,
                    90
                ]
            ]
        },
        "temporal": {
            "interval": [
                [
                    "2005-01-01T00:00:00Z",
                    "2021-01-01T00:00:00Z"
                ]
            ]
        }
    },
    "license": "MIT",
    "description": "OMI_trno2 - 0.10 x 0.10 Annual as Cloud-Optimized GeoTIFFs (COGs)",
    "stac_version": "1.0.0",
    "dashboard:is_periodic": true,
    "dashboard:time_density": "year",
    "item_assets": {
        "cog_default": {
        "type": "image/tiff; application=geotiff; profile=cloud-optimized",
        "roles": [
            "data",
            "layer"
        ],
        "title": "Default COG Layer",
        "description": "Cloud optimized default layer to display on map"
        }
    }    
}')
ON CONFLICT (id) DO UPDATE 
  SET content = excluded.content;