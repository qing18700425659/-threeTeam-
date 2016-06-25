//
//  NetWorkViewController.m
//  JiaXingNews
//
//  Created by DC-002 on 16/6/23.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "NetWorkViewController.h"
#import "Friendship link.h"
@interface NetWorkViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *web;
@property(nonatomic,strong)NSArray *titleArray;

@property(nonatomic,strong)NSMutableArray *array;
@end

@implementation NetWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
        self.view.backgroundColor=[UIColor whiteColor];
        //接收值
        NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
        //设置title标题
        _titleA.text=[def valueForKey:@"标题"];
        //赋值网址
        NSURL *url=[NSURL URLWithString:[def valueForKey:@"网址"]];
        NSURLRequest *request=[NSURLRequest requestWithURL:url];
        [_web loadRequest:request];

    

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
