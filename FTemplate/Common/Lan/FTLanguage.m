//
//  FTLanguage.m
//  NIM
//
//  Created by Jack on 2022/8/21.
//  Copyright © 2022 Netease. All rights reserved.
//

#import "FTLanguage.h"

@interface FTLanguage()
+(NSBundle *)bundle;//获取当前资源文件

+(NSString *)userLanguage;//获取应用当前语言

+(void)setUserlanguage:(NSString *)language;//设置当前语言
@end

@implementation FTLanguage
static NSBundle *bundle = nil;

+ ( NSBundle * )bundle{
    return bundle;
}

+(void)initLanguage:(NSString *)type{
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:type ofType:@"lproj"];
    
    bundle = [NSBundle bundleWithPath:path];//生成bundle
    
}

+(NSString *)userLanguage{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];

    NSString *language = [def valueForKey:@"AppleLanguages"][0];

    return language;

}

+(void)setUserlanguage:(NSString *)language{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];

    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];

    bundle = [NSBundle bundleWithPath:path];

    [def setValue:language forKey:@"userLanguage"];

    [def synchronize];

}

+ (NSString *)getLanStr:(NSString *)key {
    return [[self bundle] localizedStringForKey:key value:nil table:@"Localizable"];
}
@end
