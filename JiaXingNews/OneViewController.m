//
//  OneViewController.m
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/15.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "OneViewController.h"
#import "NewTableViewCell.h"
#import "ThemeTableViewCell.h"
#import "News.h"
#import "NewsScor.h"
@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>{
    int pageNum;
}
@property (nonatomic,strong) NSMutableArray<News *> *newsArray ;

@property(nonatomic,strong)UITableView *tableview;

@property(nonatomic,strong)NSMutableArray *newsImageAry;

@property(nonatomic,strong)MBProgressHUD *hud;

@property(nonatomic,assign)int page;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    pageNum = 1;
    _page = 1;
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStyleGrouped];
    
    //创建一个Class
    [self.tableview registerClass:[NewTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    //遵守协议
    _tableview.delegate = self;
    
    _tableview.dataSource = self;
    
    [self.view addSubview:_tableview];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sele:) name:@"temp" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(seleImage:) name:@"temp1" object:nil];
    
    [NewsScor refreshImage:_page];
    
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        
        self.hud.label.text = @"加载中...";
        
        pageNum = 1;
        
        [News refresh:pageNum andPage:_page];
    }];
    
    [self.tableview.mj_header beginRefreshing];
    self.tableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        [News refresh:pageNum andPage:_page];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//------轮播------
- ( void )scroView{
    
    [self.tableview registerClass:[NewTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self.tableview registerClass:[ThemeTableViewCell class] forCellReuseIdentifier:@"NewCell"];
    
    self.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 200)];
    
    SDCycleScrollView *scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, 375, 200) delegate:self placeholderImage:[UIImage imageNamed:@"1"]];
    
    //风格
    [scrollView setPageControlStyle:SDCycleScrollViewPageContolStyleAnimated];
    
    //网络获取图片
    scrollView.imageURLStringsGroup = [self.newsImageAry valueForKey:@"imageurl"];
    scrollView.titleLabelBackgroundColor = [UIColor whiteColor];
    scrollView.titlesGroup = 
    scrollView.titleLabelHeight = 100;
    [self.tableview.tableHeaderView addSubview:scrollView];
    
}

//------行数------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.newsArray.count;
    
}

//------绘制Cell------
- ( UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.page == 7) {
        ThemeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewCell"];
        //取数据
        News *news = self.newsArray[indexPath.row];
        
        [cell.newsImage setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"1"]];
        
        cell.name.text = news.title;
        
        NSString *time = news.issuestime;
        
        NSRange range = {5,time.length-5};
        
        cell.time.text = [time substringWithRange:range];
        
        return cell;
    }else{
    
        NewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        //取数据
        News *news = self.newsArray[indexPath.row];
        
        [cell.newsImage setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"1"]];
        
        cell.name.text = news.title;
        
        cell.comment.text = [NSString stringWithFormat:@"%@",news.browseNum];
        
        cell.laud.text = [NSString stringWithFormat:@"%@",news.praiseNum];
        
        NSString *time = news.issuestime;
        
        NSRange range = {5,time.length-5};
        
        cell.time.text = [time substringWithRange:range];
        
        return cell;
    }
    
}

//------设置行高------
- ( CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.page ==7){
    
        return 140;
        
    }else{
        
        return 100;
        
    }
}

- ( void )sele:(NSNotification *)notification{
    [self.hud hideAnimated:YES];
    if (pageNum == 1) {
        self.newsArray = [NSMutableArray array];
    }
    
    if ([notification.object isKindOfClass:[NSArray class]]) {
        [self.newsArray addObjectsFromArray:notification.object];
    }
    
    [self.tableview reloadData];
    
    //停止
    [self.tableview.mj_header endRefreshing];
    
    [self.tableview.mj_footer endRefreshing];
    
}

- ( void )seleImage:(NSNotification *)notification{
    
    self.newsImageAry = [NSMutableArray array];
    
    [self.newsImageAry addObjectsFromArray:notification.object ];
    
    [self scroView];
    
    [self.tableview reloadData];
    
}



- ( void )setPage:(int)page{
    _page = page;
    [self.tableview.mj_header beginRefreshing];
}

@end
