//
//  advertisementViewController.m
//  JiaXingNews
//
//  Created by DC-002 on 16/6/22.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "advertisementViewController.h"
#import "SDCollectionViewCell.h"
#import "AFHTTPSessionManager.h"
#import "MBProgressHUD.h"
#import "advertisement.h"
#import "Masonry.h"
@interface advertisementViewController ()<SDCycleScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView *scroll;
@property(nonatomic,strong)NSMutableArray<advertisement *> *array;
@end

@implementation advertisementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //实例化滚动视图，设置代理与站位图片
    self.scroll=[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-110) delegate:self placeholderImage:[UIImage imageNamed:@"002"]];
    self.automaticallyAdjustsScrollViewInsets=YES;
     [advertisement getAdver];//调用数据请求的类方法
    [self.view addSubview:self.scroll];//添加视图
    
//1、添加通知检查者
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(guanggao:) name:@"通知" object:nil];
    
}
//2、回调方法
-(void)guanggao:(NSNotification *)noti{
    if ([noti.object isKindOfClass:[NSArray class]]) {
        //数组接收值
        NSArray<advertisement *> *array=noti.object;
        self.scroll.imageURLStringsGroup=[array valueForKey:@"imageurl"];//设置滚动视图的图片组
        self.scroll.titlesGroup=[array valueForKey:@"title"];//设置文字组
        self.scroll.titleLabelHeight=60;//设置lable的高度值
        self.scroll.autoScrollTimeInterval=2.0f;//设置滚动视图的播放的间隙时间
    }
 
}

-(void)dealloc{
    //取消通知
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"通知" object:nil];
    //取消观察者
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
