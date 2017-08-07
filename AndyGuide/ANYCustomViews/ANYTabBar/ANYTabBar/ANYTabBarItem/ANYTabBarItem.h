//
//  ANYTabBarItem.h
//  AndyGuide
//
//  Created by Andy on 2017/8/6.
//  Copyright © 2017年 andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ANYTabBarModel;

@interface ANYTabBarItem : UIButton
- (void)setTabBarItemWithModel:(ANYTabBarModel *)model;

/** 设置title高度 */

/** 设置图片宽度 */

/** 气泡数量 */
-(void)badgeNumber:(NSInteger)badgeNumber;

@end
