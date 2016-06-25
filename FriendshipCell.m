//
//  FriendshipCell.m
//  JiaXingNews
//
//  Created by DC-002 on 16/6/22.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "FriendshipCell.h"

@implementation FriendshipCell

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        NSArray *array=[[NSBundle mainBundle]loadNibNamed:@"FriendshipCell" owner:self options:nil];
        self=array[0];
        _viewView.layer.borderWidth=1;
        _viewView.layer.cornerRadius=20;
        _viewView.layer.borderColor=[[UIColor blackColor]CGColor];
        _viewView.backgroundColor=[UIColor whiteColor];
    }
    return self;

}

@end
