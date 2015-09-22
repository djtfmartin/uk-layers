ssh layers.als.scot

export BASE_DIR=/data/ala/data/layers/raw
export URL_PATH=https://s3.eu-central-1.amazonaws.com/als-layers


wget -O $BASE_DIR/world.shp $URL_PATH/world.shp
wget -O $BASE_DIR/world.dbf $URL_PATH/world.dbf
wget -O $BASE_DIR/world.prj $URL_PATH/world.prj
wget -O $BASE_DIR/world.shx $URL_PATH/world.shx


wget -O $BASE_DIR/uk_state_province.shp $URL_PATH/uk_state_province.shp
wget -O $BASE_DIR/uk_state_province.dbf $URL_PATH/uk_state_province.dbf
wget -O $BASE_DIR/uk_state_province.prj $URL_PATH/uk_state_province.prj
wget -O $BASE_DIR/uk_state_province.shx $URL_PATH/uk_state_province.shx
