#!/bin/bash
#
# Usage:
#   graysize 100x100 input_folder output_folder


size=$1
inputDir=$2
outDir=$3
i=1

# grayscaleOp="-modulate"
# grayscaleConfig="100,0"
#
# grayScaleOp=-fx
# grayScaleConfig='(r+g+b)/3'

grayscaleOp="-grayscale"
grayscaleConfig="rec709luma"

for file in "$inputDir"/*.{jpg,jpeg,png}
do
  echo "Created $i.jpg from $file"
  convert "$file" \
    -gravity center \
    -sigmoidal-contrast 10,50% \
    -thumbnail "$size"^ \
    -extent "$size" \
    "$grayscaleOp" "$grayscaleConfig" \
    "$outDir/$i.jpg"
  i=$((i+1))
done

