//
//  UILabel+Ext.h
//  FTTool
//
//  Created by Jack on 2022/8/2.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
@interface UILabel (Ext)

- (UILabel *(^)(UIFont *font))fFont;

- (UILabel *(^)(NSString *text))fText;

- (UILabel *(^)(UIColor *color))fTextColor;

- (UILabel *(^)(NSTextAlignment align))fTextAlign;

- (UILabel *(^)(NSInteger lines))fLines;

@end


NS_ASSUME_NONNULL_END
