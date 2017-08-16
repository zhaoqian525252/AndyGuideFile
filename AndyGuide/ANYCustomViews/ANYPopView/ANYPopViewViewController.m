//
//  ANYPopViewViewController.m
//  AndyGuide
//
//  Created by Andy on 2017/8/15.
//  Copyright © 2017年 andy. All rights reserved.
//

#import "ANYPopViewViewController.h"

@interface ANYPopViewViewController ()

@end

@implementation ANYPopViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *titleArray = @[@"系统弹出菜单",@"自定义弹出菜单",@"系统提示框",@"自定义提示框"];
    for (int i = 0; i < titleArray.count; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50.0f, 100.0f + 60 * i, SCREEN_WIDTH - 50.0f*2, 30.0f)];
        btn.tag = 100 + i;
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [ANYColor colorWithHexString:@"#ea5404"];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    
}


-(void)btnClick:(UIButton *)button{
    
    if (button.tag - 100 == 0) {
        //退出登录
        //NSLog(@"NSHomeDirectory() --%@",NSHomeDirectory());
        
        UIAlertController *alertContoller = [UIAlertController alertControllerWithTitle:@"系统弹出菜单" message:@"12121" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"取消!!!");
        }];
        [cancelAction setValue:[ANYColor colorWithHexString:@"#333333"] forKey:@"_titleTextColor"];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"成功!!!");
            
            
        }];
        [alertContoller addAction:cancelAction];
        [alertContoller addAction:okAction];
        [self presentViewController:alertContoller animated:YES completion:nil];
        
    }else if (button.tag - 100 == 1){
    
    
    }else if (button.tag - 100 ==2 ){
        
        UIAlertController *alertContoller = [UIAlertController alertControllerWithTitle:@"系统提示框" message:@"34343" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"取消!!!");
        }];
        [cancelAction setValue:[ANYColor colorWithHexString:@"#333333"] forKey:@"_titleTextColor"];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"成功!!!");
            
            
        }];
        [alertContoller addAction:cancelAction];
        [alertContoller addAction:okAction];
        [self presentViewController:alertContoller animated:YES completion:nil];
    
    
    }else if (button.tag - 100 == 3){
    
    
    }
    

    
    
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
