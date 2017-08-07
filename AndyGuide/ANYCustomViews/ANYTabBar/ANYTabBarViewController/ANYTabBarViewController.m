//
//  ANYTabBarViewController.m
//  AndyGuide
//
//  Created by Andy on 2017/8/6.
//  Copyright © 2017年 andy. All rights reserved.
//

#import "ANYTabBarViewController.h"

#import "ANYTabBarItem.h"
#import "ANYFactory.h"
#import "ANYTabBarModel.h"

#define ITEM_COUNT 4

@interface ANYTabBarViewController ()
@property (nonatomic,retain)UIView * tabBarView;
@property (nonatomic,assign) CGRect tempFrame;
@end

@implementation ANYTabBarViewController
@synthesize tabBarView = _tabBarView;
@synthesize tilesArray = _tilesArray;
@synthesize normalColor = _normalColor;
@synthesize selectedColor = _selectedColor;
@synthesize selectedImageArray = _selectedImageArray;
@synthesize normalImageArray = _normalImageArray;
@synthesize controllerArray = _controllerArray;

- (instancetype)initWithControllers:(NSArray *)controllers andTitles:(NSArray *)titles andNormalImages:(NSArray *)normalImages andSelectedImages:(NSArray *)selectedImages andNormalColor:(UIColor *)normalColor andSelectedColor:(UIColor *)selectedColor
{
    self = [super init];
    if (self) {
        
        _controllerArray = [NSMutableArray arrayWithArray:controllers];
        _tilesArray = [NSMutableArray arrayWithArray:titles];
        
        _normalImageArray = [NSMutableArray arrayWithArray:normalImages];
        _selectedImageArray = [NSMutableArray arrayWithArray:selectedImages];
        
        _normalColor = normalColor;
        _selectedColor = selectedColor;
        
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tabBar.hidden = YES;
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 49.0f, SCREEN_WIDTH, 49.0f)];
    
}

- (void)setTabBarFrame:(CGRect)frame{
    
    if (frame.size.height>0) {
        _tempFrame = frame;
    }else{
       _tempFrame = CGRectMake(0, SCREEN_HEIGHT - 49.0f, SCREEN_WIDTH, 49.0f);
    }
}

- (void)setTabBar{
    
    _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT - 49.0f,SCREEN_WIDTH,49.0f)];
    
    _tabBarView.backgroundColor = [ANYColor colorWithHexString:@"#F7F7F7"];
    
    UIView *underLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 1.0f)];
    underLine.backgroundColor = [ANYColor colorWithHexString:@"#d7d7d7"];
    [_tabBarView addSubview:underLine];
    
    
    NSMutableArray * modelArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < ITEM_COUNT; i++) {
        
        ANYTabBarItem *btn = [[ANYTabBarItem alloc]initWithFrame:CGRectMake(0 + i * (SCREEN_WIDTH/ITEM_COUNT), 1.0f, SCREEN_WIDTH/ITEM_COUNT, 48.0f)];
        btn.tag = 1000 + i;
        [_tabBarView addSubview:btn];
        
        if (i%2) {
            [btn badgeNumber:100];
        }
        
        NSDictionary * dic = @{@"title":_tilesArray[i], @"colorNormal":_normalColor, @"colorSeleted":_selectedColor, @"imageNameNormal":_normalImageArray[i], @"imageNameSelected":_selectedImageArray[i]};
        
        ANYTabBarModel * model = [ANYTabBarModel createTabBarModelWithDic:dic];
        [modelArray addObject:model];
        
    }
    
    for(UIView * tempView in _tabBarView.subviews ){

        
        if ([tempView isMemberOfClass:[ANYTabBarItem class]]) {
            
            ANYTabBarItem * btn = (ANYTabBarItem *)tempView;
            [btn setTabBarItemWithModel:modelArray[btn.tag-1000]];
            [btn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
    }
    [self.view addSubview:_tabBarView];
    
    
}

- (void)setControllers{
    
    NSMutableArray * navs = [NSMutableArray array];
    [_controllerArray enumerateObjectsUsingBlock:^(NSString * vcName, NSUInteger idx, BOOL *stop) {
        
        UIViewController * vc = [ANYFactory createViewControllerWithName:vcName];
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [navs addObject:nav];
        
    }];
    
    self.viewControllers = [navs copy];
    
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    
    [super setSelectedIndex:selectedIndex];

    [self.delegate tabBarController:self didSelectViewController:self.viewControllers [selectedIndex]];
    
    for(UIView * tempView in _tabBarView.subviews ){
        //遍历加载在_tabBarView上的子视图
        
        if ([tempView isMemberOfClass:[ANYTabBarItem class]]) {
            
            ANYTabBarItem * btn1 = (ANYTabBarItem *)tempView;

            if(btn1.tag - 1000 == selectedIndex){
                
                btn1.selected = YES;
                btn1.userInteractionEnabled = NO;
                
            }else{
                
                btn1.selected = NO;
                btn1.userInteractionEnabled = YES;
                
            }
            
            
        }
        
    }
    
    
}

- (void)itemClick:(id)sender{

    ANYTabBarItem * btn = (ANYTabBarItem *)sender;
    if (btn.tag - 1000 == self.selectedIndex) {
        return;
    }
    self.selectedIndex = btn.tag - 1000;
    
}

- (void)setTabBarViewHidden:(BOOL)hidden{
    
    _tabBarView.hidden = hidden;
    
}


- (float)getTabBarHeight{
    
    return self.tabBarView.frame.size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
