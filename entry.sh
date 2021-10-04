#!/bin/sh

cat template.json | sed "s/DEF_MM2_PASSWORD/$MM2_PASSWORD/g" | sed "s/DEF_MM2_SEED/$MM2_SEED/g" > MM2.json
stdbuf -oL ./mm2
