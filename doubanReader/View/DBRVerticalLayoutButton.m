//
//  DBRVerticalLayoutButton.m
//  doubanReader
//
//  Created by wangshuang on 2017/5/16.
//  Copyright © 2017年 wangshuang. All rights reserved.
//

#import "DBRVerticalLayoutButton.h"

@interface DBRVerticalLayoutButton ()

@property (nonatomic, assign) CGFloat edgMargin;
@property (nonatomic, assign) CGFloat centerMargin;
@property (nonatomic, assign) CGSize imageSize;
@property (nonatomic, assign) EImageShape imageShape;

@end

@implementation DBRVerticalLayoutButton

- (instancetype)initWithFrame:(CGRect)frame imageSize:(CGSize)imageSize imageShape:(EImageShape)imageShape edgMargin:(CGFloat)edgMargin centerMargin:(CGFloat)centerMargin {
    if (self = [super initWithFrame:frame]) {
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        _imageSize = imageSize;
        _imageShape = imageShape;
        _edgMargin = edgMargin;
        _centerMargin = centerMargin;
//        self.imageView.backgroundColor = DBRRandomColor;
//        self.titleLabel.backgroundColor = DBRRandomColor;
//        self.backgroundColor = DBRRandomColor;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (_imageShape == EImageShapeCircular) {
        self.imageView.layer.cornerRadius = _imageSize.width * 0.5;
        self.imageView.clipsToBounds = YES;
    }
    
    // 调整图片的位置和尺寸
    if (!CGSizeEqualToSize(_imageSize, CGSizeZero)) {
        self.imageView.size = _imageSize;
    }
    self.imageView.top = _edgMargin;
    self.imageView.centerX = self.width * 0.5;
    
    // 调整文字的位置和尺寸
    [self.titleLabel sizeToFit];
    self.titleLabel.top = self.imageView.bottom + _centerMargin;
    self.titleLabel.centerX = self.width * 0.5;
}

@end
