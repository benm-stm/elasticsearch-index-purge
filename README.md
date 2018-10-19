# elasticsearch-index-purge
a small curator scipt to purge the last x days for a specific index pattern

# Some issues
In case of low disk space the kibana will block write access on the es cluster, to allow write access again just ru the below command
```
curl -XPUT -H "Content-Type: application/json" http://localhost:9200/_all/_settings -d '{"index.blocks.read_only_allow_delete": null}'
```

# how to automate
You can crone the script in one of the nodes as it is shown below to only keep the 10 last days having the pattern ""logstash-${date}
```
00 02 * * * root /usr/local/bin/es-cleanup.sh 127.0.0.1 9200 logstash- 10 > /dev/null 2>&1
```
