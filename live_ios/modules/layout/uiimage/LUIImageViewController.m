//
//  SimpleImageViewController.m
//  live_ios
//
//  Created by smileflutter on 2023/7/8.
//

#import <UIKit/UIKit.h>
#import "LUIImageViewController.h"
#import "BTPublicDefine.h"


@interface LUIImageViewController ()
@property (nonatomic, strong) UIImageView *normalUIImageView;
@property (nonatomic, strong) UIImageView *roundedUIImageView;
@property (nonatomic, strong) UIImageView *roundedRoutateImageView;
@end

@implementation LUIImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    

    CGFloat imageLeft = (BTSCREEN_WIDTH - 100) / 2;
    CGFloat baseImageTop = BTNAVBAR_AND_STATUSBAR_HEIGHT + BTMARGIN24;
    self.normalUIImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageLeft, baseImageTop, 100, 100)];
    self.normalUIImageView.image = [UIImage imageNamed:@"1.jpg"];
    [self.view addSubview:self.normalUIImageView];
    
    
    self.roundedUIImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageLeft, baseImageTop + BTMARGIN24 + 100 * 1, 100, 100)];
    self.roundedUIImageView.image = [UIImage imageNamed:@"1.jpg"];
    BTViewBorderRadius(self.roundedUIImageView, 16.0, 0.0, BTUIClearColor);
    [self.view addSubview:self.roundedUIImageView];
    
    self.roundedUIImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageLeft, baseImageTop + BTMARGIN24 + 100 * 2, 100, 100)];
    self.roundedUIImageView.image = [UIImage imageNamed:@"1.jpg"];
    BTViewBorderRadius(self.roundedUIImageView, 16.0, 0.0, BTUIClearColor);
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

