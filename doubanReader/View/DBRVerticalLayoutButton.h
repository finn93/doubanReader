//
//  DBRVerticalLayoutButton.h
//  doubanReader
//
//  Created by wangshuang on 2017/5/16.
//  Copyright © 2017年 wangshuang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBRVerticalLayoutButton : UIButton

typedef NS_ENUM(int16_t, EImageShape) {
    EImageShapeRectangular = 0,
    EImageShapeCircular
};

/**
 *  构造垂直布局按钮
 *
 *  @param frame        按钮frame
 *  @param imageSize    图片size
 *  @param edgMargin    边缘间距(顶部间距)
 *  @param centerMargin 中部间距(图片与文字间间距)
 *
 *  @return 一个合格的按钮
 */
- (instancetype)initWithFrame:(CGRect)frame imageSize:(CGSize)imageSize imageShape:(EImageShape)imageShape edgMargin:(CGFloat)edgMargin centerMargin:(CGFloat)centerMargin;

@end
