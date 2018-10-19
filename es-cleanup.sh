#!/bin/bash

HOST=$1
PORT=$2
INDEX_PATTERN=$3
NB_DAYS_TO_KEEP=$4

/usr/local/bin/curator_cli --host $1 --port $2 delete_indices --filter_list '[{"filtertype":"age","source":"name","direction":"older","timestring":"%Y.%m.%d","unit":"days","unit_count":'$NB_DAYS_TO_KEEP'},{"filtertype":"pattern","kind":"prefix","value":"'$INDEX_PATTERN'"}]'

#this command is to debloc the RO problem of ES when he has low disk memory (if we add disk space it won't happen)
#curl -XPUT -H "Content-Type: application/json" http://localhost:9200/_all/_settings -d '{"index.blocks.read_only_allow_delete": null}'
