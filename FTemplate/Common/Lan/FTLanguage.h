//
//  FTLanguage.h
//  NIM
//
//  Created by Jack on 2022/8/21.
//  Copyright © 2022 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#define fLan(key) [FTLanguage getLanStr:key]
NS_ASSUME_NONNULL_BEGIN

@interface FTLanguage : NSObject

+(void)initLanguage:(NSString *)type;//初始化语言文件
+ (NSString *)getLanStr:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
