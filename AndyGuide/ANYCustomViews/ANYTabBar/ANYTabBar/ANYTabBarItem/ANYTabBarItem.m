//
//  ANYTabBarItem.m
//  AndyGuide
//
//  Created by Andy on 2017/8/6.
//  Copyright © 2017年 andy. All rights reserved.
//

#import "ANYTabBarItem.h"

#import "ANYTabBarModel.h"

@implementation ANYTabBarItem


//设置Item
- (void)setTabBarItemWithModel:(ANYTabBarModel *)model{
    
    //title
    [self setTitle:model.title forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize: 14.0f];
    [self setTitleColor:model.colorNormal forState:UIControlStateNormal];
    [self setTitleColor:model.colorSeleted forState:UIControlStateHighlighted];
    [self setTitleColor:model.colorSeleted forState:UIControlStateSelected];
    
    //image
    UIImage * image0 = [UIImage imageNamed:model.imageNameNormal];
    UIImage * imageNew0 = [image0 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self setImage:imageNew0 forState:UIControlStateNormal];
    
    UIImage * image = [UIImage imageNamed:model.imageNameSelected];
    UIImage * imageNew = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self setImage:imageNew forState:UIControlStateHighlighted];
    [self setImage:imageNew forState:UIControlStateSelected];
    
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.tintColor = [UIColor clearColor];
    
}

#pragma mark -- 设置titleLabel显示的位置
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    return CGRectMake(0, contentRect.size.height-21.0f, contentRect.size.width, 21.0f);
}

#pragma mark -- 设置image显示的位置 
//必须使用setImage才会被调用 而不是setBackgroundImage
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
//    return CGRectMake(0, 5.0f, contentRect.size.width, contentRect.size.height - 25.0f);
    return CGRectMake((contentRect.size.width - 20.0f)/2.0f,(contentRect.size.height - 25.0f - 20.0f)/2.0f + 2.0f,20.0f,20.0f);
}

@end
