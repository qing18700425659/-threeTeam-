//
//  ViewController.m
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/3.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"


@interface ViewController ()<YSLContainerViewControllerDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBarController.tabBar.tintColor = [UIColor redColor];
    NSArray *ary = @[@"文明播报",@"道德模范",@"文明创建",@"志愿服务",@"未成年人",@"区县传真",@"主题活动",@"我们的节目"];

    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<ary.count; i++) {
        OneViewController *oneVC = [self.storyboard instantiateViewControllerWithIdentifier:@"OneViewController"];
        oneVC.title = [NSString stringWithFormat:@"%@",ary[i]];
        [array addObject:oneVC];
    }
    
    
    YSLContainerViewController *cvc = [[YSLContainerViewController alloc]initWithControllers:array topBarHeight:20 parentViewController:self];
    cvc.delegate = self;
    cvc.menuItemTitleColor = [UIColor blackColor];
    cvc.menuItemSelectedTitleColor = [UIColor whiteColor];
    cvc.menuIndicatorColor = [UIColor redColor];
    cvc.menuBackGroudColor = [UIColor colorWithRed:1.00 green:0.91 blue:0.73 alpha:1.00];
    [self.view addSubview:cvc.view];
}

- ( void )containerViewItemIndex:(NSInteger)index currentController:(OneViewController *)controller
{
    [controller setPage:(int)index+1];
}

@end
