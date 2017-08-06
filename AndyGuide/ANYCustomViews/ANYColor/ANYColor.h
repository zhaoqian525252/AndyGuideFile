//
//  ANYColor.h
//  AndyGuide
//
//  Created by Andy on 2017/8/6.
//  Copyright © 2017年 andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ANYColor : NSObject

+(UIColor *)colorWithHexString:(NSString *)hexString;
+(UIColor *)colorWithR:(float)red G:(float)green B:(float)blue;
@end
