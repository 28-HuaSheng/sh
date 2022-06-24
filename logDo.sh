#!/bin/bash
# 磁盘
整体挂载  df -h
当前目录  du -sh *
当前目录排序  du -s * | sort -nr | head
# 单文件匹配
cat info.log.2022-06-01.log | grep '********' | head -10 | awk -F 'campaign_id=' '{print $2}' | awk -F '&' '{print $1}'
cat info.log.2022-06-15.log | grep 'K_userName' | awk -F 'K_userName = ' '{print $2}' | awk -F ']' '{print $1}' | sort | uniq >> tmp.username.out
# 多文件匹配
cat info.log.2022-06*.log | grep 'api1/|api2' | grep 'A\|B\|C' | wc -l
