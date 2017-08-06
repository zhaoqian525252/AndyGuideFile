//
//  ANYFactory.h
//  AndyGuide
//
//  Created by Andy on 2017/8/6.
//  Copyright © 2017年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ANYFactory : NSObject

/** 创建窗口 */
+(UIWindow *)createWindowWithColor:(UIColor *)color;

/**
 *@brief 创建控制器
 *@param name 控制器名
 *@param colorString 控制器view背景颜色
 *@return 返回UIViewController
 */
+ (UIViewController *)createViewControllerWithName:(NSString *)name backgoundColor:(NSString *)colorString;

/**
 *@brief 创建控制器
 *@param name string 控制器名
 *@return 返回UIViewController
 */
+ (UIViewController *)createViewControllerWithName:(NSString *)name;



@end
