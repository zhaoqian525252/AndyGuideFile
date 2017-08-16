//
//  MainViewController.m
//  AndyGuide
//
//  Created by Andy on 2017/8/6.
//  Copyright © 2017年 andy. All rights reserved.
//

#import "MainViewController.h"
#import "ANYQRCodeViewController.h"
#import "ANYEffectViewController.h"
#import "ANYPopViewViewController.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tv;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation MainViewController

-(void)setDataArray:(NSMutableArray *)dataArray{

    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"返回";
    self.navigationItem.backBarButtonItem = backItem;
    
    _dataArray = [NSMutableArray arrayWithObjects:@"二维码",@"模糊效果",@"弹出菜单", nil];
    
    _tv = [[UITableView alloc]initWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT - 49.0f) style:UITableViewStylePlain];
    _tv.delegate = self;
    _tv.dataSource = self;
    _tv.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//    _tv.backgroundColor = [UIColor redColor];
    [self.view addSubview:_tv];
    
    [_tv registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CELL_ID"];
    

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL_ID"];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    NSLog(@"---%@",_dataArray[indexPath.row]);
    return cell;
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int rowNumber = (int)indexPath.row;
    
    if (rowNumber == 0) {
        //二维码
        ANYQRCodeViewController *vc = [[ANYQRCodeViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (rowNumber == 1){
        //模糊效果
        ANYEffectViewController *vc = [[ANYEffectViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    }else if (rowNumber == 2){
        //弹出菜单
        ANYPopViewViewController *vc = [[ANYPopViewViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
    
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
