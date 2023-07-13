//
//  LRouterTable.h
//  live_ios
//
//  Created by smileflutter on 2023/7/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



@interface LRouterTable : NSObject

#pragma mark 用于实现单例
+(instancetype)sharedInstance;

#pragma mark 路由表 k - NSString, v - [UIViewController class];
@property (nonatomic, strong) NSDictionary *routeMap;

#pragma mark 通过路由名字找到对应页面 ViewController 的类名
-(NSString*)getViewControllerClazzNameByRouteName:(NSString*)routeName;

@end

NS_ASSUME_NONNULL_END
