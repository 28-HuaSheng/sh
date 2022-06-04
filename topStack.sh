#!/bin/bash
# !!!while read line管道写法的坑!!!
top_pid=$1
top -n 1 | awk '{print $1,$2}' | head -20 | while read Line
do
	if [[ ${Line} =~ $top_pid ]]
then
	echo 'top pid find:' $top_pid
fi
done

contro=false
threadArr=()
xxindex=0
threadArr[xxindex++]="tesettestete"
threadArr[xxindex++]="diunilaomiu"
echo   ${threadArr[*]}

echo 'start top -H'
# topThread方法内部的循环里面使用的管道的读法,通过子进程，获取外部变量是有问题的
# 一般情况使用while read line之前，先把内容放置在一个临时文件中
function topThread(){
	local index=0
	top -H -p $top_pid -n 1 |  awk '{print $1,$2,$3}' | head -10 | while read Line
		do
		 pid=`echo ${Line} | awk '{print $2}'`
		 echo 'pid is:'$pid
		if [[ $pid = "PID" && "$contro" == false ]]
			then
				echo '--contro set true--'
				contro=true
		fi
		if [[ "$contro" == true ]]
			then
				 second=`echo ${Line} | awk '{print $2}'`
				 echo 'second is:'$second'----end'
				if [[ "$second" -gt 0  ]]
				then
					echo 'second is > 0'
					echo   ${threadArr[*]}
					threadArr[index++]=$second
					threadArr[index++]="1234"
					threadArr[index++]="hellow world"

				else
					 fir=`echo ${Line} | awk '{print $1}'`
					 echo 'first is:'$fir'----end'
					threadArr[index++]=$fir
				fi
		fi
	done
}

topThread

echo 'threadArr[1]='  ${threadArr[1]}
echo   ${threadArr[*]}
