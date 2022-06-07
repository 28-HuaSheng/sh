# cpu高
  top command to find pid
  
  top -H -p 查找进程下的线程占用
 
  printf "%x\n" pid 
  
  jstack pid | grep -A 20 5ede 根据线程号查堆栈信息
  
  或者通过arthas 'thread -n 3'命令查看最忙的几个线程

# jvm内存高

# mysql内存高

# 网卡占用
