//
//  LExampleListGroupItem.h
//  live_ios
//
//  Created by smileflutter on 2023/7/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LExampleListGroupItem : NSObject

#pragma mark example 的标题
@property (nonatomic, copy) NSString *title;

#pragma mark example 描述
@property (nonatomic, copy) NSString *detail;

#pragma mark example 的路由
@property (nonatomic, copy) NSString *routeName;

+(LExampleListGroupItem*)initWithTitle:(NSString *)title andDetail: (NSString *)detail andRouteName:(NSString*)routeName;

@end

NS_ASSUME_NONNULL_END
