//
//  LRouterTable.m
//  live_ios
//
//  Created by smileflutter on 2023/7/13.
//

#import "LRouterTable.h"

#import "LNoteViewController.h"
#import "LGameViewController.h"
#import "LLayoutViewController.h"
#import "LIMViewController.h"
#import "LVideoPlayViewController.h"
#import "LFileViewController.h"
#import "LFlutterViewController.h"

// 布局相关的路由
#import "LContactViewController.h"
#import "LPostViewController.h"

@implementation LRouterTable

static LRouterTable *sharedInstance = nil;

+(instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(instancetype)init {
    if (self = [super init]) {
        [self initRouteTable];
    }
    return self;
}

-(void)initRouteTable {
    self.routeMap = @{
        @"native://note": @"LNoteViewController",
        @"native://game": @"LGameViewController",
        @"native://layout": @"LLayoutViewController",
        @"native://im": @"LIMViewController",
        @"native://video": @"LVideoPlayViewController",
        @"native://file": @"LFileViewController",
        @"native://flutter": @"LFlutterViewController",
        // 上面的ViewController 都是在 tab 位置，一般不会直接参与路由管理
        
        // 布局相关的页面
        // 联系人
        @"native://contact": @"LContactViewController",
        @"native://post": @"LPostViewController"
        
    };
}

-(NSString*)getViewControllerClazzNameByRouteName:(NSString*)routeName {
    NSString *viewControllerClazzName = [self.routeMap objectForKey:routeName];
    if (!viewControllerClazzName) {
        NSLog(@"路由表检索失败，routeName: %@", routeName);
    }
    return viewControllerClazzName;
}

@end
