//
//  LStatusTableViewCell.m
//  live_ios
//
//  Created by smileflutter on 2023/7/13.
//

#import "LStatusTableViewCell.h"
#import "LStatus.h"
#import "LPublicDefine.h"

#define kLColor(r, g, b) [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1] // 颜色宏定义
#define kLStatusTableViewCellControlSpacing 10 // 控件间距
#define kLStatusTableViewCellBackgroundColor kLColor(251, 251, 251)
#define kLStatusGrayColor kLColor(50, 50, 50)
#define kLStatusLightGrayColor kLColor(120, 120, 120)

#define kLStatusTableViewCellAvatarWidth 40 // 头像宽度
#define kLStatusTableViewCellAvatarHeight kLStatusTableViewCellAvatarWidth
#define kLStatusTableViewCellUserNameFontSize 14
#define kLStatusTableViewCellMbTypeWidth 13 // 会员图标宽度
#define kLStatusTableViewCellMbTypeHeight kLStatusTableViewCellMbTypeWidth
#define kLStatusTableViewCellCreateAtFontSize 12
#define kLStatusTableViewCellSourceFontSize 12
#define kLStatusTableViewCellTextFontSize 14




@interface LStatusTableViewCell() {
    UIImageView *_avatar; // 头像
    UIImageView *_mbType; // 会员类型
    UILabel *_userName;
    UILabel *_createdAt;
    UILabel *_source;
    UILabel *_text;
}

@end




@implementation LStatusTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    
    return self;
}

#pragma mark 初始化视图
-(void)initSubView {
    // 头像控件
    _avatar = [[UIImageView alloc] init];
    [self.contentView addSubview:_avatar];
    
    // 用户名
    _userName = [[UILabel alloc] init];
    _userName.textColor = kLStatusGrayColor;
    _userName.font = [UIFont systemFontOfSize: kLStatusTableViewCellUserNameFontSize];
    [self.contentView addSubview:_userName];
    
    // 会员类型
    _mbType = [[UIImageView alloc] init];
    [self.contentView addSubview:_mbType];
    
    // 日期
    _createdAt = [[UILabel alloc] init];
    _createdAt.textColor = kLStatusLightGrayColor;
    _createdAt.font = [UIFont systemFontOfSize:kLStatusTableViewCellCreateAtFontSize];
    [self.contentView addSubview:_createdAt];
    
    // 设备
    _source = [[UILabel alloc] init];
    _source.textColor = kLStatusLightGrayColor;
    _source.font = [UIFont systemFontOfSize:kLStatusTableViewCellSourceFontSize];
    [self.contentView addSubview:_source];
    
    // 内容
    _text = [[UILabel alloc] init];
    _text.textColor = kLStatusGrayColor;
    _text.font = [UIFont systemFontOfSize:kLStatusTableViewCellTextFontSize];
    _text.numberOfLines = 0;
    _text.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:_text];
}

#pragma mark 设置微博
-(void)setStatus:(LStatus *)status {
    // 设置头像大小和位置
    CGFloat avatarX = 10, avatarY = 10;
    CGRect avatarRect = CGRectMake(avatarX, avatarY, kLStatusTableViewCellAvatarWidth, kLStatusTableViewCellAvatarHeight);
    _avatar.image = [UIImage imageNamed:status.profileImageUrl];
    _avatar.frame = avatarRect;
    
    // 设置用户名大小和位置
    CGFloat userNameX = CGRectGetMaxX(_avatar.frame) + kLStatusTableViewCellControlSpacing;
    CGFloat userNameY = avatarY;
    
    // 根据文本内容取得文本占用空间大小
    CGSize userNameSize = [status.userName sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kLStatusTableViewCellUserNameFontSize]}];
    CGRect userNameRect = CGRectMake(userNameX, userNameY, userNameSize.width, userNameSize.height);
    _userName.text = status.userName;
    _userName.frame = userNameRect;
    
    // 设置会员图标大小和位置
    CGFloat mbTypeX = CGRectGetMaxX(_userName.frame) + kLStatusTableViewCellControlSpacing;
    CGFloat mbTypeY = avatarY;
    CGRect mbTypeRect = CGRectMake(mbTypeX, mbTypeY, kLStatusTableViewCellMbTypeWidth, kLStatusTableViewCellMbTypeHeight);
    _mbType.image = [UIImage imageNamed:status.mbtype];
    _mbType.frame = mbTypeRect;
    
    // 设置发布日期大小和位置
    CGSize createAtSize = [status.createdAt sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kLStatusTableViewCellCreateAtFontSize]}];
    CGFloat createAtX = userNameX;
    CGFloat createAtY = CGRectGetMaxY(_avatar.frame) - createAtSize.height;
    CGRect createAtRect = CGRectMake(createAtX, createAtY, createAtSize.width, createAtSize.height);
    _createdAt.text = status.createdAt;
    _createdAt.frame = createAtRect;
    
    // 设置设备大小信息大小和位置
    CGSize sourceSize = [status.source sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kLStatusTableViewCellSourceFontSize]}];
    CGFloat sourceX = CGRectGetMaxX(_createdAt.frame) + kLStatusTableViewCellControlSpacing;
    CGFloat sourceY = createAtY;
    CGRect sourceRect = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    _source.text = status.source;
    _source.frame = sourceRect;
    
    // 设置微博内容大小和位置
    CGFloat textX = avatarX;
    CGFloat textY = CGRectGetMaxY(_avatar.frame) + kLStatusTableViewCellControlSpacing;
    CGFloat textWidth = SCREEN_WIDTH - kLStatusTableViewCellControlSpacing * 2;
    CGSize textSize = [status.text boundingRectWithSize:CGSizeMake(textWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kLStatusTableViewCellTextFontSize]} context:nil].size;
    CGRect textRect = CGRectMake(textX, textY, textSize.width, textSize.height);
    _text.text = status.text;

    _text.frame = textRect;
   
    _height = CGRectGetMaxY(_text.frame) + kLStatusTableViewCellControlSpacing;
}

#pragma mark 重写选择事件，取消选中
-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
