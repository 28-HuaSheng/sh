### cpu高
  top command to find pid
  
  top -H -p 查找进程下的线程占用
 
  printf "%x\n" pid 
  
  jstack pid | grep -A 20 5ede 根据线程号查堆栈信息
  
  或者通过arthas 'thread -n 3'命令查看最忙的几个线程
  
  --------------- pidstat工具可以查看进程下 各个thread的cpu情况
  
  
 
### mysql cpu高
  show full processlist;
  
 select a.user,a.host,a.db,b.thread_os_id,b.thread_id,a.id processlist_id,a.command,a.time,a.state,a.info from information_schema.processlist a,performance_schema.threads b where a.id = b.processlist_id and b.thread_os_id=32272;
（thread_os_id：操作系统级别线程id）




### 内存高
  top 键入M,按内存使用排序
  - dump堆进行分析
  - arthas profiler start --event alloc/profiler stop --format html查看火焰图




### jvm内存高
### vmtool https://juejin.cn/post/6963457392759537701#heading-3
### ognl   https://juejin.cn/post/6844904013859651597#heading-16
   1. dump对象
      ```java
      jmap -dump:live,format=b,file=xxx.hprof PID （会stw）
      or
      arthas heapdump --live /tmp/dump.hprof
      or
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
      ```
   2. 
  
      




### mysql内存高
### mysql内存使用的一些系统变量
* mysql doc about mem use : https://dev.mysql.com/doc/refman/8.0/en/memory-use.html#monitor-mysql-memory-use
* <img width="200" alt="图" src="https://user-images.githubusercontent.com/46739345/172550252-54680051-442b-4c7b-a1b8-1906b3b8562d.png">
* 以上均可通过show/select global variables like查看。
* innodb_buffer_pool_size : show global variables like 'innodb_buffer_pool_size' / SELECT @@innodb_buffer_pool_size/1024/1024/1024 (系统除了java等剩余内存   的:50%-75%)
* 
*    SELECT * FROM performance_schema.memory_summary_global_by_event_name WHERE EVENT_NAME LIKE 'memory/innodb/buf_buf_pool 和
     SELECT * FROM sys.memory_global_by_current_bytes WHERE event_name LIKE 'memory/innodb/buf_buf_pool 在设置为开启状态时，可以查询







### 网卡占用
  nethogs
