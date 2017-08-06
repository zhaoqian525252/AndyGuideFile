//
//  ANYTabBarModel.h
//  AndyGuide
//
//  Created by Andy on 2017/8/6.
//  Copyright © 2017年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ANYTabBarModel : NSObject

@property (nonatomic,copy)NSString * title;

@property (nonatomic,retain)UIColor * colorNormal;

@property (nonatomic,retain)UIColor * colorSeleted;

@property (nonatomic,copy)NSString * imageNameNormal;

@property (nonatomic,copy)NSString * imageNameSelected;

+ (ANYTabBarModel *)createTabBarModelWithDic:(NSDictionary *)dic;
@end
