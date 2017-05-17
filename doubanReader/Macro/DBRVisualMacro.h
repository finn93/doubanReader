//
//  DBRVisualMacro.h
//  doubanReader
//
//  Created by wangshuang on 2017/5/16.
//  Copyright © 2017年 wangshuang. All rights reserved.
//

#ifndef DBRVisualMacro_h
#define DBRVisualMacro_h

// Font
#define SYSTEM_BLOD_FONT(s)     [UIFont boldSystemFontOfSize:s]
#define SYSTEM_DEFAULT_FONT(s)  [UIFont systemFontOfSize:s]

// Color
#define DBRRandomColor [UIColor colorWithHue:(arc4random() % 256 / 256.0) saturation:((arc4random() % 128 / 256.0) + 0.5) brightness:((arc4random() % 128 / 256.0) + 0.5) alpha:1]

#endif /* DBRVisualMacro_h */
