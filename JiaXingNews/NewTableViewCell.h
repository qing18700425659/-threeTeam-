//
//  NewTableViewCell.h
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/4.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *laud;
@property (weak, nonatomic) IBOutlet UILabel *comment;
@end
