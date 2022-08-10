//
//  FTAlert.h
//  shiku_im
//
//  Created by Jack on 2022/8/10.
//  Copyright © 2022 Reese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FTDefine.h"
NS_ASSUME_NONNULL_BEGIN

@interface FTAlert : UIView
/** 从底部弹出 */
+ (void)actionSheet:(NSArray <NSString *>*)list inVC:(UIViewController *)vc andCallBackBlock:(CallBackBlock2)callBack;
@end

NS_ASSUME_NONNULL_END
