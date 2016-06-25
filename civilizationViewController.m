//
//  civilizationViewController.m
//  JiaXingNews
//
//  Created by DC-002 on 16/6/22.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "civilizationViewController.h"
#import "SegmentTapView.h"
#import "FlipTableView.h"
#import "QR code.h"
#import "Notification ads.h"
#import "Friendship link.h"
#import "Share friends.h"
@interface civilizationViewController ()<SegmentTapViewDelegate,FlipTableViewDelegate>

@property(nonatomic,strong)SegmentTapView *segment;

@property(nonatomic,strong)FlipTableView *flip;
@end

@implementation civilizationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *array = @[@"二维码",@"通知公告",@"友情链接",@"分享好友"];
    NSArray *imageArray = @[@"01",@"02",@"03",@"04"];
    self.segment= [[SegmentTapView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 40) withDataArray:array withFont:17 withImage:imageArray];
    self.segment.titleFont = 13;
    self.segment.delegate = self;
    [self.view addSubview:self.segment];

    QR_code *view=[self.storyboard instantiateViewControllerWithIdentifier:@"QR_code"];
    [self addChildViewController:view];
    
    Notification_ads *view1=[self.storyboard instantiateViewControllerWithIdentifier:@"Notification_ads"];
    [self addChildViewController:view1];
    
    Friendship_link *view2=[self.storyboard instantiateViewControllerWithIdentifier:@"Friendship_link"];
    [self addChildViewController:view2];
    
    Share_friends *view3=[self.storyboard instantiateViewControllerWithIdentifier:@"Share_friends"];
    [self addChildViewController:view3];
    
    
    NSArray *viewArray=@[view,view1,view2,view3];
    self.flip = [[FlipTableView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-50) withArray:viewArray];
    
    self.flip.delegate = self;
    
    [self.view addSubview:self.flip];
    
}

-(void)selectedIndex:(NSInteger)index{
    [self.flip selectIndex:index];
}
-(void)scrollChangeToIndex:(NSInteger)index{
    [self.segment selectIndex:index];
}


@end
