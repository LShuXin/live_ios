//
//  LStringPublicDefine.h
//  live_ios
//
//  Created by smileflutter on 2023/7/15.
//

#ifndef BTStringPublicDefine_h
#define BTStringPublicDefine_h

// 字符串拼接
#define BTCONCAT_STRING_WITH(x, y) [NSString stringWithFormat:@"%@%@", x, y]


// 转成字符串
#define BTSTRINGIFY(S) #S


//// 需要解两次才解开的宏
//#define DEFER_STRINGIFY(S) STRINGIFY(S)
//
//
//#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
//
//
//// 为warning增加更多信息
//#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n" DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)
//
//
//// 使宏前面可以加@
//#define KEYWORDIFY try {} @catch (...) {}
//
//
//// 最终使用的宏
//#define TODO(MSG) KEYWORDIFY PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))


// 字符串是否为空
#define BTIsStringEmpty(string) ([string isKindOfClass:[NSNull class]] || string.length == 0 ? YES : NO)


// 数组是否为空
#define BTIsArrayEmpty(array) ([array isKindOfClass:[NSNull class]] || array.count == 0 ? YES : NO)


// 字典是否为空
#define BTIsDictionaryEmpty(dictionary) ([dictionary isKindOfClass:[NSNull class]] || dictionary.allKeys == 0 ? YES : NO)

#endif /* LStringPublicDefine_h */
