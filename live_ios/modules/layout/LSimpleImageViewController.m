//
//  SimpleImageViewController.m
//  live_ios
//
//  Created by smileflutter on 2023/7/8.
//

#import <UIKit/UIKit.h>
#import "LSimpleImageViewController.h"

@interface LSimpleImageViewController ()
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation LSimpleImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 创建UIImageView对象，并设置其位置和大小
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    
    // 设置图片
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    self.imageView.image = image;
    [self.view addSubview:self.imageView];
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

