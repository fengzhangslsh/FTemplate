//
//  NSMutableAttributedString+Ext.h
//  FTemplate
//
//  Created by Jack on 2022/8/2.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSMutableAttributedString (Ext)
+ (NSMutableAttributedString *(^)(NSString *text))fNew;
- (NSMutableAttributedString *(^)(UIFont *font,NSString *text))fFont;
- (NSMutableAttributedString *(^)(UIColor *color,NSString *text))fColor;
@end

NS_ASSUME_NONNULL_END
