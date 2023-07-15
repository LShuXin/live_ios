//
//  LStatusTableViewCell.h
//  live_ios
//
//  Created by smileflutter on 2023/7/13.
//

#import <UIKit/UIKit.h>

@class LStatus;

NS_ASSUME_NONNULL_BEGIN

@interface LStatusTableViewCell : UITableViewCell

#pragma mark 微博对象
@property(nonatomic, strong) LStatus *status;

#pragma mark 单元格高度
@property(assign, nonatomic) CGFloat height;

@end

NS_ASSUME_NONNULL_END
