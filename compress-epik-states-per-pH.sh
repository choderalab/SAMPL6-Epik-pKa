#!/usr/bin/env bash
# to run
molecule_name="SM01 SM03 SM05 SM07 SM09 SM11 SM13 SM15 SM17 SM19 SM21 SM23 SM02 SM04 SM06 SM08 SM10 SM12 SM14 SM16 SM18 SM20 SM22 SM24"

phrange="2.0 2.1 2.2 2.3 2.4 2.5 2.6 2.7 2.8 2.9 3.0 3.1 3.2 3.3 3.4 3.5 3.6 3.7 3.8 3.9 4.0 4.1 4.2 4.3 4.4 4.5 4.6 4.7 4.8 4.9 5.0 5.1 5.2 5.3 5.4 5.5 5.6 5.7 5.8 5.9 6.0 6.1 6.2 6.3 6.4 6.5 6.6 6.7 6.8 6.9 7.0 7.1 7.2 7.3 7.4 7.5 7.6 7.7 7.8 7.9 8.0 8.1 8.2 8.3 8.4 8.5 8.6 8.7 8.8 8.9 9.0 9.1 9.2 9.3 9.4 9.5 9.6 9.7 9.8 9.9 10.0 10.1 10.2 10.3 10.4 10.5 10.6 10.7 10.8 10.9 11.0 11.1 11.2 11.3 11.4 11.5 11.6 11.7 11.8 11.9 12.0"

function compress_files {
    file_prefix=$1
    echo $1
    pushd output/states_per_pH/${file_prefix}
    zip -rm logfiles *.log
    zip -rm maefiles *.mae
    zip -rm bondprops *prop_bonds.csv
    popd 
}

# make func available to parallel
export -f compress_files
avail=1
echo running on $avail cores
parallel -j${avail} compress_files ::: ${molecule_name}

