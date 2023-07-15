//
//  LStatus.m
//  live_ios
//
//  Created by smileflutter on 2023/7/13.
//

#import "LStatus.h"

@implementation LStatus

#pragma mark 根据字典初始化微博对象
-(LStatus*)initWithDictionary:(NSDictionary *)dict {
    if (self = [super init]) {
        self.Id = [dict[@"Id"] longLongValue];
        self.profileImageUrl = dict[@"profileImageUrl"];
        self.userName = dict[@"userName"];
        self.mbtype = dict[@"mbtype"];
        self.createdAt = dict[@"createdAt"];
        self.source = dict[@"source"];
        self.text = dict[@"text"];
    }
    return self;
}

-(NSString*)source {
    return [NSString stringWithFormat:@"来自 %@", _source];
}

#pragma mark 初始化微博对象（静态方法）
+(LStatus*)statusWithDictionary:(NSDictionary *)dict {
    LStatus *status = [[LStatus alloc] initWithDictionary:dict];
    return status;
}

@end
