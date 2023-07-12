//
//  LContactGroup.h
//  live_ios
//
//  Created by smileflutter on 2023/7/11.
//

#import <Foundation/Foundation.h>
#import "LContact.h"

NS_ASSUME_NONNULL_BEGIN

@interface LContactGroup : NSObject
#pragma mark 组名
@property(nonatomic, copy) NSString* name;

#pragma mark 分组描述
@property(nonatomic, copy) NSString* detail;

#pragma mark 联系人
@property(nonatomic, strong) NSMutableArray* contacts;

#pragma mark 带参构造函数
-(LContactGroup*) initWithName:(NSString*)name andDetail:(NSString*) detail andContacts:(NSMutableArray*) contacts;

#pragma mark 静态初始化方法
+(LContactGroup*) initWithName: (NSString*)name andDetail:(NSString*)detail andContacts:(NSMutableArray*) contacts;

@end

NS_ASSUME_NONNULL_END
