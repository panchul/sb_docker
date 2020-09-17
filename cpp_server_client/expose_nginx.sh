#!/bin/bash

# Then to get the external ip, do 
# $ k get services
#
# and then curl to that external ip and port if needed.

kubectl expose deployment my-nginx --type=LoadBalancer --name=my-service-nginx

