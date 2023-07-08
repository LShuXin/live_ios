//
//  ViewController.m
//  live_ios
//
//  Created by smileflutter on 2023/7/8.
//

#import "ViewController.h"
#import "VideoPlayViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.button];
    
}


- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeSystem];
        _button.frame = CGRectMake(0, 0, 80 , 30);
        _button.center = CGPointMake(self.view.center.x, self.view.center.y + 50);
        [_button setTitle:@"视频播放" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(goToVideoPlayVC:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _button;
}

-(void)goToVideoPlayVC:(UIButton *) sender {
    VideoPlayViewController *videoPlayVC = [[VideoPlayViewController alloc] init];
    NSLog(@"跳转到视频播放页面");
    [self.navigationController pushViewController:videoPlayVC animated:YES];
}


@end
