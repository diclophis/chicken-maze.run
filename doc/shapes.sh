#!/bin/bash

set -x
set -e

# vc -> vertex colors,  vf -> vertex flags,
# vq -> vertex quality, vn-> vertex normals,
# vt -> vertex texture coords,
# fc -> face colors,  ff -> face flags,
# fq -> face quality, fn-> face normals,
# wc -> wedge colors, wn-> wedge normals,
# wt -> wedge texture coords
#data to save in the output files:
#vc -> vertex colors, vf -> vertex flags, vq -> vertex quality, vn-> vertex normals,
#vt -> vertex texture coords,  fc -> face colors, ff -> face flags, 
#fq -> face quality, fn-> face normals,  wc -> wedge colors, wn-> wedge normals, wt -> wedge texture coords 

#OPENSCAD=/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD
#MESHLAB="DYLD_FRAMEWORK_PATH=/Applications/meshlab.app/Contents/Frameworks /Applications/meshlab.app/Contents/MacOS/meshlabserver"

OPENSCAD=openscad
MESHLAB=meshlabserver
#FILTERS=color-4.mlx

#THIS_WORKING_DIR="" #`pwd`
THIS_WORKING_DIR=`pwd`

mkdir -p resources
mkdir -p tmp

rm tmp/shape* || true

for I in `seq 0 15`
do
  $OPENSCAD -D shape=${I} -o tmp/shape-${I}.stl doc/openscad/map-parts.scad

  FOO="-m vc vn vt wt"
  #MESHARGS="-l /var/tmp/mllog -i ./tmp/shape-${I}.stl -o ./tmp/shape-${I}-mid.obj $FOO -s doc/openscad/$FILTERS"
  MESHARGS="-l /var/tmp/mllog -i tmp/shape-${I}.stl -o tmp/shape-${I}.obj $FOO -s doc/openscad/foop.mlx"

  #FOO2="-m vc vn vt wt"
  #MESHARGS_TWO="-l /var/tmp/mllog -i ./tmp/shape-${I}-mid.obj -o ./tmp/shape-${I}.obj $FOO2 -s doc/openscad/foop.mlx"

  $MESHLAB ${MESHARGS}
  #$MESHLAB ${MESHARGS_TWO}
  #rm tmp/shape-${I}-mid.obj*

  ##(test -e tmp/shape-null_tex.png && cp tmp/shape-null_tex.png tmp/shape-${I}_tex.png) || true

  ##sed -i -e "s~mtllib\ \./~mtllib\ $THIS_WORKING_DIR/tmp/~" tmp/shape-${I}.obj
  ##sed -i -e "s~map_Kd\ ~map_Kd\ $THIS_WORKING_DIR/tmp/~" tmp/shape-${I}.obj.mtl
  ##sed -i -e "s~shape-null~shape-$I~" tmp/shape-${I}.obj.mtl

  ##assimp export tmp/shape-${I}.obj tmp/shape-${I}.glb -fglb2 -embtex --flip-uv --improve-cache-locality --remove-redundant-materials --join-identical-vertices --validate-data-structure -om -og -l -v 
  ##assimp export tmp/shape-${I}.obj resources/shape-${I}.obj -om -og -l -v 
  ##assimp export tmp/shape-${I}.obj resources/shape-${I}.stl -om -og -l -v 
  #assimp export tmp/shape-${I}.obj resources/shape-${I}.iqm -om -og -l -v 
  #assimp export tmp/shape-${I}.obj resources/shape-${I}.glb -fglb2  -om -og -l -v 
  #assimp export tmp/shape-${I}.obj resources/shape-${I}.glb -fglb2 --flip-uv --improve-cache-locality --remove-redundant-materials --join-identical-vertices --validate-data-structure -om -og -l -v 

  ###sed -i -e "s~shape-0_tex\ ~map_Kd\ $THIS_WORKING_DIR/tmp/~" tmp/shape-${I}.obj.mtl
  sed -i -e "s/map_Kd\ shape-0_tex.png/map_Kd\ shape-${I}_tex.png/" tmp/shape-${I}.obj.mtl
  #rm tmp/shape-${I}_tex.png
  if [ ! -e tmp/shape-${I}_tex.png ];
  then
    cp tmp/shape-0_tex.png tmp/shape-${I}_tex.png
  fi

  assimp export tmp/shape-${I}.obj resources/maze-${I}.glb -fglb2 --flip-uv --improve-cache-locality --remove-redundant-materials --join-identical-vertices --validate-data-structure -om -og -l -v 
  cp tmp/shape-${I}_tex.png resources/shape-${I}_tex.png
done

#cp tmp/shape-*.gltf resources/
