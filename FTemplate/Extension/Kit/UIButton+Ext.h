//
//  UIButton+Ext.h
//  FTTool
//
//  Created by Jack on 2022/8/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Ext)
- (UIButton *(^)(UIFont *font))fFont;


- (UIButton *(^)(UIColor *color))fTextColor;
- (UIButton *(^)(UIColor *color,UIControlState state))fTextColorByState;


- (UIButton *(^)(NSString *title))fText;
- (UIButton *(^)(NSString *title,UIControlState state))fTextByState;


- (UIButton *(^)(UIImage *img))fImg;
- (UIButton *(^)(UIImage *img,UIControlState state))fImgByState;
- (UIButton *(^)(NSString *imgName))fImgName;
- (UIButton *(^)(NSString *imgName,UIControlState state))fImgNameByState;

- (UIButton *(^)(UIImage *img))fBgImg;
- (UIButton *(^)(UIImage *img,UIControlState state))fBgImgByState;
- (UIButton *(^)(NSString *imgName))fBgImgName;
- (UIButton *(^)(NSString *imgName,UIControlState state))fBgImgNameByState;
@end

NS_ASSUME_NONNULL_END
