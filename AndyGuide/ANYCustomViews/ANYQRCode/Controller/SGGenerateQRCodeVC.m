//
//  SGGenerateQRCodeVC.m
//  SGQRCodeExample
//
//  Created by Sorgle on 16/8/25.
//  Copyright © 2016年 Sorgle. All rights reserved.
//
//  - - - - - - - - - - - - - - 交流QQ：1357127436 - - - - - - - - - - - - - - - //
//
//  - - 如在使用中, 遇到什么问题或者有更好建议者, 请于 kingsic@126.com 邮箱联系 - - - - //
//  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
//  - - GitHub下载地址 https://github.com/kingsic/SGQRCode.git - - - - - - - - - //
//
//  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //

#import "SGGenerateQRCodeVC.h"
#import "SGQRCodeTool.h"

@interface SGGenerateQRCodeVC ()

@end

@implementation SGGenerateQRCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.87 alpha:1.0];
    
    // 生成二维码(Default)
    [self setupGenerateQRCode];
    
    // 生成二维码(中间带有图标)
    [self setupGenerate_Icon_QRCode];
    
    // 生成二维码(彩色)
    [self setupGenerate_Color_QRCode];

}

// 生成二维码
- (void)setupGenerateQRCode {

    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = imageViewW;
    CGFloat imageViewX = (self.view.frame.size.width - imageViewW) / 2;
    CGFloat imageViewY = 80;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    // 2、将CIImage转换成UIImage，并放大显示
    imageView.image = [SGQRCodeTool SG_generateWithDefaultQRCodeData:@"http://www.baidu.com" imageViewWidth:imageViewW];
    
#pragma mark - - - 模仿支付宝二维码样式（添加用户头像）
    CGFloat scale = 0.22;
    CGFloat borderW = 2;
    UIView *borderView = [[UIView alloc] init];
    CGFloat borderViewW = imageViewW * scale;
    CGFloat borderViewH = imageViewH * scale;
    CGFloat borderViewX = 0.5 * (imageViewW - borderViewW);
    CGFloat borderViewY = 0.5 * (imageViewH - borderViewH);
    borderView.frame = CGRectMake(borderViewX, borderViewY, borderViewW, borderViewH);
    borderView.layer.borderWidth = borderW;
    borderView.layer.borderColor = [UIColor purpleColor].CGColor;
    borderView.layer.cornerRadius = 10;
    borderView.layer.masksToBounds = YES;
    borderView.layer.contents = (id)[UIImage imageNamed:@"QRImage"].CGImage;

    [imageView addSubview:borderView];
}

#pragma mark - - - 中间带有图标二维码生成
- (void)setupGenerate_Icon_QRCode {
    
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 150;
    CGFloat imageViewH = imageViewW;
    CGFloat imageViewX = (self.view.frame.size.width - imageViewW) / 2;
    CGFloat imageViewY = 240;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    CGFloat scale = 0.2;
    
    // 2、将最终合得的图片显示在UIImageView上
    imageView.image = [SGQRCodeTool SG_generateWithLogoQRCodeData:@"http://www.baidu.com" logoImageName:@"QRImage" logoScaleToSuperView:scale];
    
}

#pragma mark - - - 彩色图标二维码生成
- (void)setupGenerate_Color_QRCode {
    
    // 1、借助UIImageView显示二维码
    UIImageView *imageView = [[UIImageView alloc] init];
    CGFloat imageViewW = 100;
    CGFloat imageViewH = imageViewW;
    CGFloat imageViewX = (self.view.frame.size.width - imageViewW) / 2;
    CGFloat imageViewY = 400;
    imageView.frame =CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
    [self.view addSubview:imageView];
    
    // 2、将二维码显示在UIImageView上
    imageView.image = [SGQRCodeTool SG_generateWithColorQRCodeData:@"http://www.baidu.com" backgroundColor:[CIColor colorWithRed:0 green:0 blue:0] mainColor:[CIColor colorWithRed:0 green:0 blue:0]];
    //https://github.com/kingsic
}



@end



