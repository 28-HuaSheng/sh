gradle踩坑

1. /Users/bobo/.gradle/gradle.properties 配置tls版本。
    * https://docs.gradle.org/7.2/userguide/command_line_interface.html#sec:environment_options
    * https.protocols

2. compile等命令在gradle 7版本之后是废除的
    * https://stackoverflow.com/questions/23796404/could-not-find-method-compile-for-arguments-gradle/66910991#66910991?newreg=df25c4eb3e31480d81a952e3937d4521
    * <<这种 也要替换 addLast

3. maven{}标签下 ：allowInsecureProtocol = true 允许不安全的协议，不然报错
