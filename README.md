# JKDataHelper

[![CI Status](http://img.shields.io/travis/HHL110120/JKDataHelper.svg?style=flat)](https://travis-ci.org/HHL110120/JKDataHelper)
[![Version](https://img.shields.io/cocoapods/v/JKDataHelper.svg?style=flat)](http://cocoapods.org/pods/JKDataHelper)
[![License](https://img.shields.io/cocoapods/l/JKDataHelper.svg?style=flat)](http://cocoapods.org/pods/JKDataHelper)
[![Platform](https://img.shields.io/cocoapods/p/JKDataHelper.svg?style=flat)](http://cocoapods.org/pods/JKDataHelper)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Installation

JKDataHelper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

OC:

```
pod "JKDataHelper"
```
Swift:
```
pod "JKDataHelper_Swift"

```
## QQ contact group
![](https://github.com/xindizhiyin2014/JKDataHelper/blob/master/zrCode.png?raw=true)

## Author

xindizhiyin2014, 929097264@qq.com

## License

JKDataHelper is available under the MIT license. See the LICENSE file for more info.

##关于JKDataHelper
JKDataHeper 最初是用来解决降低crash率，处理接口返回不稳定的一个工具，主要目的是为了在线上环境进行错误降级。之所以没有使用使用消息转发，拦截的技术主要是为了降低影响范围，将这个工具的影响范围只局限于自己的实际业务代码。另外参考<font/ color = red>测试左移</font>的原则,在内部实现上使用了很多的断言，能够在debug环境下，将问题及早暴露出来。如果公司有条件的话，还可以结合日志系统，将线上的错误信息上报，方便对问题进行分析归因。OC版本和swift版本都进行了充分的单元测试，大家对单元测试感兴趣的话，可以看看。希望多多指教

##实现历程博客
[《iOS容错利器之JKDataHelper》](https://blog.csdn.net/hanhailong18/article/details/58969660?spm=1001.2014.3001.5502)

[《iOS容错利器之JKDataHelper（二）》](https://blog.csdn.net/hanhailong18/article/details/68923176?spm=1001.2014.3001.5502)

[《iOS中的crash防护（一）unrecognized selector sent to instance》](https://blog.csdn.net/hanhailong18/article/details/70909632?spm=1001.2014.3001.5502)

[《iOS中的crash防护（二）KVC造成的crash》](https://blog.csdn.net/hanhailong18/article/details/71182878?spm=1001.2014.3001.5502)

[《iOS中的crash防护（三）KVO造成的crash》](https://blog.csdn.net/hanhailong18/article/details/73034017?spm=1001.2014.3001.5502)

[《iOS中的crash防护（四）NSNotificationCenter指定线程接收通知》](https://blog.csdn.net/hanhailong18/article/details/76830936?spm=1001.2014.3001.5502)
