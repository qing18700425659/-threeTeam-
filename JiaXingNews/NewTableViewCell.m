//
//  NewTableViewCell.m
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/4.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "NewTableViewCell.h"

@implementation NewTableViewCell

- (void)awakeFromNib {
    // Initialization code 
}

//------重写------
- ( id )initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"NewTableViewCell" owner:self options:nil] lastObject];
        
        //圆角
        self.newsImage.layer.cornerRadius = 10;
        
        //倒角
        self.newsImage.clipsToBounds = YES;
        
    }
    
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
