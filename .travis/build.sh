#!/bin/bash

definitionfile=$1
definition=`echo $definitionfile | sed 's/.def//'`
imagefile="${definition}.simg"
testfile="${definition}-test.sh"

echo "Creating $imagefile using $definitionfile..."
sudo singularity build $imagefile ${definitionfile}

echo "Running test"
sudo singularity exec $imagefile /.${testfile}
