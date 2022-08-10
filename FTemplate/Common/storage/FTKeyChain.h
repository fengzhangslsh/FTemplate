//
//  FTKeyChain.h
//  FTemplate
//
//  Created by Jack on 2022/8/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FTKeyChain : NSObject
+ (NSMutableDictionary *(^)(void))fGetKeyChain;

+ (void (^)(NSDictionary * _Nonnull))fSaveKeyChain;
+ (NSString *(^)(void))fUuid;

@end

NS_ASSUME_NONNULL_END
