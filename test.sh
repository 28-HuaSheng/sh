#!/bin/bash

arr=()
index=0
arr[index++]="123"  arr[index++]="234"  arr[index++]="adfds"
function topThread(){
	top -H -p 1 -n 1 |  awk '{print $1,$2,$3}' | head -5 > tmp_out
	while read Line
	do
		echo "line is:" ${Line}
		echo "loooooooooooop:" ${arr[*]}
		arr[index++]="123"
		arr[index++]="234"
		arr[index++]="adfds"
	done < tmp_out
}

topThread

function test2(){
	arr[index++]="testmmmmm"
	arr[index++]="testmmmmm2"
}

test2

echo   "arr:" ${arr[*]}
