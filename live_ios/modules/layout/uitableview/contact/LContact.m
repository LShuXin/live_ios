//
//  LContact.m
//  live_ios
//
//  Created by smileflutter on 2023/7/11.
//

#import "LContact.h"

@implementation LContact

-(LContact*)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber {
    if (self = [super init]) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
    }
    return self;
}

-(NSString*)getName{
    return [NSString stringWithFormat:@"%@ %@", _lastName, _firstName];
}

+(LContact*)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName andPhoneNumber:(NSString *)phoneNumber {
    LContact *lContact = [[LContact alloc] initWithFirstName:firstName andLastName:lastName andPhoneNumber:phoneNumber];
    return lContact;
}
@end
