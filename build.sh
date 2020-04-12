#!/bin/bash
# change the value of NMLC to reference your own nmlc installation
NMLC="pyrun $HOME/Downloads/openttd/nml-0.4.5/nmlc"
./clean.sh
mkdir wannaroo-all-engines-all-climates
$NMLC -c -p DEFAULT --clear-orphaned wannaroo-all-engines-all-climates.nml
if [ $? -eq 0 ]
then
    cp wannaroo-all-engines-all-climates.grf wannaroo-all-engines-all-climates
    cp README.md wannaroo-all-engines-all-climates/readme.txt
    cp LICENSE wannaroo-all-engines-all-climates/license.txt
    cp changelog.txt wannaroo-all-engines-all-climates
    tar cvf wannaroo-all-engines-all-climates.tar wannaroo-all-engines-all-climates
    cp -i wannaroo-all-engines-all-climates.tar $HOME/.openttd/newgrf
    #cp -i wannaroo-all-engines-all-climates.grf $HOME/.openttd/newgrf
else
    echo "nmlc could not build newgrf"
fi

