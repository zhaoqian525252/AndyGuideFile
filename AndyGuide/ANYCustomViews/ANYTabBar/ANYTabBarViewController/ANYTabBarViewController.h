//
//  ANYTabBarViewController.h
//  AndyGuide
//
//  Created by Andy on 2017/8/6.
//  Copyright © 2017年 andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANYTabBarViewController : UITabBarController
/** 字体颜色 */
@property (nonatomic,retain)UIColor * normalColor;

@property (nonatomic,retain)UIColor * selectedColor;

@property (nonatomic,retain)NSMutableArray *tilesArray;

@property (nonatomic,retain)NSMutableArray * normalImageArray;

@property (nonatomic,retain)NSMutableArray * selectedImageArray;

@property (nonatomic,retain)NSMutableArray * controllerArray;


- (instancetype)initWithControllers:(NSArray *)controllers andTitles:(NSArray *)titles andNormalImages:(NSArray *)normalImages andSelectedImages:(NSArray *)selectedImages andNormalColor:(UIColor *)normalColor andSelectedColor:(UIColor *)selectedColor;

- (void)setTabBarFrame:(CGRect)frame;

- (void)setTabBar;

- (void)setControllers;

- (void)setTabBarViewHidden:(BOOL)hidden;

- (float)getTabBarHeight;

@end
