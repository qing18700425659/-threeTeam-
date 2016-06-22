//
//  HUDViewController.m
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/12.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "HUDViewController.h"

@interface HUDViewController ()

@end

@implementation HUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    //------显示文字------
    hud.label.text = @"加载中...";
    
    //------隐藏HUD进度条3秒------
    [hud hideAnimated:YES afterDelay:3];
    
    //------显示自定义图片------
//    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2"]];
//    
//    hud.mode = MBProgressHUDModeCustomView;
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
