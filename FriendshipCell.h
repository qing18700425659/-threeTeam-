//
//  FriendshipCell.h
//  JiaXingNews
//
//  Created by DC-002 on 16/6/22.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendshipCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *number;

@property (weak, nonatomic) IBOutlet UILabel *chinese;
@property (weak, nonatomic) IBOutlet UILabel *english;
@property (weak, nonatomic) IBOutlet UIView *viewView;

@end
