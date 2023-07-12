//
//  LContact.h
//  live_ios
//
//  Created by smileflutter on 2023/7/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LContact : NSObject
#pragma mark 性
@property (nonatomic, copy) NSString *firstName;
#pragma mark 名
@property (nonatomic, copy) NSString *lastName;
#pragma mark 手机号
@property (nonatomic, copy) NSString *phoneNumber;


#pragma mark 带参数的构造函数
- (LContact*)initWithFirstName:(NSString*)firstName andLastName:(NSString*)lastName andPhoneNumber:(NSString*)phoneNumber;

#pragma mark 取得姓名
-(NSString*)getName;


#pragma mark 带参数的静态对象初始化方法
+(LContact*)initWithFirstName:(NSString*)firstName andLastName:(NSString *) lastName andPhoneNumber:(NSString *)phoneNumber;


@end

NS_ASSUME_NONNULL_END
