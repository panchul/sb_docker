#!/bin/bash

#
# That's the image I build from my other repository
#

docker run -it --runtime=nvidia -p 5001:5001 -p 8883:5002 alek8106/myinfer:20200910


