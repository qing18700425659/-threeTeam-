//
//  advertisement.h
//  JiaXingNews
//
//  Created by DC-002 on 16/6/22.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface advertisement : NSObject
@property(nonatomic,strong)NSString *commonwealid;
@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *imageurl;
+(void)getAdver;
@end
