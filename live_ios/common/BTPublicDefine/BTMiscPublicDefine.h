//
//  LMiscPublicDefine.h
//  live_ios
//
//  Created by smileflutter on 2023/7/15.
//

#ifndef BTMiscPublicDefine_h
#define BTMiscPublicDefine_h

// 获取通知中心
#define BTNotificationCenter(name, object, userInfo) [[NSNotificationCenter defaultCenter] postNotificationName:name object:object userInfo:userInfo]

// 快速weak
#define BTWEAKOBJ(weakObj)  __weak __typeof(&*weakObj)weak_##weakObj = weakObj;
#define BTWEAKSELF(weakSelf)  __weak __typeof(&*self)weakSelf = self;


#endif /* LMiscPublicDefine_h */
