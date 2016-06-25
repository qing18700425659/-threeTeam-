//
//  NotiTableViewCell.m
//  JiaXingNews
//
//  Created by DC-002 on 16/6/23.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "NotiTableViewCell.h"

@implementation NotiTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self = [[[NSBundle mainBundle]loadNibNamed:@"NotiTableViewCell" owner:self options:nil] lastObject];
    }
    return self;
}


@end
