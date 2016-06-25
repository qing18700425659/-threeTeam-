//
//  Friendship link.m
//  JiaXingNews
//
//  Created by DC-002 on 16/6/22.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "Friendship link.h"
#import "FriendshipCell.h"
#import "Masonry.h"
#import "NetWorkViewController.h"
@interface Friendship_link ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSArray *English;
@property(nonatomic,strong)NSArray *Chinese;
@property(nonatomic,strong)NSArray *Number;
@property(nonatomic,strong)UICollectionView *cell;
@property(nonatomic,strong)NSArray *http;
@end

@implementation Friendship_link

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    _English=@[@"Jiaxing civilization network aliiance",@"Zhejiang civilization network",@"Jiaxing online",@"Zhejiang online",@"The Chinese community",@"Jinhua minor remarks",@"The red network",@"South lake civilzation network",@"Show chau civilization network",@"Compulsory labor union on Saturday",@"Tongxiang city civilization network",@"Haining civilization network",@"Jiaxing defense education network",@"Jiaxing masses education network",@"South lake youth network"];
    
    _Chinese=@[@"嘉兴文明网络联盟",@"浙江文明网",@"嘉兴在线",@"浙江在线",@"中国社区网",@"金华未成年网",@"红船网",@"南湖文明网",@"秀洲文明网",@"星期六义务劳动联盟",@"桐乡文明网",@"海宁文明网",@"嘉兴国防教育网",@"嘉兴群众路线网",@"南湖青少年王"];
    _Number=@[@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14"];
    
    _http=@[@"http://jx.wenming.cn/",
            @"http://www.zjwmw.com/",
            @"http://www.cnjxol.com/index.htm",
            @"http://www.zjol.com.cn/",
            @"http://www.cncn.org.cn/",
            @"http://www.kids21.cn/",
            @"http://www.hcyjw.cn/",
            @"http://nhnews.zjol.com.cn/nhnews/nhwm/",
            @"http://jxxznews.zjol.com.cn/xznews/xzwmw/",
            @"http://www.cnjxol.com/news/original/content/2015-04/19/content_3322958.htm",
            @"http://wmw.tx.gov.cn/web/",
            @"http://zjhn.wenming.cn/",
            @"http://gfjy.jiaxing.gov.cn/",
            @"http://www.cnjxol.com/topic/qzlx/",
            @"http://www.nhyouth.gov.cn/"];

    UICollectionViewFlowLayout *flout=[[UICollectionViewFlowLayout alloc]init];
    _cell=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-140) collectionViewLayout:flout];
    _cell.dataSource=self;
    _cell.delegate=self;
    //注册
    [_cell registerClass:[FriendshipCell class] forCellWithReuseIdentifier:@"cell"];
    _cell.backgroundColor=[UIColor whiteColor];
    //添加
    [self.view addSubview:_cell];
    
   
}
//绘制cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    FriendshipCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.chinese.text=_Chinese[indexPath.row];
    cell.english.text=_English[indexPath.row];
    cell.number.text=_Number[indexPath.row];
    return cell;
}
//九宫格个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _Number.count;
}
//尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    return CGSizeMake(self.view.frame.size.width/2-10, 120);
}
//上下左右间隙
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 5, 0, 5);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    NSUserDefaults *def=[NSUserDefaults standardUserDefaults];
    [def setObject:_Chinese[indexPath.row] forKey:@"标题"];
    [def setObject:_http[indexPath.row] forKey:@"网址"];
    [self performSegueWithIdentifier:@"jumpToNetwork" sender:nil];
    
}

@end
