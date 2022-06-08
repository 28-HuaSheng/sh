#!/bin/bash

cat info.log.2022-06-01.log | grep '********' | head -10 | awk -F 'campaign_id=' '{print $2}' | awk -F '&' '{print $1}'
