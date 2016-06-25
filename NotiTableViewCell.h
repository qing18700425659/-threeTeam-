//
//  NotiTableViewCell.h
//  JiaXingNews
//
//  Created by DC-002 on 16/6/23.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotiTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *body;
@property (weak, nonatomic) IBOutlet UILabel *time;
@end
