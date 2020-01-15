# GWLCustomButton

### 安装

使用 `CocoaPods` 安装:  `pod 'GWLCustomButton'`



### 介绍

简单的分为五种类型的按钮样式

#### 图片文字水平显示

```objective-c
typedef NS_ENUM(NSInteger, HorizontalButtonType) {
    HorizontalButtonTypeLeftImageRightTitle    = 1 << 2,//左图右文字
    HorizontalButtonTypeRightImageLeftTitle    = 1 << 3,//右图左文字
};
```

##### 创建方法

```objective-c
+ (instancetype)gwl_horizontalButton:(HorizontalButtonType)type isAutomaticWidth:(BOOL)isAutomaticWidth;
```

#### 图片文字垂直显示

```objective-c
typedef NS_ENUM(NSInteger, VerticalButtonType) {
    VerticalButtonTypeTopImageBottomTitle      = 1 << 5,//上图下文字
    VerticalButtonTypeBottomImageTopTitle      = 1 << 6,//下图上文字
};
```

##### 创建方法

```objective-c
+ (instancetype)gwl_verticalButton:(VerticalButtonType)type isAutomaticHeight:(BOOL)isAutomaticHeight;
```

#### 图片文字居中显示

##### 创建方法

```objective-c
+ (instancetype)gwl_centerButton;
```

#### 属性

提供控件对应属性可自定义图片的宽`imageWidth`高`imageHeight`和文字的宽`titleWidth`高`titleHeight`，图片或文字的开始位置`initialPositionSpacing`、结束位置`endPositionSpacing`、中间间距`imageTitleSpacing`