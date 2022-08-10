//
//  UITextField+Ext.m
//  FTemplate
//
//  Created by Jack on 2022/8/2.
//

#import "UITextField+Ext.h"
#import "NSMutableAttributedString+Ext.h"
#import <objc/runtime.h>
#import "FTDefine.h"

DEFINE_CONST(TF_STYLE_HINTFONT)
DEFINE_CONST(TF_STYLE_HINTCOLOR)


@implementation UITextField (Ext)

- (UITextField *(^)(NSString *text))fText {
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}
- (UITextField *(^)(UIColor *color))fColor {
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}
- (UITextField *(^)(UIFont *font))fFont{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}
- (UITextField *(^)(NSString *hint))fHint {
    return ^(NSString *hint){
        self.placeholder = hint;
        return self;
    };
}
/// 必须先设定hitn再设置hint颜色
- (UITextField *(^)(UIColor *hintColor))fHintColor {
    return ^(UIColor *hintColor){
        if (self.placeholder.length == 0) {
            return self;
        }
        
        return self;
    };
}

- (void)setHintFont:(UIFont *)hintFont {
    objc_setAssociatedObject(self, &TF_STYLE_HINTFONT, hintFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateHintStyle];
}
- (UIFont *)hintFont {
    return objc_getAssociatedObject(self, &TF_STYLE_HINTFONT);
}
- (void)setHintColor:(UIColor *)hintColor {
    objc_setAssociatedObject(self, &TF_STYLE_HINTCOLOR, hintColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self updateHintStyle];
}
- (UIColor *)hintColor {
    return objc_getAssociatedObject(self, &TF_STYLE_HINTCOLOR);
}
- (void)updateHintStyle {
    if (self.placeholder.length == 0) {
        return;
    }
    NSMutableAttributedString *attr = NSMutableAttributedString.fNew(self.placeholder);
    if (self.hintFont != nil) {
        attr.fFont(self.hintFont,self.placeholder);
    }
    if (self.hintColor != nil) {
        attr.fColor(self.hintColor,self.placeholder);
    }
}
@end
