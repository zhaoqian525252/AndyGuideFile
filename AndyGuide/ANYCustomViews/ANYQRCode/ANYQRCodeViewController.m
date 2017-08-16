//
//  ANYQRCodeViewController.m
//  AndyGuide
//
//  Created by Andy on 2017/8/15.
//  Copyright © 2017年 andy. All rights reserved.
//

#import "ANYQRCodeViewController.h"

#import "SGGenerateQRCodeVC.h"
#import "SGScanningQRCodeVC.h"
#import <AVFoundation/AVFoundation.h>
#import "SGAlertView.h"
#import <Photos/Photos.h>

@interface ANYQRCodeViewController ()

@end

@implementation ANYQRCodeViewController

-(void)viewDidLoad{

    NSArray *titleArray = @[@"生成二维码",@"扫描二维码",@"待定"];
    for (int i = 0; i < 3; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(50.0f, 100.0f + 60 * i, SCREEN_WIDTH - 50.0f*2, 30.0f)];
        btn.tag = 100 + i;
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        btn.backgroundColor = [ANYColor colorWithHexString:@"#ea5404"];
        [btn addTarget:self action:@selector(qRCodeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }

}

- (void)qRCodeBtnClick:(UIButton *)btn{

    UIButton *button = (UIButton *)btn;
    switch (button.tag - 100) {
        case 0:
            //生成二维码
            [self generateQRCode];
            
            break;
        case 1:
            //扫描二维码
            [self scanningQRCode];
            
            break;
        case 2:
            //待定
            
            
            break;
            
        default:
            break;
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}


- (void)generateQRCode{
    SGGenerateQRCodeVC *VC = [[SGGenerateQRCodeVC alloc] init];
    
    [self.navigationController pushViewController:VC animated:YES];
}

- (void)scanningQRCode{
    // 1、 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        // 判断授权状态
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if (status == PHAuthorizationStatusRestricted) { // 因为家长控制, 导致应用无法方法相册(跟用户的选择没有关系)
            NSLog(@"因为系统原因, 无法访问相册");
        } else if (status == PHAuthorizationStatusDenied) { // 用户拒绝当前应用访问相册
            SGAlertView *alertView = [SGAlertView alertViewWithTitle:@"⚠️ 警告" delegate:nil contentTitle:@"请去-> [设置 - 隐私 - 照片 - SGQRCodeExample] 打开访问开关" alertViewBottomViewType:(SGAlertViewBottomViewTypeOne)];
            [alertView show];
        } else if (status == PHAuthorizationStatusAuthorized) { // 用户允许当前应用访问相册
            SGScanningQRCodeVC *scanningQRCodeVC = [[SGScanningQRCodeVC alloc] init];
            [self.navigationController pushViewController:scanningQRCodeVC animated:YES];
        } else if (status == PHAuthorizationStatusNotDetermined) { // 用户还没有做出选择
            // 弹框请求用户授权
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                if (status == PHAuthorizationStatusAuthorized) { // 用户点击了好
                    
                }
            }];
        }
        
    } else {
        
        SGAlertView *alertView = [SGAlertView alertViewWithTitle:@"⚠️ 警告" delegate:nil contentTitle:@"未检测到您的摄像头, 请在真机上测试" alertViewBottomViewType:(SGAlertViewBottomViewTypeOne)];
        [alertView show];
        
        //        // 1、初始化UIAlertController
        //        UIAlertController *aC = [UIAlertController alertControllerWithTitle:@"⚠️ 警告" message:@"未检测到您的摄像头, 请在真机上测试" preferredStyle:UIAlertControllerStyleAlert];
        //
        //        // 2.设置UIAlertAction样式
        //        UIAlertAction *sureAc = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //
        //        }];
        //
        //        [aC addAction:sureAc];
        //        // 3.显示alertController:presentViewController
        //        [self presentViewController:aC animated:YES completion:nil];
    }
}


@end
