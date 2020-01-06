//
//  GWLCustomButton.m
//  GWLCustomButton
//
//  Created by gwl on 2019/12/18.
//  Copyright © 2019 gwl. All rights reserved.
//

#import "GWLCustomButton.h"

@interface GWLCustomButton ()

@property (assign, nonatomic) BOOL isVertical;
@property (assign, nonatomic) BOOL isAutomaticHeight;
@property (assign, nonatomic) VerticalButtonType verticalButtonType;

@property (assign, nonatomic) BOOL isHorizontal;
@property (assign, nonatomic) BOOL isAutomaticWidth;
@property (assign, nonatomic) HorizontalButtonType horizontalButtonType;

@property (assign, nonatomic) BOOL isCenter;

@end

@implementation GWLCustomButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return self;
}

+ (instancetype)gwl_verticalButton:(VerticalButtonType)type isAutomaticHeight:(BOOL)isAutomaticHeight {
    GWLCustomButton *customButton = [GWLCustomButton buttonWithType:UIButtonTypeCustom];
    customButton.isVertical = YES;
    customButton.verticalButtonType = type;
    customButton.isAutomaticHeight = isAutomaticHeight;
    return customButton;
}
+ (instancetype)gwl_horizontalButton:(HorizontalButtonType)type isAutomaticWidth:(BOOL)isAutomaticWidth {
    GWLCustomButton *customButton = [GWLCustomButton buttonWithType:UIButtonTypeCustom];
    customButton.isHorizontal = YES;
    customButton.horizontalButtonType = type;
    customButton.isAutomaticWidth = isAutomaticWidth;
    return customButton;
}
+ (instancetype)gwl_centerButton {
    GWLCustomButton *customButton = [GWLCustomButton buttonWithType:UIButtonTypeCustom];
    customButton.isCenter = YES;
    return customButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.isVertical) {//垂直
        if (self.verticalButtonType == VerticalButtonTypeTopImageBottomTitle) {
            [self verticalButtonTopImageBottomTitle];
        } else if (self.verticalButtonType == VerticalButtonTypeBottomImageTopTitle) {
            [self verticalButtonBottomImageTopTitle];
        }
    } else if (self.isHorizontal) {//水平
        if (self.horizontalButtonType == HorizontalButtonTypeLeftImageRightTitle) {
            [self horizontalButtonLeftImageRightTitle];
        } else if (self.horizontalButtonType == HorizontalButtonTypeRightImageLeftTitle) {
            [self horizontalButtonRightImageLeftTitle];
        }
    } else if (self.isCenter) {//中心
        [self centerButtonCenterImageCenterTitle];
    }
}

#pragma mark - 右图左文字
- (void)horizontalButtonRightImageLeftTitle {
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    
    if (self.isAutomaticWidth) {
        self.titleWidth = 0;
        self.titleHeight = 0;
    }
    
    CGRect selfRect = self.frame;
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;
    
    if (imageRect.size.width != 0 || imageRect.size.height != 0) {
        if (self.imageWidth == 0 || self.imageHeight == 0) {
            imageRect.size.width = self.frame.size.height < self.frame.size.width ? self.frame.size.height : self.frame.size.width;
            imageRect.size.height = imageRect.size.width;
            imageRect.origin.x = self.frame.size.width - imageRect.size.width - self.initialPositionSpacing;
            imageRect.origin.y = 0;
        } else {
            imageRect.size.width = self.imageWidth;
            imageRect.size.height = self.imageHeight;
            imageRect.origin.x = self.frame.size.width - imageRect.size.width - self.initialPositionSpacing;
            imageRect.origin.y = (self.frame.size.height - imageRect.size.height) * 0.5;
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    if (titleRect.size.height != 0) {
        if (self.titleWidth == 0 || self.titleHeight == 0) {
            titleRect.size.width = ceil([self.titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, titleRect.size.height)].width);
            titleRect.size.height = self.frame.size.height;
            titleRect.origin.x = (self.frame.size.width - titleRect.size.width - imageRect.size.width - self.imageTitleSpacing - self.initialPositionSpacing);
            titleRect.origin.y = (self.frame.size.height - titleRect.size.height) * 0.5;
        } else {
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
            titleRect.origin.x = (self.frame.size.width - titleRect.size.width - imageRect.size.width - self.imageTitleSpacing - self.initialPositionSpacing);
            titleRect.origin.y = (self.frame.size.height - titleRect.size.height) * 0.5;
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    if (self.isAutomaticWidth) {
        selfRect.size.width = self.imageTitleSpacing + imageRect.size.width + titleRect.size.width + self.initialPositionSpacing;
        self.frame = selfRect;
    }
}
#pragma mark - 左图右文字
- (void)horizontalButtonLeftImageRightTitle {
    CGRect selfRect = self.frame;
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;
    
    if (self.isAutomaticWidth) {
        self.titleWidth = 0;
        self.titleHeight = 0;
    }
    
    if (imageRect.size.width != 0 || imageRect.size.height != 0) {
        if (self.imageWidth == 0 || self.imageHeight == 0) {
            imageRect.size.width = self.frame.size.height < self.frame.size.width ? self.frame.size.height : self.frame.size.width;
            imageRect.size.height = imageRect.size.width;
            imageRect.origin.x = self.initialPositionSpacing;
            imageRect.origin.y = 0;
        } else {
            imageRect.size.width = self.imageWidth;
            imageRect.size.height = self.imageHeight;
            imageRect.origin.x = self.initialPositionSpacing;
            imageRect.origin.y = (self.frame.size.height - imageRect.size.height) * 0.5;
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    if (titleRect.size.height != 0) {
        if (self.titleWidth == 0 || self.titleHeight == 0) {
            titleRect.size.width = ceil([self.titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, titleRect.size.height)].width);
            titleRect.size.height = self.frame.size.height;
            titleRect.origin.x = imageRect.size.width + self.imageTitleSpacing + self.initialPositionSpacing;
            titleRect.origin.y = 0;
        } else {
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
            titleRect.origin.x = imageRect.size.width + self.imageTitleSpacing + self.initialPositionSpacing;
            titleRect.origin.y = (self.frame.size.height - titleRect.size.height) * 0.5;
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    if (self.isAutomaticWidth) {
        selfRect.size.width = self.imageTitleSpacing + imageRect.size.width + titleRect.size.width + self.initialPositionSpacing;
        self.frame = selfRect;
    }
}
#pragma mark - 下图上文字
- (void)verticalButtonBottomImageTopTitle {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    
    if (self.isAutomaticHeight) {
        self.titleWidth = 0;
        self.titleHeight = 0;
    }
    
    CGRect selfRect = self.frame;
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;
    
    if (imageRect.size.width != 0 || imageRect.size.height != 0) {
        if (self.imageWidth == 0 || self.imageHeight == 0) {
            imageRect.size.width = self.frame.size.height < self.frame.size.width ? self.frame.size.height : self.frame.size.width;
            imageRect.size.height = imageRect.size.width;
            imageRect.origin.x = (self.frame.size.width - imageRect.size.width) * 0.5;
            imageRect.origin.y = self.frame.size.height - imageRect.size.height - self.initialPositionSpacing;
        } else {
            imageRect.size.width = self.imageWidth;
            imageRect.size.height = self.imageHeight;
            imageRect.origin.x = (self.frame.size.width - imageRect.size.width) * 0.5;
            imageRect.origin.y = self.frame.size.height - imageRect.size.height - self.initialPositionSpacing;
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    if (titleRect.size.height != 0) {
        if (self.titleWidth == 0 || self.titleHeight == 0) {
            titleRect.size.width = self.frame.size.width;
            titleRect.size.height = ceil([self.titleLabel sizeThatFits:CGSizeMake(titleRect.size.width, MAXFLOAT)].height);
            titleRect.origin.x = 0;
            titleRect.origin.y = self.frame.size.height - imageRect.size.height - self.imageTitleSpacing - self.initialPositionSpacing - titleRect.size.height;
        } else {
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
            titleRect.origin.x = (self.frame.size.width - titleRect.size.width) * 0.5;
            titleRect.origin.y = self.frame.size.height - imageRect.size.height - self.imageTitleSpacing - self.initialPositionSpacing - titleRect.size.height;
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    if (self.isAutomaticHeight) {
        selfRect.size.height = imageRect.size.height + titleRect.size.height + self.imageTitleSpacing + self.initialPositionSpacing;
        self.frame = selfRect;
    }
}
#pragma mark - 上图下文字
- (void)verticalButtonTopImageBottomTitle {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    
    if (self.isAutomaticHeight) {
        self.titleWidth = 0;
        self.titleHeight = 0;
    }
    
    CGRect selfRect = self.frame;
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;
    
    if (imageRect.size.width != 0 || imageRect.size.height != 0) {
        if (self.imageWidth == 0 || self.imageHeight == 0) {
            imageRect.size.width = self.frame.size.height < self.frame.size.width ? self.frame.size.height : self.frame.size.width;
            imageRect.size.height = imageRect.size.width;
            imageRect.origin.x = (self.frame.size.width - imageRect.size.width) * 0.5;
            imageRect.origin.y = self.initialPositionSpacing;
        } else {
            imageRect.size.width = self.imageWidth;
            imageRect.size.height = self.imageHeight;
            imageRect.origin.x = (self.frame.size.width - imageRect.size.width) * 0.5;
            imageRect.origin.y = self.initialPositionSpacing;
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    if (titleRect.size.height != 0) {
        if (self.titleWidth == 0 || self.titleHeight == 0) {
            titleRect.size.width = self.frame.size.width;
            titleRect.size.height = ceil([self.titleLabel sizeThatFits:CGSizeMake(titleRect.size.width, MAXFLOAT)].height);
            titleRect.origin.x = 0;
            titleRect.origin.y = imageRect.size.height + self.imageTitleSpacing + self.initialPositionSpacing;
        } else {
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
            titleRect.origin.x = (self.frame.size.width - titleRect.size.width) * 0.5;
            titleRect.origin.y = imageRect.size.height + self.imageTitleSpacing + self.initialPositionSpacing;
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    if (self.isAutomaticHeight) {
        selfRect.size.height = self.imageTitleSpacing + imageRect.size.height + titleRect.size.height + self.initialPositionSpacing;
        self.frame = selfRect;
    }
}
#pragma mark - 图和文字都居中
- (void)centerButtonCenterImageCenterTitle {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;
    
    if (self.imageWidth == 0 || self.imageHeight == 0) {
        imageRect = self.bounds;
    } else {
        imageRect.size.width = self.imageWidth;
        imageRect.size.height = self.imageHeight;
        imageRect.origin.x = (self.frame.size.width - imageRect.size.width) * 0.5;
        imageRect.origin.y = (self.frame.size.height - imageRect.size.height) * 0.5;
    }
    
    if (self.titleWidth == 0 || self.titleHeight == 0) {
        titleRect = self.bounds;
    } else {
        titleRect.size.width = self.titleWidth;
        titleRect.size.height = self.titleHeight;
        titleRect.origin.x = (self.frame.size.width - titleRect.size.width) * 0.5;
        titleRect.origin.y = (self.frame.size.height - titleRect.size.height) * 0.5;
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
}

@end

