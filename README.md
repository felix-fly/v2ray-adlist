# v2ray-adlist

生成自定义广告过滤文件，脚本默认执行环境为linux 64。windows下安装git后可以获得bash仿真环境，大部分linux命令可以执行，更新规则脚本需要wget命令，需要自行安装，可以参考[这里](https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058)或者自行百度。

### 更新规则并生成site.dat文件及mini.dat文件

```
# linux/mac
chmod +x ./update.sh
./update.sh

# windows
./update.sh
```

### # domain 规则

* gw
* ad

## 懒人模式

直接下载site.dat文件或者mini.dat文件，放到v2ray目录下，修改配置文件，添加相关条目。ad为广告列表，gw是某个列表，上网用的，你懂的。

## 文件说明

site.dat文件包含的是全部gw列表，ad部分来自Shadowrocket，有5000余条规则，文件体积大规则相对全面。mini.dat文件包含了gw的一个很小的子集，只涵盖了常用的一些网站，ad部分来自另外一个维护列表neoHosts，并不是Shadowrocket的子集，数量有2000多条，因此整个mini.dat文件体积较小，使用时根据个人喜好自由选择。

## 题外话

原始的规则列表里是包含ip规则的，不过数量不多，本来是想加上ip规则的，不过ip加载自定义文件需要geoip.dat文件，该文件本身就比较大，所以把ip规则去掉了，需要的可以自行修改，或者直接在v2ray配置文件中添加ip过滤规则。

经过一番尝试之后，目前ip还是没有搞定，使用[gslsoft](https://github.com/gslsoft/v2ray-custom-geo)提供的工具可以生产自定义的ip.dat文件，但是目前没法使用，会报`country not found:`的错误。

脚本改自

**https://github.com/onplus/v2ray-SiteDAT**

**https://github.com/ToutyRater/V2Ray-SiteDAT**

规则来自

**https://github.com/h2y/Shadowrocket-ADBlock-Rules**

**https://github.com/neoFelhz/neohosts**


## 更新记录
2019-04-18
* 增加mini.dat文件，规则来自另外一个列表
* 使用upx压缩sitedat工具，精简体积
* 规则更新

2019-02-13
* 将生成site.dat命令整合到update脚本。

2018-12-29
* 去掉一个ad源，减少误杀。

2018-12-1
* 更新ad & gw规则。

2018-11-17
* 更新ad & gw规则。

2018-11-03
* 更新ad规则。
