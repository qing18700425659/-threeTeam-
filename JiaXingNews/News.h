//
//  News.h
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/8.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
@property (nonatomic,strong) AFHTTPSessionManager *manager;
@property (nonatomic,strong) NSNumber * newsId;
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * summary;
@property (nonatomic,strong) NSString * source;
@property(nonatomic,strong)NSString *content;
@property (nonatomic,strong) NSString * image;
@property (nonatomic,strong) NSNumber * isPush;
@property (nonatomic,strong) NSNumber * isBanner;
@property (nonatomic,strong) NSNumber * praiseNum;
@property(nonatomic,assign)int praisenumber;
@property (nonatomic,strong) NSNumber * browseNum;
@property (nonatomic,strong) NSString * issuestime;

+ ( void )refresh:( int )pageNum andPage:( int )page;

@property(nonatomic,strong)NSArray *arraynum;
@end
