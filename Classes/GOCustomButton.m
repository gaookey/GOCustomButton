//
//  GOCustomButton.m
//  GOCustomButton
//
//  Created by 高文立 on 2019/12/18.
//

#import "GOCustomButton.h"

@interface GOCustomButton ()

@property (assign, nonatomic) BOOL isVertical;
@property (assign, nonatomic) BOOL isAutoHeight;
@property (assign, nonatomic) GOVerticalButtonType verticalButtonType;

@property (assign, nonatomic) BOOL isHorizontal;
@property (assign, nonatomic) BOOL isAutoWidth;
@property (assign, nonatomic) GOHorizontalButtonType horizontalButtonType;

@property (assign, nonatomic) BOOL isCenter;

@end

@implementation GOCustomButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return self;
}

+ (instancetype)go_verticalButton:(GOVerticalButtonType)type isAutoHeight:(BOOL)isAutoHeight {
    GOCustomButton *customButton = [GOCustomButton buttonWithType:UIButtonTypeCustom];
    customButton.isVertical = YES;
    customButton.verticalButtonType = type;
    customButton.isAutoHeight = isAutoHeight;
    return customButton;
}
+ (instancetype)go_horizontalButton:(GOHorizontalButtonType)type isAutoWidth:(BOOL)isAutoWidth {
    GOCustomButton *customButton = [GOCustomButton buttonWithType:UIButtonTypeCustom];
    customButton.isHorizontal = YES;
    customButton.horizontalButtonType = type;
    customButton.isAutoWidth = isAutoWidth;
    return customButton;
}
+ (instancetype)go_centerButton {
    GOCustomButton *customButton = [GOCustomButton buttonWithType:UIButtonTypeCustom];
    customButton.isCenter = YES;
    return customButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.isVertical) {//垂直
        if (self.verticalButtonType == SPVerticalButtonTypeTopImageBottomTitle) {
            [self verticalButtonTopImageBottomTitle];
        } else if (self.verticalButtonType == SPVerticalButtonTypeBottomImageTopTitle) {
            [self verticalButtonBottomImageTopTitle];
        }
    } else if (self.isHorizontal) {//水平
        if (self.horizontalButtonType == SPHorizontalButtonTypeLeftImageRightTitle) {
            [self horizontalButtonLeftImageRightTitle];
        } else if (self.horizontalButtonType == SPHorizontalButtonTypeRightImageLeftTitle) {
            [self horizontalButtonRightImageLeftTitle];
        }
    } else if (self.isCenter) {//中心
        [self centerButtonCenterImageCenterTitle];
    }
}

#pragma mark - 右图左文字
- (void)horizontalButtonRightImageLeftTitle {
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    
    if (self.isAutoWidth) {
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
            imageRect.origin.x = (self.frame.size.width - imageRect.size.width - self.initialPositionSpacing);
            imageRect.origin.y = 0;
        } else {
            imageRect.size.width = self.imageWidth;
            imageRect.size.height = self.imageHeight;
            imageRect.origin.x = (self.frame.size.width - imageRect.size.width - self.initialPositionSpacing);
            imageRect.origin.y = (self.frame.size.height - imageRect.size.height) * 0.5;
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    if (titleRect.size.height != 0) {
        if (self.titleWidth == 0 || self.titleHeight == 0) {
            titleRect.size.width = ceil([self.titleLabel sizeThatFits:CGSizeMake(MAXFLOAT, titleRect.size.height)].width);
            titleRect.size.height = self.frame.size.height;
            titleRect.origin.x = (self.frame.size.width - imageRect.size.width - titleRect.size.width - self.imageTitleSpacing - self.initialPositionSpacing);
            titleRect.origin.y = (self.frame.size.height - titleRect.size.height) * 0.5;
        } else {
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
            titleRect.origin.x = (self.frame.size.width - imageRect.size.width - titleRect.size.width - self.imageTitleSpacing - self.initialPositionSpacing);
            titleRect.origin.y = (self.frame.size.height - titleRect.size.height) * 0.5;
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    if (self.endPositionSpacing > 0) {
        self.isAutoWidth = YES;
    }
    
    if (self.isAutoWidth) {
        selfRect.size.width = imageRect.size.width + titleRect.size.width + self.imageTitleSpacing + self.initialPositionSpacing + self.endPositionSpacing;
        self.frame = selfRect;
    }
}
#pragma mark - 左图右文字
- (void)horizontalButtonLeftImageRightTitle {
    CGRect selfRect = self.frame;
    CGRect imageRect = self.imageView.frame;
    CGRect titleRect = self.titleLabel.frame;
    
    if (self.isAutoWidth) {
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
            titleRect.origin.x = (imageRect.size.width + self.imageTitleSpacing + self.initialPositionSpacing);
            titleRect.origin.y = 0;
        } else {
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
            titleRect.origin.x = (imageRect.size.width + self.imageTitleSpacing + self.initialPositionSpacing);
            titleRect.origin.y = (self.frame.size.height - titleRect.size.height) * 0.5;
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    if (self.endPositionSpacing > 0) {
        self.isAutoWidth = YES;
    }
    
    if (self.isAutoWidth) {
        selfRect.size.width = imageRect.size.width + titleRect.size.width + self.imageTitleSpacing + self.initialPositionSpacing + self.endPositionSpacing;
        self.frame = selfRect;
    }
}
#pragma mark - 下图上文字
- (void)verticalButtonBottomImageTopTitle {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    
    if (self.isAutoHeight) {
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
            imageRect.origin.y = (self.frame.size.height - imageRect.size.height - self.initialPositionSpacing);
        } else {
            imageRect.size.width = self.imageWidth;
            imageRect.size.height = self.imageHeight;
            imageRect.origin.x = (self.frame.size.width - imageRect.size.width) * 0.5;
            imageRect.origin.y = (self.frame.size.height - imageRect.size.height - self.initialPositionSpacing);
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    if (titleRect.size.height != 0) {
        if (self.titleWidth == 0 || self.titleHeight == 0) {
            titleRect.size.width = self.frame.size.width;
            titleRect.size.height = ceil([self.titleLabel sizeThatFits:CGSizeMake(titleRect.size.width, MAXFLOAT)].height);
            titleRect.origin.x = 0;
            titleRect.origin.y = (self.frame.size.height - imageRect.size.height - titleRect.size.height - self.imageTitleSpacing - self.initialPositionSpacing);
        } else {
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
            titleRect.origin.x = (self.frame.size.width - titleRect.size.width) * 0.5;
            titleRect.origin.y = (self.frame.size.height - imageRect.size.height - titleRect.size.height - self.imageTitleSpacing - self.initialPositionSpacing);
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    if (self.endPositionSpacing > 0) {
        self.isAutoHeight = YES;
    }
    
    if (self.isAutoHeight) {
        selfRect.size.height = imageRect.size.height + titleRect.size.height + self.imageTitleSpacing + self.initialPositionSpacing + self.endPositionSpacing;
        self.frame = selfRect;
    }
}
#pragma mark - 上图下文字
- (void)verticalButtonTopImageBottomTitle {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    
    if (self.isAutoHeight) {
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
            titleRect.origin.y = (imageRect.size.height + self.imageTitleSpacing + self.initialPositionSpacing);
        } else {
            titleRect.size.width = self.titleWidth;
            titleRect.size.height = self.titleHeight;
            titleRect.origin.x = (self.frame.size.width - titleRect.size.width) * 0.5;
            titleRect.origin.y = (imageRect.size.height + self.imageTitleSpacing + self.initialPositionSpacing);
        }
    } else {
        self.imageTitleSpacing = 0;
    }
    
    self.imageView.frame = imageRect;
    self.titleLabel.frame = titleRect;
    
    if (self.endPositionSpacing > 0) {
        self.isAutoHeight = YES;
    }
    
    if (self.isAutoHeight) {
        selfRect.size.height = imageRect.size.height + titleRect.size.height + self.imageTitleSpacing + self.initialPositionSpacing + self.endPositionSpacing;
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

