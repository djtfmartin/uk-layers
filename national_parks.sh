#!/bin/bash
# Loads a contextual layer using from a shape file (.shp)
# NOTE: The following 9 variables need to be modified for each new layer
export SHAPEFILE="/mnt/data/ala/data/layers/raw/magnatpk.shp"
export LAYERID="3"
export LAYER_SHORT_NAME="magnatpk"
export LAYER_DISPLAY_NAME="National Parks"
export FIELDSSID="CODE"
export FIELDSSNAME="NAME"
export FIELDSSDESCRIPTION="NAME"
export NAME_SEARCH="true"
export INTERSECT="false"

export DBUSERNAME="postgres"
export DBPASSWORD="postgres"
export DBHOST="localhost"
export DBNAME="layersdb"
export DBJDBCURL="jdbc:postgresql://localhost:5432/layersdb"

export GEOSERVERBASEURL="http://localhost:8080/geoserver"
export GEOSERVERUSERNAME="admin"
export GEOSERVERPASSWORD="geoserver"

export REPROJECTEDSHAPEFILE="/mnt/data/ala/data/layers/ready/shape/${LAYER_SHORT_NAME}.shp"

export JAVA_CLASSPATH="./layer-ingestion-1.0-SNAPSHOT.jar:./lib/*"

echo "Reprojecting shapefile to WGS 84" \
&& ogr2ogr -lco ENCODING=UTF-8 -t_srs EPSG:4326  "${REPROJECTEDSHAPEFILE}" "${SHAPEFILE}" \
&& echo "Creating layer and fields table entries for layer, converting shapefile to database table" \
&& java -Xmx10G -cp "${JAVA_CLASSPATH}" au.org.ala.layers.ingestion.contextual.ContextualFromShapefileDatabaseLoader "${LAYERID}" "${LAYER_SHORT_NAME}" "${LAYER_DISPLAY_NAME}" "${FIELDSSID}" "${FIELDSSNAME}" "${FIELDSSDESCRIPTION}" "${NAME_SEARCH}" "${INTERSECT}" "${REPROJECTEDSHAPEFILE}" "${DBUSERNAME}" "${DBPASSWORD}" "${DBJDBCURL}" "${DBHOST}" "${DBNAME}" \
&& echo "Create objects from layer" \
&& java -Xmx10G -cp "${JAVA_CLASSPATH}" au.org.ala.layers.ingestion.contextual.ContextualObjectCreator "${LAYERID}" "${DBUSERNAME}" "${DBPASSWORD}" "${DBJDBCURL}" \
&& echo "Load layer into geoserver" \
&& java -Xmx10G -cp "${JAVA_CLASSPATH}" au.org.ala.layers.ingestion.PostgisTableGeoserverLoader "${GEOSERVERBASEURL}" "${GEOSERVERUSERNAME}" "${GEOSERVERPASSWORD}" "${LAYERID}" "${LAYER_SHORT_NAME}" "${LAYER_DISPLAY_NAME}"  

