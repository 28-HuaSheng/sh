##变量基本处理
var_1="my name is ding xiangxiu"
echo $var_1
var_2=${var_1#*a} ##从头匹配删除
echo var_2 ##me is ding xiangxiu
var_3=${var_1##*a} ##从头匹配删除 最长
echo $var_3 ##ngxiu

##
var_1="my name is ding xiangxiu"
var_2=${var_1%xi*} ##尾部匹配删除
echo $var_2 ## my name is ding xiang
var_3=${var_1%%xi*}
echo $var_2 ## my name is ding

##替换
var_1="my name is ding xiangxiu"
var_2=${var_1/xi/####} ##替换第一个
echo $var_2 ## my name is ding ####angxiu
var_3=${var_1//xi/####} ##替换全部匹配到的
echo $var_3 ## my name is ding ####ang####u


##变量测试,不常用
var="i am huangchun bo"
var_temp=${var-default} ## var有配置=$var，无配置=default，为空=""


##字符串处理
##长度
var="ding xiangxiu qifu wo"
length=${#var} #21
expr length "this is a test" ##mac上不行
var_1=`expr length "$var"`  ##计算var的length

var="huang chun bo"
v1=`expr index "$var" bo` ##12
v2=`expr match "$var" hua` ##3, ！！必须从头匹配噢
v2=`expr match "$var" hua*` ##13

var="ding xiangxiu baby"
v1=${var:1} ##ing xiangxiu baby
v2=${var:1:5} ## ing x 
v3=${var: -2} ##by


###grep
grep -v"#" ##过滤掉有#的行
grep -c    ##显示匹配的行总数


## 数组定义
local line=(`echo "1  0   10.10.129.114    mzqcloud-Admonitor-IESAPI01  planing           tool" | sed -e "s/^[ \s]\{1,\}//g" | sed -e "s/[ \s]\{1,\}$//g"`)
echo $line[3] ##像是把line数组化了
arr=(a ss sd f)
echo arr[2]
## https://blog.csdn.net/lingeio/article/details/96428798 几个括号介绍





