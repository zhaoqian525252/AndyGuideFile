//
//  ANYBaseAppDelegate.m
//  AndyGuide
//
//  Created by Andy on 2017/8/6.
//  Copyright © 2017年 andy. All rights reserved.
//

#import "ANYBaseAppDelegate.h"

#import "TestViewController.h"

#import "ANYTabBarViewController.h"

@interface ANYBaseAppDelegate()<UITabBarControllerDelegate>
@property (nonatomic,retain) ANYTabBarViewController * tabBarView;
@end

@implementation ANYBaseAppDelegate

@synthesize tabBarView = _tabBarView;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
//    TestViewController * vc = [[TestViewController alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
//    _window.rootViewController = nav;
    
    self.window.rootViewController = [self setTabBarController];
    
    [_window makeKeyAndVisible];
    
    
    
    return YES;
}

#pragma mark -- 1创建分栏控制器


- (ANYTabBarViewController *)setTabBarController{
    
    NSArray * controllers = @[@"MainViewController", @"MessageViewController", @"AmusementViewController", @"SettingViewController"];
    
    NSArray * titles = @[@"首页", @"消息", @"娱乐", @"设置"];
    
    NSArray * normals = @[@"cooperation_icon_normal", @"mine_icon_normal", @"report_icon_normal", @"remoney_icon_normal"];
    
    NSArray * selecteds = @[@"cooperation_icon_selected", @"mine_icon_selected", @"report_icon_selected", @"remoney_icon_selected"];
    
    UIColor * normal = [UIColor lightGrayColor];
    UIColor * selected = [UIColor colorWithRed:56/255.0 green:21/255.6 blue:96/255.0 alpha:1];
    
    //创建TabBarViewController
    _tabBarView = [[ANYTabBarViewController alloc]initWithControllers:controllers andTitles:titles andNormalImages:normals andSelectedImages:selecteds andNormalColor:normal andSelectedColor:selected];

    [_tabBarView setTabBar];

    [_tabBarView setControllers];
    
    [_tabBarView setTabBarFrame:CGRectMake(0, 149.0f, SCREEN_WIDTH, 49.0f)];
    
    _tabBarView.delegate = self;
    
    return _tabBarView;
    
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{

    NSLog(@"%ld",(long)tabBarController.selectedIndex);
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
