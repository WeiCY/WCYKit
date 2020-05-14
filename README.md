## [WCYKit](https://github.com/WeiCY/WCYKit)

> 开发中遇到的公共类的总结

​	在开发中我们也常常自己封装一些常用的工具和扩展来提高开发速度，这是我近年来在不同项目开发中常用功能的一些总结，包含了常用的工具类和扩展，类似于YYKit，但是我感觉他那边是在是功能太多，而且它里面没有一些常用工具类的封装。于是我把我日常开发中遇到的常见功能和工具类进行了整理和总结，就是现在的这个WCYKit了。

​	在使用中如果您遇到了一些问题，也请您尽快联系我。

***

**最新版本1.1.2**[^添加了一些新功能哦]

***

### 如何使用

* 手动下载拖入工程中
* 通过cocoapods导入 ```pod WCYKit```

### 整体结构

> WCYDefines [^ 常见的宏定义的整理，现版本是在一个文件中，后期可以考虑分开，颜色、字体等功能拆分，层次分明方便修改]
>
> WCYKitHeader[^整体的头文件，只需导入这个就可以使用所有的功能]
>
> WCYCategories[^整理的扩展类]
>
> > WCYCategoriesHeader[^扩展头文件]
> >
> > UIKit[^UIKit的扩展整理]
> >
> > > 对UIKit的扩展整理
> >
> > Foundation[^Foundation的扩展整理]
> >
> > > 对Foundation类的扩展整理
>
> WCYNetworking[^网络请求的二次封装]
>
> WCYTool[^常用工具类的封装]
>
> > 整理的常用工具类

### 版本历史

* 1.1.2版本

  新增基于GCD封装的定时器

  新增修改Label字间距、行间距的扩展

  新增常用的toast吐司展示

  新增一行代码调用系统相机相机的方法

  优化功能

* 1.1.1版本 

  修改目录结构，对里面一些功能进行的微调

  新增了几个新功能

* 1.1.0版本

  对项目进行重构，完善了名称规范

  新增字符串的校验、UItext的长度限定、UIView的阴影

  新增封装的网络请求类

  新增工具tool类。（包含pickerview、播放系统铃声、touchID、仿微信弹窗等）

* 1.0.2版本
  新增UIButton+WCYBadge和UIButton+WCYCountDown扩展

  注意倒计时button需要设置type为custom，如果是system就会出现一闪一闪的情况。

* 1.0.1版本

  主要是功能添加

  Foundation修改：

  新增NSData+WCYAdd，对数据进行了一些处理

  新增NSDictionary+WCYAdd，对字典新增含值判断和非空判断

  新增NSNotificationCenter+WCYAdd，对发送通知进行了一些处理

  新增NSString+WCYAdd，对字符串进行了一些处理；

  Kit修改：

  新增UIViewController+WCYAdd，对是否含有子控制器进行了判断

  新增UIDevice+WCYAdd，对设备进行了一些相关判断

  修改了UIColor+WCYCorners，新增了几个方法，修改了一些命名

* 1.0.0版本

  初始版本，提交初始框架。