//
//  UIView+Ext.m
//  FTTool
//
//  Created by Jack on 2022/8/2.
//

#import "UIView+Ext.h"

#import <objc/runtime.h>
DEFINE_CONST(Click_block_key)
DEFINE_CONST(Click_tap_key)

@implementation UIView (Ext)
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}

- (CGFloat)x
{
    return self.frame.origin.x;
}
#pragma mark Y
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

#pragma mark CenterX
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
- (CGFloat)centerX
{
    return self.center.x;
}
#pragma mark CenterY
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

#pragma mark RightX
- (void)setRightX:(CGFloat)rightX{
    
    CGRect frame = self.frame;
    frame.origin.x = rightX - frame.size.width;
    self.frame = frame;
    
    
}
- (CGFloat)rightX{
    return self.frame.origin.x + self.frame.size.width;
}
#pragma mark BottomY

- (void)setBottomY:(CGFloat)bottomY{
    
    CGRect fram = self.frame;
    fram.origin.y = bottomY - self.frame.size.height;
    self.frame = fram;
}
- (CGFloat)bottomY{
    
    return self.frame.origin.y + self.frame.size.height;
}
#pragma mark size
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

#pragma mark width
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width
{
    return self.frame.size.width;
}


#pragma mark height
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (CGFloat)height
{
    return self.frame.size.height;
}
- (void)bindData:(id)data{}
/// 设置frame
- (UIView *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))fFrame{
    return ^(CGFloat x,CGFloat y,CGFloat width,CGFloat height){
        CGRect frame = self.frame;
        frame.origin.x = x;
        frame.origin.y = y;
        frame.size.width = width;
        frame.size.height = height;
        self.frame = frame;
        return self;
    };
}


/// 设置背景颜色
- (UIView *(^)(UIColor *color))fBgColor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

/// 设置圆角
- (UIView *(^)(CGFloat radius))fRadius{
    return ^(CGFloat radius){
        [self.layer setCornerRadius:radius];
        [self.layer setMasksToBounds:YES];
        return self;
    };
}

/// 设置边框
- (UIView *(^)(CGFloat width,UIColor *borderColor))fBorder{
    return ^(CGFloat width,UIColor* borderColor){
        self.layer.borderColor = borderColor.CGColor;
        self.layer.borderWidth = width;
        return self;
    };
}

/// 添加点击方法
- (UIView *(^)(CallBackBlock1 clickblock))fAddClick{
    return ^(CallBackBlock1 clickblock){
        self.userInteractionEnabled = YES;
        
        /// 添加相同事件方法，，先将原来的事件移除，避免重复调用
        NSMutableArray *taps = [self allUIViewBlockTaps];
        [taps enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UITapGestureRecognizer *tap = (UITapGestureRecognizer *)obj;
            [self removeGestureRecognizer:tap];
        }];
        [taps removeAllObjects];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(invoke:)];
        [self addGestureRecognizer:tap];
        [taps addObject:tap];
        self.clickBlock = clickblock;
        return self;
    };
}
- (void)invoke:(id)sender
{
    fEXEC(self.clickBlock,sender);
}

- (NSMutableArray *)allUIViewBlockTaps
{
    NSMutableArray *taps = objc_getAssociatedObject(self, &Click_tap_key);
    if (!taps) {
        taps = [NSMutableArray array];
        objc_setAssociatedObject(self, &Click_block_key, taps, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return taps;
}
- (void)setClickBlock:(CallBackBlock1)clickBlock{
    objc_setAssociatedObject(self, &Click_block_key, clickBlock, OBJC_ASSOCIATION_COPY);
}

- (CallBackBlock1)clickBlock
{
    return objc_getAssociatedObject(self, &Click_block_key);
}



- (void)viewAnimationBlowWithDuration:(NSTimeInterval)dur{


    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration = dur;
    NSMutableArray *values = [[NSMutableArray alloc]init];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.8, 1.8, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 1.0)]];
    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
    animation.values = values;

    [self.layer addAnimation:animation forKey:nil];
}

@end
