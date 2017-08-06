//
//  ANYTabBarModel.m
//  AndyGuide
//
//  Created by Andy on 2017/8/6.
//  Copyright © 2017年 andy. All rights reserved.
//

#import "ANYTabBarModel.h"

@implementation ANYTabBarModel
@synthesize title = _title;
@synthesize colorNormal = _colorNormal;
@synthesize colorSeleted = _colorSeleted;
@synthesize imageNameNormal = _imageNameNormal;
@synthesize imageNameSelected = _imageNameSelected;

+ (ANYTabBarModel *)createTabBarModelWithDic:(NSDictionary *)dic{
    
    ANYTabBarModel * model = [[ANYTabBarModel alloc]init];
    [model setValuesForKeysWithDictionary:dic];
    
    return model;
}

@end
