//
//  ThemeTableViewCell.h
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/21.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *newsImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@end
