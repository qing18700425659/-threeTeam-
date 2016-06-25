//
//  NewsScor.m
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/8.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "NewsScor.h"

@implementation NewsScor

+ ( void )refreshImage:( int )page{
    
    [[[self class]alloc]postImageData:page];
    
}

- ( void )postImageData:( int )page{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = HTTP_IMAGE;
    
    NSDictionary *dict = @{@"categoryId":@(page)};
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //------用Post请求------
    [manager POST:url
     
       parameters:dict
     
         progress:nil
     
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              //判断结果是否请求成功
              if ([responseObject[@"result"] isEqualToNumber:@0]) {
                  NSMutableArray * array =[NSMutableArray arrayWithArray:[NewsScor mj_objectArrayWithKeyValuesArray:responseObject[@"data"]]];
                   [[NSNotificationCenter defaultCenter]postNotificationName:@"temp1" object: array];
                  
              }else{
                  
                  
              }
              
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
            
              
          }];
    
}


@end
