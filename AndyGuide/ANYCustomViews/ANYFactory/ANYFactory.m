//
//  ANYFactory.m
//  AndyGuide
//
//  Created by Andy on 2017/8/6.
//  Copyright © 2017年 andy. All rights reserved.
//

#import "ANYFactory.h"
#import "ANYColor.h"

@implementation ANYFactory


/** 创建窗口 */
+(UIWindow *)createWindowWithColor:(UIColor *)color{

    static UIWindow *window = nil;
    
    if (!window) {
        window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        window.backgroundColor = color;
        
    }
    
    return window;
}

/**
 *@brief 创建控制器
 *@param name 控制器名
 *@param colorString 控制器view背景颜色
 *@return 返回UIViewController
 */
+ (UIViewController *)createViewControllerWithName:(NSString *)name backgoundColor:(NSString *)colorString{
    
    UIViewController *vc = [self createViewControllerWithName:name];
    vc.view.backgroundColor = [ANYColor colorWithHexString:colorString];
    
    return vc;

}

/**
 *@brief 创建控制器
 *@param name string 控制器名
 *@return 返回UIViewController
 */
+ (UIViewController *)createViewControllerWithName:(NSString *)name{

    Class cls = NSClassFromString(name);
    return [[cls alloc] init];
    
}



@end
