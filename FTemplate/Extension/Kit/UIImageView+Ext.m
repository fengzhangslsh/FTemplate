//
//  UIImageView+Ext.m
//  FTemplate
//
//  Created by Jack on 2022/8/2.
//

#import "UIImageView+Ext.h"

@implementation UIImageView (Ext)

- (UIImageView *(^)(UIImage *img))fImg{
    return ^(UIImage *img){
        self.image = img;
        return self;
    };
}
- (UIImageView *(^)(NSString *imgName))fImgName{
    return ^(NSString *imgName){
        self.image = [UIImage imageNamed:imgName];
        return self;
    };
}
@end
