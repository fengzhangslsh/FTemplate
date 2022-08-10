//
//  UILabel+Ext.m
//  FTTool
//
//  Created by Jack on 2022/8/2.
//

#import "UILabel+Ext.h"

@implementation UILabel (Ext)

- (UILabel *(^)(UIFont *font))fFont{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(NSString *text))fText{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(NSInteger lines))fLines{
    return ^(NSInteger lines){
        self.numberOfLines = lines;
        return self;
    };
}
- (UILabel *(^)(UIColor *color))fTextColor
{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment align))fTextAlign
{
    return ^(NSTextAlignment align){
        self.textAlignment = align;
        return self;
    };
}

@end
