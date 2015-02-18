layers = [
	[name: "Broadleaved woodland"],
	[name: "Coniferous Woodland"],
	[name: "Arable and Horticulture"],
	[name: "Improved Grassland"],
	[name: "Rough grassland"],
	[name: "Neutral Grassland"],
	[name: "Calcareous Grassland"],
	[name: "Acid grassland"],
	[name: "Fen, Marsh and Swamp"],
	[name: "Heather"],
	[name: "Heather grassland"],
	[name: "Bog"],
	[name: "Montane Habitats"],
	[name: "Inland Rock"],
	[name: "Saltwater"],
	[name: "Freshwater"],
	[name: "Supra-littoral Rock"],
	[name: "Supra-littoral Sediment"],
	[name: "Littoral Rock"],
	[name: "Littoral sediment"],
	[name: "Saltmarsh"],
	[name: "Urban"],
	[name: "Suburban"]
]

startIndex = 1000
layerIdIdx = 1

layers.each {

  LAYER_ID = startIndex
  LAYER_SHORT_NAME = it.name.replace(' ', '_') + "_landcover_2007_pc_tgt"
  LAYER_DISPLAY_NAME =  it.name + " - Land Cover Map 2007 (1km percentage target class, GB) "
  RAW_BIL_FILE = "/data/ala/data/layers/raw/landcover_2007_percent_target/DGWR.LCM2007_GB_1K_PC_TAR_V2_" + layerIdIdx + ".asc"

  println("/usr/lib/layer-ingestion/landcover.sh \"${LAYER_ID}\" \"${LAYER_SHORT_NAME}\" \"${LAYER_DISPLAY_NAME}\" \"${RAW_BIL_FILE}\"")
  startIndex++
  layerIdIdx++
}