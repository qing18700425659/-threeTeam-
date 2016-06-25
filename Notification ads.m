//
//  Notification ads.m
//  JiaXingNews
//
//  Created by DC-002 on 16/6/22.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "Notification ads.h"
#import "Noti.h"
#import "NotiTableViewCell.h"
@interface Notification_ads ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableview;

@property(nonatomic,strong)NSMutableArray *ary;

@property(nonatomic,strong)NSArray *timeAry;
@end


@implementation Notification_ads

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    
    //创建一个Class
    [self.tableview registerClass:[NotiTableViewCell class] forCellReuseIdentifier:@"Cell"];
    //通知中心添加观察者
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(seleImage:) name:@"temp8" object:nil];
    [Noti refreshImage];
    //遵守协议
    _tableview.delegate = self;
    
    _tableview.dataSource = self;
    
    [self.view addSubview:_tableview];
    
    _timeAry = @[@"2014-07-10 06:53:00",@"2013-11-22 11:11:41",@"2013-07-01 09:41:48"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

- ( CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 110;
}

//绘制cell
- ( UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NotiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    Noti *an = self.ary[indexPath.row];
    
    cell.name.text = an.title;
    
    cell.body.text = an.content;
    
    cell.time.text = [NSString stringWithFormat:@"%@",self.timeAry[indexPath.row]];
    
    return cell;
    
}

- ( CGFloat )tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 2;
}

- ( void )seleImage:(NSNotification *)notification{
    
    self.ary = [NSMutableArray array];
    
    [self.ary addObjectsFromArray:notification.object ];
    
    [self.tableview reloadData];
    
}
@end
