//
//  GWLCustomButton.h
//  GWLCustomButton
//
//  Created by gwl on 2019/12/18.
//  Copyright © 2019 gwl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, GWLCustomButtonType) {
    GWLCustomButtonTypeCenterImageCenterTitle,//图和文字都居中
    GWLCustomButtonTypeTopImageBottomTitle,//上图下文字
    GWLCustomButtonTypeBottomImageTopTitle,//下图上文字
    GWLCustomButtonTypeLeftImageRightTitle,//左图右文字
    GWLCustomButtonTypeRightImageLeftTitle,//右图左文字
};
@interface GWLCustomButton : UIButton

/// 创建 CustomButton
+ (instancetype)gwl_customButton:(GWLCustomButtonType)type;
/// 更新 CustomButton
- (void)gwl_updateCustomButton:(GWLCustomButtonType)type;

/// CustomButton 类型
@property (assign, nonatomic) GWLCustomButtonType customButtonType;
/// 图片的宽度
@property (assign, nonatomic) CGFloat imageWidth;
/// 图片的高度
@property (assign, nonatomic) CGFloat imageHeight;
/// 文字的宽度
@property (assign, nonatomic) CGFloat titleWidth;
/// 文字的高度
@property (assign, nonatomic) CGFloat titleHeight;
/// 图片和文字的间距
@property (assign, nonatomic) CGFloat space;

@end

NS_ASSUME_NONNULL_END
