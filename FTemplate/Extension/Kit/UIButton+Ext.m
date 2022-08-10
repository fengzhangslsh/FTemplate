//
//  UIButton+Ext.m
//  FTTool
//
//  Created by Jack on 2022/8/2.
//

#import "UIButton+Ext.h"

@implementation UIButton (Ext)

- (UIButton *(^)(UIFont *font))fFont{
    return ^(UIFont *font){
        self.titleLabel.font = font;
        return self;
    };
}

- (UIButton *(^)(NSString *title))fText{
    return ^(NSString *title){
        
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(NSString *title,UIControlState state))fTextByState{
    
    return ^(NSString *title,UIControlState state){
        
        [self setTitle:title forState:state];
        return self;
    };
}
- (UIButton *(^)(UIColor *color))fTextColor{
    return ^(UIColor *color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
    
}
- (UIButton *(^)(UIColor *color,UIControlState state))fTextColorByState{
    return ^(UIColor *color,UIControlState state){
        [self setTitleColor:color forState:state];
        return self;
    };
}

- (UIButton *(^)(UIImage *img))fImg{
    return ^(UIImage *img){
        [self setImage:img forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(UIImage *img,UIControlState state))fImgByState{
    return ^(UIImage *img,UIControlState state){
        [self setImage:img forState:state];
        return self;
    };
}
- (UIButton *(^)(NSString *imgName))fImgName{
    return ^(NSString *imgName){
        [self setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(NSString *imgName,UIControlState state))fImgNameByState{
    return ^(NSString *imgName,UIControlState state){
        [self setImage:[UIImage imageNamed:imgName] forState:state];
        return self;
    };
}

- (UIButton *(^)(UIImage *img))fBgImg{
    return ^(UIImage *img){
        [self setBackgroundImage:img forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(UIImage *img,UIControlState state))fBgImgByState{
    return ^(UIImage *img,UIControlState state){
        [self setBackgroundImage:img forState:state];
        return self;
    };
}
- (UIButton *(^)(NSString *imgName))fBgImgName{
    return ^(NSString *imgName){
        [self setBackgroundImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(NSString *imgName,UIControlState state))fBgImgNameByState{
    return ^(NSString *imgName,UIControlState state){
        [self setBackgroundImage:[UIImage imageNamed:imgName] forState:state];
        return self;
    };
}
@end
