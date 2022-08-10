//
//  FTKeyChain.m
//  FTemplate
//
//  Created by Jack on 2022/8/2.
//

#import "FTKeyChain.h"
#import "FTDefine.h"
#import "FTConst.h"
#import <UIKit/UIDevice.h>
@implementation FTKeyChain
+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

#pragma mark 写入
+ (void)save:(NSString *)service data:(id)data {
   
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
    NSData *saveData = [NSKeyedArchiver archivedDataWithRootObject:data requiringSecureCoding:true error:nil];
    [keychainQuery setObject:saveData forKey:(id)kSecValueData];
    
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}
#pragma mark 读取
+ (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        } @catch (NSException *e) {
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        } @finally {
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}
#pragma mark 删除
+ (void)deleteKeyChain:(NSString *)serviece {
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:serviece];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}

+ (NSString *(^)(void))fUuid {
    
    return ^() {
        NSString *device_uuid = [fUserDefault stringForKey:FTemplateDeviceUUID];
        if (device_uuid != nil && device_uuid.length > 0) {
            return device_uuid;
        }
        
        NSMutableDictionary *keyChains = FTKeyChain.fGetKeyChain();
        device_uuid = keyChains[FTemplateDeviceUUID];
        if (device_uuid == nil) {
            
            NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
            device_uuid = [uuid stringByReplacingOccurrencesOfString:@"-" withString:@""];
            
            keyChains[FTemplateDeviceUUID] = device_uuid;
            FTKeyChain.fSaveKeyChain(keyChains);
            [fUserDefault setObject:device_uuid forKey:FTemplateDeviceUUID];
            [fUserDefault synchronize];

        }
        else
        {
            [fUserDefault setObject:device_uuid forKey:FTemplateDeviceUUID];
            [fUserDefault synchronize];
        }

        return device_uuid;
    };
}
+ (NSMutableDictionary *(^)(void))fGetKeyChain {
    return ^() {
        
        NSMutableDictionary *keyChains = (NSMutableDictionary *)[FTKeyChain load:FTemplateID];
        if (keyChains == nil) {
            keyChains = [NSMutableDictionary dictionary];
        }
        return keyChains;
    };
}

+ (void (^)(NSDictionary * _Nonnull))fSaveKeyChain {
    return ^(NSDictionary * keyChains) {
        [FTKeyChain save:FTemplateID data:keyChains];
    };
}

@end
