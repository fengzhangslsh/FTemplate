//
//  FTDefine.h
//  FTemplate
//
//  Created by Jack on 2022/8/6.
//

#ifndef FTDefine_h
#define FTDefine_h

// MARK: 系统单例对象
#define fUserDefault NSUserDefaults.standardUserDefaults

#define fFileManager [NSFileManager defaultManager]

/**
 判断空串
 */
#define  fIsEmptyStr(string) ([string isKindOfClass:[NSNull class]] || string == NULL || string == nil || [string isEqualToString:@""] ||[[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) ? true : false


#define fWeakSelf(type)  __weak typeof(type) weak##type = type;

#define fScreentWidth UIScreen.mainScreen.bounds.size.width
#define fScreentHeight UIScreen.mainScreen.bounds.size.height


#define DEFINE_CONST(CONST) static NSString* CONST = @#CONST;
#define DEFINE_EVENT(EVENT) static NSString* EVENT = @#EVENT;



//block防止空回调
#define fEXEC(block, ...)  if (block) { block(__VA_ARGS__); }
// 主线程回调
#define fMainBlock(block) dispatch_async(dispatch_gefmain_queue(),block)
#define fDelayBlock(s,block) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(s * NSEC_PER_SEC)), dispatch_gefmain_queue(), block);

typedef void (^CallBackBlock)(void);
typedef void (^CallBackBlock1)(id data1);
typedef void (^CallBackBlock2)(id data1,id data2);
typedef void (^CallBackBlock3)(id data1,id data2,id data3);
typedef void (^CallBackBlock4)(id data1,id data2,id data3,id data4);
typedef void (^CallBackBlock5)(id data1,id data2,id data3,id data4,id data5);


#define fFontN(size) [UIFont systemFontOfSize:size]
#define fFontB(size) [UIFont boldSystemFontOfSize:size]

#define fHexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]  //十六进制颜色
#define fHexColorA(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]  //十六进制颜色

#define fBlack3 fHexColor(0x333333)
#define fBlack6 fHexColor(0x666666)
#define fBlack9 fHexColor(0x999999)

#endif /* FTDefine_h */
