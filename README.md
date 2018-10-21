# v2ray-adlist

生成自定义广告过滤文件，脚本默认执行环境为linux 64。windows下安装git后可以获得bash仿真环境，大部分linux命令可以执行，更新规则脚本需要wget命令，需要自行安装，可以参考[这里](https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058)或者自行百度。

更新规则

```
# linux/mac
chmod +x ./update.sh
./update.sh

# windows
./update.sh
```

生成v2ray使用的dat文件

```
# linux
chmod +x ./v2sitedat
./v2sitedat -dat ./custom.dat -dir ./list

# mac
chmod +x ./v2sitedat_darwin
./v2sitedat_darwin -dat ./custom.dat -dir ./list

# windows
./v2sitedat.exe -dat ./custom.dat -dir ./list

# 32位操作系统替换为v2sitedat32
```

### # domain 规则

* gw
* gw-ext
* ad
* ad-ext

## 懒人模式

直接下载custom.dat文件，放到v2ray目录下，修改配置文件，添加相关条目。

## 题外话

原始的规则列表里是包含ip规则的，不过数量不多，本来是想加上ip规则的，不过ip加载自定义文件需要geoip.dat文件，该文件本身就比较大，所以把ip规则去掉了，需要的可以自行修改，或者直接在v2ray配置文件中添加ip过滤规则。

脚本改自

**https://github.com/ToutyRater/V2Ray-SiteDAT**

**https://github.com/ToutyRater/V2Ray-SiteDAT**

规则来自

**https://github.com/h2y/Shadowrocket-ADBlock-Rules**
