//
//  LLogPublicDefine.h
//  live_ios
//
//  Created by smileflutter on 2023/7/15.
//

#ifndef BTLogPublicDefine_h
#define BTLogPublicDefine_h


// 自定义Log
#ifdef DEBUG
#define BTLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define BTLog(...)
#endif


#endif /* LLogPublicDefine_h */
