//
//  ThemeTableViewCell.m
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/21.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "ThemeTableViewCell.h"

@implementation ThemeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//------重写------
- ( id )initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"ThemeTableViewCell" owner:self options:nil] lastObject];
        
        //圆角
        self.newsImage.layer.cornerRadius = 10;
        
        //倒角+
        
        self.newsImage.clipsToBounds = YES;
        
    }
    
    return self;
}

@end
