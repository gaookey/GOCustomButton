//
//  SPCustomButton.h
//  SPCustomButton
//
//  Created by 高文立 on 2019/12/18.
//  Copyright © 2019 gwl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, SPHorizontalButtonType) {
    SPHorizontalButtonTypeLeftImageRightTitle    = 1 << 2,
    SPHorizontalButtonTypeRightImageLeftTitle    = 1 << 3,
};

typedef NS_ENUM(NSInteger, SPVerticalButtonType) {
    SPVerticalButtonTypeTopImageBottomTitle      = 1 << 5,
    SPVerticalButtonTypeBottomImageTopTitle      = 1 << 6,
};

/// 控件布局以图片为基准
@interface SPCustomButton : UIButton

/// 图片和文字水平
/// @param type SPHorizontalButtonType 类型
/// @param isAutoWidth button固定高度，一行显示文字，是否根据文字长度自动更改button长度，YES 时 titleWidth 和 titleHeight 设置无效
+ (instancetype)sp_horizontalButton:(SPHorizontalButtonType)type isAutoWidth:(BOOL)isAutoWidth;

/// 图片和文字垂直
/// @param type SPVerticalButtonType 类型
/// @param isAutoHeight button固定宽度，是否根据文字高度自动更改button高度，YES 时 titleWidth 和 titleHeight 设置无效
+ (instancetype)sp_verticalButton:(SPVerticalButtonType)type isAutoHeight:(BOOL)isAutoHeight;

/// 图片和文字居中
+ (instancetype)sp_centerButton;


/// 图片的宽度 (必须与 imageHeight 成对出现)
@property (assign, nonatomic) CGFloat imageWidth;

/// 图片的高度 (必须与 imageWidth 成对出现)
@property (assign, nonatomic) CGFloat imageHeight;

/// 文字的宽度 (必须与 titleHeight 成对出现)
@property (assign, nonatomic) CGFloat titleWidth;

/// 文字的高度 (必须与 titleWidth 成对出现)
@property (assign, nonatomic) CGFloat titleHeight;


#pragma mark - 以下属性对使用 sp_centerButton 方法创建的 button 设置不生效

/// 图片和文字之间的间距，在无图片或无文字时等于0
@property (assign, nonatomic) CGFloat imageTitleSpacing;

/// 默认为图片初始位置的间距，无图片时则为文字初始位置的间距
@property (assign, nonatomic) CGFloat initialPositionSpacing;

/// 默认为文字的结束位置的间距，无文字时则为图片结束位置的间距。设置此属性则 isAutoHeight 或 isAutoWidth 变为 YES
@property (assign, nonatomic) CGFloat endPositionSpacing;

@end

NS_ASSUME_NONNULL_END
