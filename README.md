# GOCustomButton

### 

### 介绍

简单的分为五种类型的按钮样式

#### 图片文字水平显示

```objective-c
typedef NS_ENUM(NSInteger, GOHorizontalButtonType) {
    SPHorizontalButtonTypeLeftImageRightTitle    = 1 << 2,
    SPHorizontalButtonTypeRightImageLeftTitle    = 1 << 3,
};
```

##### 创建方法

```objective-c
+ (instancetype)go_horizontalButton:(GOHorizontalButtonType)type isAutoWidth:(BOOL)isAutoWidth;
```

#### 图片文字垂直显示

```objective-c
typedef NS_ENUM(NSInteger, GOVerticalButtonType) {
    SPVerticalButtonTypeTopImageBottomTitle      = 1 << 5,
    SPVerticalButtonTypeBottomImageTopTitle      = 1 << 6,
};
```

##### 创建方法

```objective-c
+ (instancetype)go_verticalButton:(GOVerticalButtonType)type isAutoHeight:(BOOL)isAutoHeight;
```

#### 图片文字居中显示

##### 创建方法

```objective-c
+ (instancetype)go_centerButton;
```

#### 属性

提供控件对应属性可自定义图片的宽 `imageWidth` 高 `imageHeight` 和文字的宽 `titleWidth` 高 `titleHeight` ，图片或文字的开始位置 `initialPositionSpacing` 、结束位置 `endPositionSpacing` ，图片和文字的间距 `imageTitleSpacing`

