//
//  FTToast.m
//  shiku_im
//
//  Created by Jack on 2022/8/10.
//  Copyright © 2022 Reese. All rights reserved.
//

#import "FTToast.h"
#import "FTDefine.h"
#import "NSString+Ext.h"
#import "UIView+Ext.h"
@interface FTToast()
@property(nonatomic,strong)NSTimer *fadeOutTimer;
@property(nonatomic,weak)UILabel *titlelb;
@end
@implementation FTToast
static FTToast *instance_toast = nil;
+ (instancetype)share{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_toast = [[self alloc]init];
    });
    return instance_toast;
}
- (instancetype)init
{
    if (self = [super init]) {
        
        self.layer.cornerRadius = 5;
        self.layer.masksToBounds = true;
        self.hidden = true;
        self.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.8];
        UILabel *titlelb = [UILabel new];
        titlelb.font = fFontN(15);
        titlelb.numberOfLines = 0;
        titlelb.textAlignment = NSTextAlignmentCenter;
        titlelb.textColor = UIColor.whiteColor;
        [self addSubview:titlelb];
        self.titlelb = titlelb;
        
    }
    return self;
}
//设置定时器
- (void)setFadeOutTimer:(NSTimer *)fadeOutTimer{
    if (_fadeOutTimer != nil) {
        [_fadeOutTimer invalidate];
        _fadeOutTimer = nil;
    }
    if (fadeOutTimer != nil) {
        _fadeOutTimer = fadeOutTimer;
    }
    
}
//出现
+ (void)showInfo:(NSString *)info{
    if (fIsEmptyStr(info)) {
        return;
    }
    UIWindow *view = [[[UIApplication sharedApplication] delegate] window];
    NSArray *windows = [UIApplication sharedApplication].windows;
    for (id windowView in windows) {
        NSString *viewName = NSStringFromClass([windowView class]);
        if ([@"UIRemoteKeyboardWindow" isEqualToString:viewName]) {
            view = windowView;
            break;
        }
    }
    [view addSubview:[self share]];
    [[self share]showInfo:info andTimeInterval:[self displayDurationFor:info]];
}

- (void)showInfo:(NSString *)status andTimeInterval:(NSTimeInterval)dur{
    
    self.titlelb.text = status;
    CGFloat width = [status widthWithFont:fFontN(15) constrainedToHeight:20] + 20;
    
    if (width > fScreentWidth - 100) {
        width = fScreentWidth - 100;
    }
    
    CGFloat height = [status heightWithFont:fFontN(15) constrainedToWidth:fScreentWidth - 100] + 10;
    self.frame = CGRectMake((fScreentWidth - width)/2, fScreentHeight - height - 64, width, height);
    self.titlelb.frame = self.bounds;
    if (self.hidden) {
        [self viewAnimationBlowWithDuration:0.5];
    }
    
    self.hidden = false;
    fWeakSelf(self);

    dispatch_async(dispatch_get_main_queue(), ^{
        
        weakself.fadeOutTimer = [NSTimer timerWithTimeInterval:dur target:self selector:@selector(diss) userInfo:nil repeats:NO];
        
        [[NSRunLoop mainRunLoop] addTimer:weakself.fadeOutTimer forMode:NSRunLoopCommonModes];
        
    });
    
}
//隐藏
- (void)diss{
    self.hidden = true;
    [self removeFromSuperview];
}
//返回出现时间
+ (NSTimeInterval)displayDurationFor:(NSString *)string{
    NSTimeInterval minDuration = MAX(string.length * 0.06 + 0.5, 1.5);
    return MIN(minDuration, 8.0);
}

@end
