//
//  LPlatformPublicDefine.h
//  live_ios
//
//  Created by smileflutter on 2023/7/15.
//

#ifndef BTPlatformPublicDefine_h
#define BTPlatformPublicDefine_h


// 系统版本
#define BTCURRENT_IOS_VERISON [[[UIDevice currentDevice] systemVersion] floatValue]
#define BTNAVIGATIONBAR_HEIGHT (CURRENT_IOS_VERISON >= 7 ? 64.0f:44.0f)

#define BTSYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define BTSYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define BTSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define BTSYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define BTSYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

#define BTIS_OS_5_OR_LATER                            SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"5.0")
#define BTIS_OS_6_OR_LATER                            SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")
#define BTIS_OS_7_OR_LATER                            SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")



// 是否高清屏
#define BTIsRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)




// 是否模拟器
#define BTIsSimulator (NSNotFound != [[[UIDevice currentDevice] model] rangeOfString:@"Simulator"].location)




// 是否iPad
#define BTIsPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define BTSomeThing (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)? ipad : iphone



// 判断当前项目的环境
#if __has_feature(objc_arc)
// 编译器是ARC环境
#else
// 编译器是MRC环境
#endif

 



// 判断是否为iPhone
#define BTIS_IPHONE ([[[UIDevice currentDevice] model] isEqualToString:@"iPhone"])

// 判断是否为iPad
#define BTIS_IPAD ([[[UIDevice currentDevice] model] isEqualToString:@"iPad"])

// 判断是否为ipod
#define BTIS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])

// 判断是否为 iPhone SE
#define BTIS_iPhoneSE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f

// 判断是否为iPhone 7
#define BTIS_IPhone7 [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f

// 判断是否为iPhone 7Plus
#define BTIS_IPhone7Plus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f

// 获取系统版本
#define BTSystemVersion [[UIDevice currentDevice] systemVersion]

// 判断 iOS 8 或更高的系统版本
#define BTIOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))

// 判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif



#endif /* LPlatformPublicDefine_h */
