//
//  UITextField+Ext.h
//  template
//
//  Created by Jack on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Ext)

- (UITextField *(^)(NSString *text))fText;
- (UITextField *(^)(UIColor *color))fColor;
- (UITextField *(^)(UIFont *font))fFont;
- (UITextField *(^)(NSString *hint))fHint;
/// 必须先设定hitn再设置hint颜色
- (UITextField *(^)(UIColor *hintColor))fHintColor;

@property(readonly,nullable,strong)UIFont *hintFont;

@property(readonly,nullable,strong)UIColor *hintColor;

@end

NS_ASSUME_NONNULL_END
