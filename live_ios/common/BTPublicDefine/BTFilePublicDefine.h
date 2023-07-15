//
//  LFilePublicDefine.h
//  live_ios
//
//  Created by smileflutter on 2023/7/15.
//

#ifndef BTFilePublicDefine_h
#define BTFilePublicDefine_h

// 获取 temp
#define BTTempPath NSTemporaryDirectory()

// 获取沙盒 Document
#define BTDocumentPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]

// 获取沙盒 Cache
#define BTCachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

#endif /* LFilePublicDefine_h */
