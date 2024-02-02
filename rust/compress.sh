#!/bin/bash
for TARGET in \
        boltz.0.1.2 unittest.boltz.0.1.2
do
    zip -r $TARGET.zip $TARGET
    rm -rf $TARGET
done