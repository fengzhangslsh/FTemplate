//
//  FTAlert.m
//  shiku_im
//
//  Created by Jack on 2022/8/10.
//  Copyright © 2022 Reese. All rights reserved.
//

#import "FTAlert.h"

@implementation FTAlert
+ (void)showAlert {
    
    
}
/** 从底部弹出 */
+ (void)actionSheet:(NSArray <NSString *>*)list inVC:(UIViewController *)vc andCallBackBlock:(CallBackBlock2)callBack {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:cancel];
    
    for (int i = 0; i < list.count; i ++) {
        NSString *title = list[i];
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            fEXEC(callBack,[NSString stringWithFormat:@"%d",i],title);
        }];
        
        [alertController addAction:sureAction];
    }
    
    
    [vc presentViewController:alertController animated:true completion:nil];
    
}
@end
