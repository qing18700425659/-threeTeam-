//
//  NewsScor.h
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/8.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsScor : NSObject
@property (nonatomic,strong) AFHTTPSessionManager *manager;
@property (nonatomic,strong) NSNumber * flashId;
@property (nonatomic,strong) NSString * imageurl;
@property (nonatomic,strong) NSString * link;
@property (nonatomic,strong) NSString * title;
+ ( void )refreshImage:(int)page;
@end
