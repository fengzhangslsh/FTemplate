//
//  UIImageView+Ext.h
//  FTemplate
//
//  Created by Jack on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Ext)
- (UIImageView *(^)(UIImage *img))fImg;
- (UIImageView *(^)(NSString *imgName))fImgName;
@end

NS_ASSUME_NONNULL_END
