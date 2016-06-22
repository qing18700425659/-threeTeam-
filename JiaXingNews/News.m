//
//  News.m
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/8.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "News.h"

@implementation News

+ ( void )refresh:( int )pageNum andPage:( int )page{

    [[[self class]alloc]postNewsData:pageNum andPage:page];

}

- ( void )postNewsData:( int )pageNum andPage:( int )page{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = HTTP_NEWS;
    
    NSDictionary *dict = @{@"categoryId":@(page),
                           @"pageNum":@(pageNum)
                           };
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //------用Post请求------
    [manager POST:url
     
       parameters:dict
     
         progress:nil
     
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              //判断结果是否请求成功
              if ([responseObject[@"result"] isEqualToNumber:@0]) {
                  
                  [[NSNotificationCenter defaultCenter]postNotificationName:@"temp" object: [News mj_objectArrayWithKeyValuesArray :responseObject[@"data"]]];
                  
              }else{
                  
                  NSLog(@"请求错误：%@",responseObject[@"message"]);
                  
              }

          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
              NSLog(@"出错了:%@",error);
              
          }];
}

@end
