//
//  LExampleListGroup.m
//  live_ios
//
//  Created by smileflutter on 2023/7/13.
//

#import "LExampleListGroup.h"

@implementation LExampleListGroup
-(LExampleListGroup*)initWithName:(NSString*)name andChildren:(NSArray *) children {
    if (self = [super init]) {
        self.name = name;
        self.children = children;
    }
    return self;
}

+(LExampleListGroup*)initWithName:(NSString*)name andChildren:(NSArray *) children {
    LExampleListGroup* group = [[LExampleListGroup alloc] initWithName:name andChildren:children];
    return group;
}
@end
