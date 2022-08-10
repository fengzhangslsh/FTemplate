//
//  NSString+Ext.h
//  shiku_im
//
//  Created by Jack on 2022/8/10.
//  Copyright © 2022 Reese. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (Ext)

- (CGFloat)heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;

- (CGFloat)widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;
@end

NS_ASSUME_NONNULL_END
