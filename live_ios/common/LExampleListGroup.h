//
//  LExampleListGroup.h
//  live_ios
//
//  Created by smileflutter on 2023/7/13.
//

#import <Foundation/Foundation.h>
#import "LExampleListGroupItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface LExampleListGroup : NSObject

#pragma mark group name
@property (nonatomic, copy) NSString *name;

#pragma mark group items (Array of LExampleListGroupItem)
@property (nonatomic, strong) NSArray *children;

+(LExampleListGroup*)initWithName:(NSString*)name andChildren:(NSArray *) children;

@end

NS_ASSUME_NONNULL_END
