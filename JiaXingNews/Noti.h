//
//  Noti.h
//  JiaXingNews
//
//  Created by DC-002 on 16/6/23.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Noti : NSObject
@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * content;

+ ( void )refreshImage;
@end
