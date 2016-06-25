//
//  WWMViewController.m
//  JiaXingNews
//
//  Created by DC-002 on 16/6/22.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "WWMViewController.h"
@interface WWMViewController ()


@end

@implementation WWMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    //实例化一个webview
    UIWebView *web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    //网址
    NSURL *url=[NSURL URLWithString:@"http://weibo.com/u/2852517300?is_hot=1"];
    //添加web在控制器上
    [self.view addSubview:web];
    //请求网址
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    //在web上显示请求到的内容
    [web loadRequest:request];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
