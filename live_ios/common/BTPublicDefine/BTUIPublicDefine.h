//
//  LUIPublicDefine.h
//  live_ios
//
//  Created by smileflutter on 2023/7/15.
//

#ifndef BTUIPublicDefine_h
#define BTUIPublicDefine_h
#import "BTPlatformPublicDefine.h"


// 屏幕宽高
#define BTSCREEN_WIDTH                    ([UIScreen mainScreen].bounds.size.width)
#define BTSCREEN_HEIGHT                   ([UIScreen mainScreen].bounds.size.height)


// 状态栏
#define BTSTATUSBAR_HEIGHT \
^(){\
if (@available(iOS 13.0, *)) {\
    UIStatusBarManager *statusBarManager = [UIApplication sharedApplication].windows.firstObject.windowScene.statusBarManager;\
    return statusBarManager.statusBarFrame.size.height;\
} else {\
    return [UIApplication sharedApplication].statusBarFrame.size.height;\
}\
}()


// 导航栏高度
#define BTNAVBAR_HEIGHT (44)

// 状态栏和导航栏总高度
#define BTNAVBAR_AND_STATUSBAR_HEIGHT (CGFloat)(BTIS_IPhoneX ? (88.0) : (64.0))

// TabBar高度
#define BTTABBAR_HEIGHT (CGFloat)(BTIS_IPhoneX ? (49.0 + 34.0) : (49.0))

// 顶部安全区域远离高度
#define BTTOPSAFE_HEIGHT (CGFloat)(BTIS_IPhoneX ? (44.0) : (0))

// 底部安全区域远离高度
#define BTBOTTOMSAFE_HEIGHT (CGFloat)(BTIS_IPhoneX ? (34.0) : (0))

// iPhoneX的状态栏高度差值
#define BTTOPBARDIF_HEIGHT (CGFloat)(BTIS_IPhoneX ? (24.0) : (0))

// 导航条和Tabbar总高度
#define BTNAVBAR_AND_TABBAR_HEIGHT (BTNAVBAR_AND_STATUSBAR_HEIGHT + BTTABBAR_HEIGHT)


// 底部指示条高度
#define BTINDICATOR_HEIGHT \
^(){\
if (@available(iOS 11.0, *)) {\
    UIEdgeInsets safeAreaInsets = [[UIApplication sharedApplication] delegate].window.safeAreaInsets;\
    return safeAreaInsets.bottom;\
} else {\
    return UIEdgeInsetsMake(0, 0, 0, 0).bottom;\
}\
}()


// 颜色：16进制颜色 + 透明度
#define BTUIColorFromRGB_A(rgbValue, alphaValue) \
    [UIColor \
    colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
    green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
    blue:((float)(rgbValue & 0x0000FF))/255.0 \
    alpha:alphaValue]


// 颜色：r, g, b + 透明度
#define BTUIColorFromR_G_B_A(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/1.0]


// 颜色： r, g, b
#define BTUIColorFromR_G_B(r, g, b) [UIColor colorWithHue:r/255.0 saturation:g/255.0 brightness:b/255.0 alpha:1]


// 随机色
#define BTUIRandomColor EYRGBAColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), 1.0)


// clear背景颜色
#define BTUIClearColor [UIColor clearColor]


// 读取本地图片
#define BTLoadImage(file, ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]


// 定义UIImage对象
#define BTImage(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]


//定义UIImage对象
#define BTImageNamed(_pointer) [UIImage imageNamed:_pointer]

//可拉伸的图片
#define BTResizableImage(name,top,left,bottom,right) [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake(top,left,bottom,right)]
#define BTResizableImageWithMode(name,top,left,bottom,right,mode) [[UIImage imageNamed:name] resizableImageWithCapInsets:UIEdgeInsetsMake(top,left,bottom,right) resizingMode:mode]


// 设置 view 圆角和边框
#define BTViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]



// 由角度转换弧度 由弧度转换角度
#define BTDegreesToRadian(x) (M_PI * (x) / 180.0)
#define BTRadianToDegrees(radian) (radian*180.0)/(M_PI)


// 获取图片资源
#define BTGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]


// 常用Padding
#define BTPADDING8 8
#define BTPADDING10 10
#define BTPADDING12 12
#define BTPADDING16 16
#define BTPADDING18 18
#define BTPADDING20 20
#define BTPADDING22 22
#define BTPADDING24 24

// 常用Margin
#define BTMARGIN8 8
#define BTMARGIN10 10
#define BTMARGIN12 12
#define BTMARGIN16 16
#define BTMARGIN18 18
#define BTMARGIN20 20
#define BTMARGIN22 22
#define BTMARGIN24 24


#endif /* LUIPublicDefine_h */
