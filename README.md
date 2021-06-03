# SPCustomButton

### 

### 介绍

简单的分为五种类型的按钮样式

#### 图片文字水平显示

```objective-c
typedef NS_ENUM(NSInteger, SPHorizontalButtonType) {
    SPHorizontalButtonTypeLeftImageRightTitle    = 1 << 2,//左图右文字
    SPHorizontalButtonTypeRightImageLeftTitle    = 1 << 3,//右图左文字
};
```

##### 创建方法

```objective-c
+ (instancetype)sp_horizontalButton:(SPHorizontalButtonType)type isAutoWidth:(BOOL)isAutoWidth;
```

#### 图片文字垂直显示

```objective-c
typedef NS_ENUM(NSInteger, SPVerticalButtonType) {
    SPVerticalButtonTypeTopImageBottomTitle      = 1 << 5,//上图下文字
    SPVerticalButtonTypeBottomImageTopTitle      = 1 << 6,//下图上文字
};
```

##### 创建方法

```objective-c
+ (instancetype)sp_verticalButton:(SPVerticalButtonType)type isAutoHeight:(BOOL)isAutoHeight;
```

#### 图片文字居中显示

##### 创建方法

```objective-c
+ (instancetype)sp_centerButton;
```

#### 属性

提供控件对应属性可自定义图片的宽 `imageWidth` 高 `imageHeight` 和文字的宽 `titleWidth` 高 `titleHeight` ，图片或文字的开始位置 `initialPositionSpacing` 、结束位置 `endPositionSpacing` ，图片和文字的间距 `imageTitleSpacing`

