//
//  LSDWebImageViewController.m
//  live_ios
//
//  Created by smileflutter on 2023/7/15.
//

#import <SDWebImage/UIImageView+WebCache.h>
#import "LSDWebImageViewController.h"
#import "BTPublicDefine.h"

@interface LSDWebImageViewController()
@property (nonatomic, strong) UIImageView *imageViewWithPlaceholder;

@end

@implementation LSDWebImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor: [UIColor whiteColor]];
    
  
    self.imageViewWithPlaceholder = [[UIImageView alloc] initWithFrame:CGRectMake((BTSCREEN_WIDTH - 100.0) / 2, BTNAVBAR_AND_STATUSBAR_HEIGHT + BTMARGIN24, 100.0, 100.0)];
    [self.imageViewWithPlaceholder sd_setImageWithURL:[NSURL URLWithString:@"https://seele.s3.us-west-1.amazonaws.com/static/img/logo_rounded_120x120.png"] placeholderImage: [UIImage imageNamed:@"image_loading.png"]];
   
    [self.view addSubview:self.imageViewWithPlaceholder];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
