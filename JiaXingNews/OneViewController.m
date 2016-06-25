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
#import "DetailViewController.h"
@interface OneViewController ()<UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate>
{
    int pageNum;
    int pageId;
    NewTableViewCell *Newcell;
    ThemeTableViewCell *Themcell;
}
@property (nonatomic,strong) NSMutableArray<News *> *newsArray ;

@property(nonatomic,strong)UITableView *tableview;

@property(nonatomic,strong)NSMutableArray *newsImageAry;

@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    pageNum = 1;
    pageId = 1;
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-100) style:UITableViewStyleGrouped];
    
    //创建一个Class
    [self.tableview registerClass:[NewTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    //遵守协议
    _tableview.delegate = self;
    _tableview.dataSource = self;
    //添加
    [self.view addSubview:_tableview];

    
    
    //（通知）添加观察者（新闻列表）
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(sele:) name:@"temp" object:nil];
    //（通知）添加观察者（滚动视图）
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(seleImage:) name:@"temp1" object:nil];
    //点赞数量是否改变
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(needPraiseNum:) name:@"观察是否点赞" object:nil];
    //显示数据
    [NewsScor refreshImage:pageId];
    [News refresh:pageNum andPage:pageId];
    //下拉刷新（获取新闻列表）
    self.tableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        self.hud.label.text = @"加载中...";
        pageNum =1;
        [NewsScor refreshImage:pageId];
        [News refresh:pageNum andPage:pageId];
        
    }];
    [self.tableview.mj_header beginRefreshing];
    //上啦刷新(加载更多数据)
        self.tableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            
        [News refresh:++pageNum andPage:pageId];
    }];
}



//（通知）回调方法（新闻列表）
- ( void )sele:(NSNotification *)notification{
    [self.hud hideAnimated:YES];
    if ([notification.object isKindOfClass:[NSArray class]]) {
        if (pageNum == 1) {
            self.newsArray = [NSMutableArray array];
        }
        [self.newsArray addObjectsFromArray:notification.object];
        //数据更新
        [self.tableview reloadData];
        //停止（刷新）
        [self.tableview.mj_header endRefreshing];
       [self.tableview.mj_footer endRefreshing];
    }
    
    
}
//（通知）添加观察者（滚动视图）
- ( void )seleImage:(NSNotification *)notification{
    
    self.newsImageAry = [NSMutableArray array];
    
    [self.newsImageAry addObjectsFromArray:notification.object ];
    
    [self scroView];
    
    [self.tableview reloadData];
    
}

//是否点赞
-(void)needPraiseNum:(NSNotification *)sender{
    NSLog(@">>>%@",sender.object);
    NSArray * a=[self.newsArray valueForKey:@"praiseNum"];
    NSLog(@">>>a的职位%@",a );
}
//------轮播------
- ( void )scroView{
    //注册
    [self.tableview registerClass:[NewTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    [self.tableview registerClass:[ThemeTableViewCell class] forCellReuseIdentifier:@"NewCell"];
    //给tableView设置头部动画
    self.tableview.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    //滚动视图的类库
    SDCycleScrollView *scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200) delegate:self placeholderImage:[UIImage imageNamed:@"002"]];
    
    //风格(页面控制风格)
    scrollView.pageControlAliment=SDCycleScrollViewPageContolAlimentRight;
    //网络获取图片
    scrollView.imageURLStringsGroup = [self.newsImageAry valueForKey:@"imageurl"];
    //获取图片标题
    scrollView.titlesGroup=[self.newsImageAry valueForKey:@"title"];
  
    scrollView.titleLabelHeight = 30;
    [self.tableview.tableHeaderView addSubview:scrollView];
    
}

//------行数------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.newsArray.count;
    
}

//------绘制Cell------
- ( UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (pageId == 7) {
       Themcell = [tableView dequeueReusableCellWithIdentifier:@"NewCell"];
        //取数据
        News *news = self.newsArray[indexPath.row];
        //设置图片视图

        [Themcell.newsImage setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"001"]];
        Themcell.name.text = news.title;//标题
        
        NSString *time = news.issuestime;//时间
       
        NSRange range = {5,time.length-5};
        
       Themcell.time.text = [time substringWithRange:range];
        [Themcell sizeToFit];
        
        return Themcell;
        
    }else{
    
        Newcell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        //取数据
        News *news = self.newsArray[indexPath.row];
        
        [Newcell.newsImage setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"002"]];
        
        Newcell.name.text = news.title;
        
        Newcell.comment.text = [NSString stringWithFormat:@"%@",news.browseNum];
        
        Newcell.laud.text = [NSString stringWithFormat:@"%@",news.praiseNum];
        
        NSString *time = news.issuestime;
        
        NSRange range = {5,time.length-5};
        
        Newcell.time.text = [time substringWithRange:range];
        [Newcell sizeToFit];
       
        return Newcell;
    }
    
}

//------设置行高------
- ( CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(pageId ==7){
    
        return 200;
        
    }else{
        
        return 80;
        
    }
}
//设置新闻分类
- ( void )setPage:(int)page{
    [self.tableview.mj_header beginRefreshing];
    pageId = page;
    
}

//点击跳页
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    News *new=self.newsArray[indexPath.row];
    
    DetailViewController *newController=[self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];

    [newController setParams:@{
                        @"newsId":new.newsId,
                        @"categoryFk":@(pageId),
                        @"pageNum":@(indexPath.row)
                        }];
    [self.navigationController pushViewController:newController animated:YES];
    self.pagen=indexPath.row;

}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"通知" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

@end
