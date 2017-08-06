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
#pragma mark -- 1

- (void)setTabBar{
    
//    _tabBarView = [[[NSBundle mainBundle] loadNibNamed:@"TabBarView" owner:self options:nil] firstObject];
    
//    _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(_tempFrame.origin.x, SCREEN_HEIGHT - _tempFrame.size.height, _tempFrame.size.width, _tempFrame.size.height)];
    
    _tabBarView = [[UIView alloc]initWithFrame:CGRectMake(0,SCREEN_HEIGHT - 49.0f,SCREEN_WIDTH,49.0f)];
    
    _tabBarView.backgroundColor = [UIColor orangeColor];
    
    NSMutableArray * modelArray = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < ITEM_COUNT; i++) {
        
        ANYTabBarItem *btn = [[ANYTabBarItem alloc]initWithFrame:CGRectMake(0 + i * (SCREEN_WIDTH/ITEM_COUNT), 0, SCREEN_WIDTH/ITEM_COUNT, 49.0f)];
        btn.backgroundColor = [UIColor greenColor];
        btn.tag = 1000 + i;
        [_tabBarView addSubview:btn];
//        [btn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
        
        NSDictionary * dic = @{@"title":_tilesArray[i], @"colorNormal":_normalColor, @"colorSeleted":_selectedColor, @"imageNameNormal":_normalImageArray[i], @"imageNameSelected":_selectedImageArray[i]};
        
        ANYTabBarModel * model = [ANYTabBarModel createTabBarModelWithDic:dic];
        [modelArray addObject:model];
        
        
    }
    
    
    for(UIView * tempView in _tabBarView.subviews ){
        
        //遍历加载在_tabBarView上的子视图
        
        if ([tempView isMemberOfClass:[ANYTabBarItem class]]) {
            
            
            ANYTabBarItem * btn = (ANYTabBarItem *)tempView;
            //对子视图进行强制类型转换 获取所以的button
            
            [btn setTabBarItemWithModel:modelArray[btn.tag-1000]];
            
            
            [btn addTarget:self action:@selector(itemClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }
        
    }
    [self.view addSubview:_tabBarView];
    
    
}
#pragma mark -- 2
- (void)setControllers{
    
    NSMutableArray * navs = [NSMutableArray array];
    
    //用枚举法创建控制器 导航控制器
    
    [_controllerArray enumerateObjectsUsingBlock:^(NSString * vcName, NSUInteger idx, BOOL *stop) {
        
        UIViewController * vc = [ANYFactory createViewControllerWithName:vcName];
        UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
        [navs addObject:nav];
        
    }];
    
    self.viewControllers = [navs copy];
    
}
#pragma mark -- 3
- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    
    [super setSelectedIndex:selectedIndex];
    
    //由Appdelegate  4tabBarView Delegate调用tabBarController: didSelectViewController:方法
    [self.delegate tabBarController:self didSelectViewController:self.viewControllers [selectedIndex]];
    
    for(UIView * tempView in _tabBarView.subviews ){
        
        //遍历加载在_tabBarView上的子视图
        
        if ([tempView isMemberOfClass:[ANYTabBarItem class]]) {
            
            
            ANYTabBarItem * btn1 = (ANYTabBarItem *)tempView;
            
            
            if(  btn1.tag - 1000 == selectedIndex){
                
                btn1.selected = YES;
                btn1.userInteractionEnabled = NO;
                
            }else{
                
                btn1.selected = NO;
                btn1.userInteractionEnabled = YES;
                //image label 默认为NO
                
            }
            
            
        }
        
    }
    
    
}
#pragma mark -- 4
- (void)itemClick:(id)sender{
    
    //通过tag值 可以定位到button位置
    ANYTabBarItem * btn = (ANYTabBarItem *)sender;
    if (btn.tag - 1000 == self.selectedIndex) {
        return;
    }
    self.selectedIndex = btn.tag - 1000;
    
    //tag值是在xib中设置的
    
    
}
#pragma mark -- 5
- (void)setTabBarViewHidden:(BOOL)hidden{
    
    _tabBarView.hidden = hidden;
    
}

#pragma mark -- 6
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
