//
//  LUIPublicDefine.h
//  live_ios
//
//  Created by smileflutter on 2023/7/15.
//

#ifndef BTUIPublicDefine_h
#define BTUIPublicDefine_h


// 屏幕宽高
#define BTSCREEN_WIDTH                    ([UIScreen mainScreen].bounds.size.width)
#define BTSCREEN_HEIGHT                   ([UIScreen mainScreen].bounds.size.height)


// 快速weak
#define BTWEAKOBJ(weakObj)  __weak __typeof(&*weakObj)weak_##weakObj = weakObj;
#define BTWEAKSELF(weakSelf)  __weak __typeof(&*self)weakSelf = self;


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



#endif /* LUIPublicDefine_h */
