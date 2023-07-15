//
//  ViewController.m
//  live_ios
//
//  Created by smileflutter on 2023/7/8.
//

#import "LNoteViewController.h"
#import "LVideoPlayViewController.h"
#import "LUIImageViewController.h"

@interface LNoteViewController ()
@property (strong, nonatomic) UIButton *videoPalyButton;
@property (strong, nonatomic) UIButton *simpleImageButton;

@end

@implementation LNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 设置状态栏
    [self configStatusBar];
    
    // 设置导航栏
    [self configNavigatonbar];
    
    
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:self.videoPalybutton];
    [self.view addSubview:self.simpleImageButton];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self configStatusBar];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
    LVideoPlayViewController *videoPlayVC = [[LVideoPlayViewController alloc] init];
    NSLog(@"跳转到视频播放页面");
    [self.navigationController pushViewController:videoPlayVC animated:YES];
}

-(void)goToSimpleImageVC:(UIButton *) sender {
    LUIImageViewController * simpleImageVC = [[LUIImageViewController alloc] init];
    NSLog(@"跳转到简单图片页面");
    [self.navigationController pushViewController:simpleImageVC animated:YES];
}

- (void)handleRightNavBtnClick {
    
}

- (void)configNavigatonbar {
    self.navigationItem.title = @"Note";
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Button" style:UIBarButtonItemStylePlain target:self action:@selector(handleRightNavBtnClick)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UINavigationBar *navigationBar = self.navigationController.navigationBar;
    navigationBar.barTintColor = [UIColor blueColor];
    navigationBar.tintColor = [UIColor whiteColor];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
}


- (void)configStatusBar {
    // 方法1:
    // 可以成功修改状态栏
    // Info.plist 中 View controller-based status bar appearance 要设置为NO， 否则只能使用 Info.plist 来设置
     [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    // 方法2：（修改失败）
    // 与下面的 preferredStatusBarStyle 结合使用
    // [self setNeedsStatusBarAppearanceUpdate];
}
// 与 configStatusBar 中方法2结合使用（修改失败）
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}

@end
