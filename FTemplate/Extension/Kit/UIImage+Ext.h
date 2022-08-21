//
//  UIImage+Ext.h
//  NIM
//
//  Created by Jack on 2022/8/21.
//  Copyright © 2022 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Ext)
/// 纯色图片
+ (UIImage *)imageWithColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
