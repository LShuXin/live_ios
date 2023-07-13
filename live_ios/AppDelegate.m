//
//  AppDelegate.m
//  live_ios
//
//  Created by smileflutter on 2023/7/8.
//

#import "AppDelegate.h"
#import "LNoteViewController.h"
#import "LGameViewController.h"
#import "LLayoutViewController.h"
#import "LIMViewController.h"
#import "LVideoPlayViewController.h"
#import "LFileViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 创建窗口
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 配置tabBar以及导航栏
    self.window.rootViewController = [self configTabBarAndNavigationBar];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"applicationWillResignActive");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"applicationDidBecomeActive");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"applicationWillEnterForeground");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"applicationDidEnterBackground");
}


- (UINavigationController*)configTabBarAndNavigationBar {
    // 构造子控制器
    UIViewController *noteVC = [[LNoteViewController alloc] init];
    noteVC.tabBarItem.title = @"Note";
    noteVC.tabBarItem.image = [UIImage imageNamed:@"ic_note_unselected"];
    noteVC.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_note_selected"];
    UIViewController *gameVC = [[LGameViewController alloc] init];
    gameVC.tabBarItem.title = @"Game";
    gameVC.tabBarItem.image = [UIImage imageNamed:@"ic_game_unselected"];
    gameVC.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_game_selected"];
    UIViewController *layoutVC = [[LLayoutViewController alloc] init];
    layoutVC.tabBarItem.title = @"Layout";
    layoutVC.tabBarItem.image = [UIImage imageNamed:@"ic_layout_unselected"];
    layoutVC.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_layout_selected"];
    UIViewController *imVC = [[LIMViewController alloc] init];
    imVC.tabBarItem.title = @"IM";
    imVC.tabBarItem.image = [UIImage imageNamed:@"ic_im_unselected"];
    imVC.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_im_selected"];
    UIViewController *videoVC = [[LVideoPlayViewController alloc] init];
    videoVC.tabBarItem.title = @"Video";
    videoVC.tabBarItem.image = [UIImage imageNamed:@"ic_video_unselected"];
    videoVC.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_video_selected"];
    UIViewController *fileVC = [[LFileViewController alloc] init];
    fileVC.tabBarItem.title = @"File";
    fileVC.tabBarItem.image = [UIImage imageNamed:@"ic_file_unselected"];
    fileVC.tabBarItem.selectedImage = [UIImage imageNamed:@"ic_file_selected"];
    
    // 设置窗口的根控制器
    // Main.storyboard 中的 class 要填写 UITabBarController
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    [tabBarVC addChildViewController:noteVC];
    [tabBarVC addChildViewController:gameVC];
    [tabBarVC addChildViewController:layoutVC];
    [tabBarVC addChildViewController:imVC];
    [tabBarVC addChildViewController:videoVC];
    [tabBarVC addChildViewController:fileVC];
    // 默认选中第3个
    [tabBarVC setSelectedIndex:2];

    

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: tabBarVC];
    
    return nav;
}


//- (void)configurationAppTabBarAndNavigationBar{
//     // 选中的item普通状态图片的大小
//     UIImage *tabNormalImage = self.window.rootViewController.tabBarController.tabBar.selectedItem.image;
//     tabNormalImage = [tabNormalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//     [self.window.rootViewController.tabBarController.tabBar.selectedItem setImage:tabNormalImage];
//      // 选中的item选中撞他图片的大小
//     UIImage *selectImage = self.window.rootViewController.tabBarController.tabBar.selectedItem.selectedImage;
//     UIImage *tabSelectImage = [self createNewImageWithImage:selectImage multiple:0.5];
//     tabSelectImage = [tabSelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//     // 设置点击图片放大缩小的动画
//     [self.window.rootViewController.tabBarController.tabBar.selectedItem setSelectedImage:tabSelectImage];
//     self.window.rootViewController.tabBarController.tabBar.tintColor = [UIColor colorWithRed:0.11f green:0.61f blue:0.97f alpha:1.00f];
//     self.window.rootViewController.tabBarController.tabBar.barTintColor = [UIColor colorWithRed:0.85f green:0.85f blue:0.85f alpha:1.00f];
//}

/**
 图片放大或压缩处理 ，图片放大倍数 0 ~ 2 之间 ，0~1 缩小图片，1~2 放大图片  1 **
 2  *  根据image 返回放大或缩小之后的图片
 3  *
 4  *  @param image    原始图片
 5  *  @param multiple 放大倍数 0 ~ 2 之间
 6  *
 7  *  @return 新的image
 8  */
//  - (UIImage *) createNewImageWithImage:(UIImage *)image multiple:(CGFloat)multiple {
//     CGFloat newMultiple = multiple;
//     if (multiple == 0) {
//         newMultiple = 1;
//     } else if((fabs(multiple) > 0 && fabs(multiple) < 1) || (fabs(multiple)>1 && fabs(multiple)<2)) {
//         newMultiple = multiple;
//     } else {
//         newMultiple = 1;
//     }
//     CGFloat w = image.size.width*newMultiple;
//     CGFloat h = image.size.height*newMultiple;
//     CGFloat scale = [UIScreen mainScreen].scale;
//     UIImage *tempImage = nil;
//     CGRect imageFrame = CGRectMake(0, 0, w, h);
//     UIGraphicsBeginImageContextWithOptions(image.size, NO, scale);
//     [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:0] addClip];
//     [image drawInRect:imageFrame];
//     tempImage = UIGraphicsGetImageFromCurrentImageContext();
//     UIGraphicsEndImageContext();
//     return tempImage;
// }


@end
