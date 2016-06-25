//
//  advertisement.m
//  JiaXingNews
//
//  Created by DC-002 on 16/6/22.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "advertisement.h"
#import "advertisementViewController.h"
@implementation advertisement
+(void)getAdver{
    [[[self class]alloc]getAdver];
}
-(void)getAdver{
    
    //管理上下文
    AFHTTPSessionManager *manger=[AFHTTPSessionManager manager];
    //网络接口
    //参数
    //进度条
    //post请求数据
    [manger POST:http_guanggao parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if ([responseObject[@"result"]isEqualToNumber:@0]) {
            //通知post
            [[NSNotificationCenter defaultCenter]postNotificationName:@"通知" object:responseObject[@"data"]];
           
        }else{
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}

@end
