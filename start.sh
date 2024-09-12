#!/bin/bash

# find the latest version of paper and download it if we are not using it
api=https://api.papermc.io/v2

echo Checking for paper updates...
latest_build=$(curl -s $api/projects/paper/versions/$MC_VERSION/builds -H 'accept: application/json' | jq '.builds[-1].build')
latest_filename=paper-$MC_VERSION-$latest_build.jar

if [ ! -f /server/$latest_filename ]; then
    echo Found later version, downloading...
    download_url=$api/projects/paper/versions/$MC_VERSION/builds/$latest_build/downloads/$latest_filename
    rm /jarcache/paper-$MC_VERSION-*.jar
    curl -s -o /jarcache/$latest_filename $download_url
    echo Downloaded!
fi

echo Starting minecraft server...
java -Xmx$MEM -jar /jarcache/$latest_filename --nogui
