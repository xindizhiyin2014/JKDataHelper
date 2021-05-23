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

