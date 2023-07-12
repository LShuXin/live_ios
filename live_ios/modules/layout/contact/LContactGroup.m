//
//  LContactGroup.m
//  live_ios
//
//  Created by smileflutter on 2023/7/11.
//

#import "LContactGroup.h"

@implementation LContactGroup
-(LContactGroup*)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts {
    if (self = [super init]) {
        self.name = name;
        self.detail = detail;
        self.contacts = contacts;
    }
    return self;
}

+(LContactGroup*)initWithName:(NSString *)name andDetail:(NSString *)detail andContacts:(NSMutableArray *)contacts {
    LContactGroup* lContactGroup = [[LContactGroup alloc] initWithName:name andDetail:detail andContacts:contacts];
    return lContactGroup;
}

@end
