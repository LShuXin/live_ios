//
//  ViewController.m
//  live_ios
//
//  Created by smileflutter on 2023/7/8.
//

#import "ViewController.h"
#import "VideoPlayViewController.h"
#import "SimpleImageViewController.h"

@interface ViewController ()
@property (strong, nonatomic) UIButton *videoPalyButton;
@property (strong, nonatomic) UIButton *simpleImageButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.videoPalybutton];
    [self.view addSubview:self.simpleImageButton];
    
}



- (UIButton *)videoPalybutton {
    if (!_videoPalyButton) {
        _videoPalyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _videoPalyButton.frame = CGRectMake(0, 0, 80, 30);
        _videoPalyButton.center = CGPointMake(40, 100);
        [_videoPalyButton setBackgroundColor:[UIColor greenColor]];
        [_videoPalyButton setTitle:@"视频播放" forState:UIControlStateNormal];
        [_videoPalyButton addTarget:self action:@selector(goToVideoPlayVC:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _videoPalyButton;
}

- (UIButton *) simpleImageButton {
    if (!_simpleImageButton) {
        _simpleImageButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _simpleImageButton.frame = CGRectMake(0, 0, 80, 30);
    
        _simpleImageButton.center = CGPointMake(140, 100);
        [_simpleImageButton setBackgroundColor:[UIColor greenColor]];
        [_simpleImageButton setTitle:@"图片展示" forState:UIControlStateNormal];
        [_simpleImageButton addTarget:self action:@selector(goToSimpleImageVC:) forControlEvents:UIControlEventTouchUpInside ];
    }
    
    return _simpleImageButton;
}

-(void)goToVideoPlayVC:(UIButton *) sender {
    VideoPlayViewController *videoPlayVC = [[VideoPlayViewController alloc] init];
    NSLog(@"跳转到视频播放页面");
    [self.navigationController pushViewController:videoPlayVC animated:YES];
}

-(void)goToSimpleImageVC:(UIButton *) sender {
    SimpleImageViewController * simpleImageVC = [[SimpleImageViewController alloc] init];
    NSLog(@"跳转到简单图片页面");
    [self.navigationController pushViewController:simpleImageVC animated:YES];
}

@end
