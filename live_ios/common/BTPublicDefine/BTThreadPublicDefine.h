//
//  LThreadPublicDefine.h
//  live_ios
//
//  Created by smileflutter on 2023/7/15.
//

#ifndef BTThreadPublicDefine_h
#define BTThreadPublicDefine_h

// 子线程中，使用宏将更新UI的任务派发到主队列
#define BTDISPATCH_MAIN_SYNC_SAFE(block) \
if ([NSThread isMainThread]) { \
block(); \
} else { \
dispatch_sync(dispatch_get_main_queue(), block); \
}

#define BTDISPATCH_ASYNC_MAIN(block) dispatch_async(dispatch_get_main_queue(), block)

#endif /* LThreadPublicDefine_h */
