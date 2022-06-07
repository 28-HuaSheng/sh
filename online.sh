# cpu高
  top command to find pid
  
  top -H -p 查找进程下的线程占用
 
  printf "%x\n" pid 
  
  jstack pid | grep -A 20 5ede 根据线程号查堆栈信息
  
  或者通过arthas 'thread -n 3'命令查看最忙的几个线程


# jvm内存高
# vmtool https://juejin.cn/post/6963457392759537701#heading-3
# ognl   https://juejin.cn/post/6844904013859651597#heading-16
   1. dump对象
      jmap -dump:live,format=b,file=xxx.hprof PID
      或者
      arthas heapdump --live /tmp/dump.hprof
      或者
      arthas vmtool(直接在线观测对象): vmtool --action getInstances --className java.util.HashMap --limit 10 -x5
      
      性能测试用例: vmtool --action getInstances --className com.ibeetl.code.ch01.test.OutMemoryCase1 -x 2  
                  ognl获取属性或者执行方法:(--express 'instances[0].getBean("userController").findUserById(1)')
      返回:
      @OutMemoryCase1[][
        @OutMemoryCase1[
          map=@HashMap[isEmpty=false;size=605000],
          idBase=@Long[605000],
          config=@Config[com.ibeetl.code.ch01.sample.Config@49a01a75],
    ],
]

# mysql内存高

# 网卡占用
  nethogs
