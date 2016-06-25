//
//  Noti.m
//  JiaXingNews
//
//  Created by DC-002 on 16/6/23.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "Noti.h"
#import "AFNetworking.h"
#import "MJExtension.h"
@implementation Noti
+ ( void )refreshImage{
    
    [[[self class]alloc]postImageData];
    
}

- ( void )postImageData{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *url = @"http://jxwm.gkmm.net:8989/news/announ/getAnnouncement.do";
    
    NSDictionary *dict = @{@"pageNum":@1};
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    //------用Post请求------
    [manager POST:url
     
       parameters:dict
     
         progress:nil
     
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              //判断结果是否请求成功
              if ([responseObject[@"result"] isEqualToNumber:@0]) {
                  NSMutableArray * array =[NSMutableArray arrayWithArray:[Noti mj_objectArrayWithKeyValuesArray:responseObject[@"data"]]];
                  [[NSNotificationCenter defaultCenter]postNotificationName:@"temp8" object: array];
                  
              }else{
                  
               
                  
              }
              
              
          } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              
             
              
          }];
    
}
@end
