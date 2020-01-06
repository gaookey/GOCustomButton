//
//  GWLCustomButton.h
//  GWLCustomButton
//
//  Created by gwl on 2019/12/18.
//  Copyright © 2019 gwl. All rights reserved.
//

/**
 控件布局以图片为基准
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, HorizontalButtonType) {
    HorizontalButtonTypeLeftImageRightTitle    = 1 << 2,//左图右文字
    HorizontalButtonTypeRightImageLeftTitle    = 1 << 3,//右图左文字
};
typedef NS_ENUM(NSInteger, VerticalButtonType) {
    VerticalButtonTypeTopImageBottomTitle      = 1 << 5,//上图下文字
    VerticalButtonTypeBottomImageTopTitle      = 1 << 6,//下图上文字
};

@interface GWLCustomButton : UIButton

#pragma mark - method

/// 图片和文字水平居中
/// @param type HorizontalButtonType 类型
/// @param isAutomaticWidth button固定高度，一行显示文字，是否根据文字长度自动更改button长度，YES 时 titleWidth 和 titleHeight 设置无效
+ (instancetype)gwl_horizontalButton:(HorizontalButtonType)type isAutomaticWidth:(BOOL)isAutomaticWidth;

/// 图片和文字垂直居中
/// @param type VerticalButtonType 类型
/// @param isAutomaticHeight button固定宽度，是否根据文字高度自动更改button高度，YES 时 titleWidth 和 titleHeight 设置无效
+ (instancetype)gwl_verticalButton:(VerticalButtonType)type isAutomaticHeight:(BOOL)isAutomaticHeight;

/// 图片和文字居中
+ (instancetype)gwl_centerButton;

#pragma mark - property

/**
 图片的宽度 (必须与 imageHeight 成对出现)
 */
@property (assign, nonatomic) CGFloat imageWidth;
/**
 图片的高度 (必须与 imageWidth 成对出现)
 */
@property (assign, nonatomic) CGFloat imageHeight;
/**
 文字的宽度 (必须与 titleHeight 成对出现)
 */
@property (assign, nonatomic) CGFloat titleWidth;
/**
 文字的高度 (必须与 titleWidth 成对出现)
 */
@property (assign, nonatomic) CGFloat titleHeight;


#pragma mark - 以下属性对使用 gwl_centerButton 方法创建的 button 设置不生效

/**
 图片和文字之间的间距，在无图片或无文字时等于0
 */
@property (assign, nonatomic) CGFloat imageTitleSpacing;
/**
 默认为图片初始位置的间距，无图片时则为文字初始位置的间距
 */
@property (assign, nonatomic) CGFloat initialPositionSpacing;
/**
 默认为文字的结束位置的间距，无文字时则为图片结束位置的间距。设置此属性则 isAutomaticHeight 或 isAutomaticWidth 变为 YES
 */
@property (assign, nonatomic) CGFloat endPositionSpacing;

@end

NS_ASSUME_NONNULL_END
