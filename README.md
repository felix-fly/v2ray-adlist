# v2ray-adlist

生成自定义广告过滤文件，脚本默认执行环境为linux 64。windows下安装git后可以获得bash仿真环境，大部分linux命令可以执行，更新规则脚本需要wget命令，需要自行安装，可以参考[这里](https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058)或者自行百度。

### 更新规则并生成dat文件

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

直接下载`site.dat`文件，放到v2ray目录下，修改配置文件，添加相关条目。ad为广告列表，gw是某个列表，上网用的，你懂的。

## 文件说明

`site.dat`文件包含的是全部gw列表，ad部分主要来自 anti-AD(包含5万余条规则)，以及自己搜集到的一些网站（为了维护方便，统一放在了另一个repo里）。

脚本改自

* https://github.com/onplus/v2ray-SiteDAT
* https://github.com/ToutyRater/V2Ray-SiteDAT

规则来自

* https://github.com/cokebar/gfwlist2dnsmasq
* https://github.com/privacy-protection-tools/anti-AD

## 更新记录
2021-12-14
* 移除 site-full.dat

2021-07-20
* 规则统一从另外一个repo里拉取

2020-11-16
* 增加新的广告源，独立文件

2019-07-01
* 规则更新

2019-05-15
* 删除mini.dat
* 合并多个ad源

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
