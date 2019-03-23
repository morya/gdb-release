# gdb-release
using gdb on release version?

gdb 确实不能调试release version程序。

但是，有一种曲线救国的办法：

先编译一份带 debug symbols 的version，然后用`objcopy`指令再生成一份不带调试信息的release version。

那么，如果生产环境中使用了此release version发现任何的coredump时，直接拿debug version和 coredump 文件结合使用，即可方便的快速定位问题。

具体指令可以查看 makefile