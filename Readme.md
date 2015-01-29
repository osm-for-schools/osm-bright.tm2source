osm-bright.tm2source
=====================

This project is a [MapBox Studio](https://github.com/mapbox/mapbox-studio) vector tile source for the style
[OSM Bright](https://github.com/mapbox/mapbox-studio-osm-bright.tm2). It can be used to generate vector tiles from local OSM data.

Requirements
------------
- PostgreSQL
- PostGIS >= 2.0
- [imposm](http://imposm.org/docs/imposm/latest/) >= 2.5.0

Download OpenStreetMap data
------------
Download a dataset as `osm.pbf` file from the [GeoFabrik servers](http://download.geofabrik.de/).
For example:
```sh
wget http://download.geofabrik.de/africa/tanzania-latest.osm.pbf
```

Get the projects
------------
The following clones the source project and also [postgis-vt-util](https://github.com/mapbox/postgis-vt-util), a collection of Postgres helper functions.
```sh
git clone https://github.com/osm-for-schools/osm-bright.tm2source.git
git clone https://github.com/mapbox/postgis-vt-util.git
```

Setup the database
------------
```sh
sudo su postgres
psql -c "create database osm_tanzania;"
psql -d osm_tanzania -c "CREATE EXTENSION postgis;"
psql -d osm_tanzania -c "SELECT postgis_full_version();"
psql -d osm_tanzania -f postgis-vt-util/lib.sql
exit
```

Import the data
------------
```sh
imposm -U postgres -d osm_tanzania -m osm-bright.tm2source/imposm-mapping.py --read --write --optimize --deploy-production-tables --overwrite-cache tanzania-latest.osm.pbf
```

Add additional indices
------------
```sh
sudo su postgres
psql -d osm_tanzania -f osm-bright.tm2source/create-indices.sql
exit
```

*Use the source, Luke*
------------
Now you are ready to go. Open the source project `osm-bright.tm2source` in MapBox Studio for the style OSM Bright.
If you used a different database name, set this name in the `data.yml` file. Also when your database connection settings are differing.

To regenerate the file `data.xml`, which is used to generate the tiles with Mapnik, save the source project again with MapBox Studio.
The vector tiles itselves can be generated with MapBox Studio (*Export to MBTiles*).

Note: This vector tile source is certainly incomplete and does not yet cover the full range of features used in the OSM Bright style.
