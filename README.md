# TipAlert
高仿QQ音乐的弹出框，提示用户去AppStore评分

# 效果
![效果](http://7te7sy.com1.z0.glb.clouddn.com/TipAlert.png)

# 安装

将`TipAlert`文件夹拖入项目即可

# 使用

API部分和系统自带的UIAlertView类似，点击按钮的回调使用了Block的方式实现。

* 导入头文件`#import "TipAlertView.h"`


* 创建Alert并展示：

```
TipAlertView *alert = [[TipAlertView alloc] initWithMessage:@"卖萌求鼓励\nXXX新版本用着还喜欢么，给点鼓励好不好呢？" image:[UIImage imageNamed:@"exampleImage"] buttonTitles:@[@"反馈问题",@"鼓励我们"]];
    
    alert.AcceptBlock = ^(){
        
        //点击评价的回调
        NSLog(@"去评价了",nil);
    };
    alert.RefuseBlock = ^(){
        
        //点击拒绝的回调
        NSLog(@"被拒绝了",nil);
    };
    [alert show];
```



