//
//  VideoPalyViewController.m
//  live_ios
//
//  Created by smileflutter on 2023/7/8.
//
#import "LVideoPlayViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface LVideoPlayViewController ()
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

@end

@implementation LVideoPlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor yellowColor]];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    // Do any additional setup after loading the
    
    // 获取网络视频URL
//    NSURL *remoteVideoURL = [NSURL URLWithString:@"https://www.cnuseful.com/testdown/video/test.mp4"];
    NSURL *localVideoURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp4"]];
    
    // 获取视频文件的URL
    
    
    // 创建AVPlayer对象
    self.player = [AVPlayer playerWithURL:localVideoURL];
    
    // 创建 AVPlayer 对象，并将其添加到视图的层级结构中
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
    self.playerLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:self.playerLayer];
    
    // 开始播放
    [self.player play];
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
