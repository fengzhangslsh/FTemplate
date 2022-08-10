//
//  UIView+Ext.h
//
//  Created by Jack on 2022/8/2.
//

#import <UIKit/UIKit.h>
#import "FTDefine.h"
NS_ASSUME_NONNULL_BEGIN
@interface UIView (Ext)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat rightX;
@property (nonatomic, assign) CGFloat bottomY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;


/// frame
- (UIView *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))fFrame;

/// 背景颜色
- (UIView *(^)(UIColor *color))fBgColor;

/// 圆角
- (UIView *(^)(CGFloat radius))fRadius;

/// 设置边框
- (UIView *(^)(CGFloat width,UIColor *borderColor))fBorder;

/// 添加点击方法
- (UIView *(^)(CallBackBlock1 clickblock))fAddClick;

- (void)bindData:(id)data;


- (void)viewAnimationBlowWithDuration:(NSTimeInterval)dur;
@end

NS_ASSUME_NONNULL_END
