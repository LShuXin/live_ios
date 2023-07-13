//
//  LExampleListGroupItem.m
//  live_ios
//
//  Created by smileflutter on 2023/7/13.
//

#import "LExampleListGroupItem.h"

@implementation LExampleListGroupItem

-(LExampleListGroupItem*)initWithTitle:(NSString *)title andDetail: (NSString *)detail andRouteName:(NSString*)routeName {
    if (self = [super init]) {
        self.title = title;
        self.detail = detail;
        self.routeName = routeName;
    }
    
    return self;
}

+(LExampleListGroupItem*)initWithTitle:(NSString *)title andDetail: (NSString *)detail andRouteName:(NSString*)routeName {
    LExampleListGroupItem *groupItem = [[LExampleListGroupItem alloc]initWithTitle:title andDetail:detail andRouteName:routeName];
    return groupItem;
}
@end
