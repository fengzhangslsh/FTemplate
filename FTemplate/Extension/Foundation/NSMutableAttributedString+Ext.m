//
//  NSMutableAttributedString+Ext.m
//  FTemplate
//
//  Created by Jack on 2022/8/2.
//

#import "NSMutableAttributedString+Ext.h"

@implementation NSMutableAttributedString (Ext)
+ (NSMutableAttributedString *(^)(NSString *text))fNew {
    return ^(NSString *text){
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:text];
        return attr;
    };
}
- (NSMutableAttributedString *(^)(UIFont *font,NSString *text))fFont {
    return ^(UIFont *font,NSString *text){
        NSRange rage = [self.string rangeOfString:text];
        [self addAttributes:@{NSFontAttributeName:font} range:rage];
        return self;
    };
}
- (NSMutableAttributedString *(^)(UIColor *color,NSString *text))fColor {
    return ^(UIColor *color,NSString *text){
        NSRange rage = [self.string rangeOfString:text];
        [self addAttributes:@{NSForegroundColorAttributeName:color} range:rage];
        return self;
    };
}
@end
//NSForegroundColorAttributeName
