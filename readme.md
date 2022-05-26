NIIT 2022 Proejct B3B4 Group2
===
![Java1.8](https://img.shields.io/badge/Java-1.8-blue.svg)
![Hadoop 2.9.2](https://img.shields.io/badge/Hadoop-2.9.2-green.svg)
![Hive 2.3.8](https://img.shields.io/badge/Hive-2.3.8-green.svg)
### 项目成员: 
>连仕杰
 袁蕾
 殷明
 刘宣兑
 郑欣然

### How to begin : 
>
**First: get our code**
```bash
git -clone https://github.com/LiamLian0727/Group2.git
```
**Second: run src\HiveJar\useJar' code to use our UDF function in Hive**
>
>
**Third: Change config in hive to make it faster**
```bash
SET hive.exec.reducers.bytes.per.reducer=1;
SET hive.exec.mode.local.auto=true;
SET hive.exec.mode.local.auto.inputbytes.max=50000000;
SET hive.exec.mode.local.auto.input.files.max=5; 
SET hive.exec.parallel=true;
SET hive.exec.parallel.thread.number=16;
```
***Make by 2022/5/22***
 





