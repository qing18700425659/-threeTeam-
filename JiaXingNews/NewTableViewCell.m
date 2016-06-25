//
//  NewTableViewCell.m
//  JiaXingNews
//
//  Created by DC20160426 on 16/6/4.
//  Copyright © 2016年 DC20160426. All rights reserved.
//

#import "NewTableViewCell.h"

@implementation NewTableViewCell
-(void)awakeFromNib{
    self.praiseNumber=0;
    
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

- (IBAction)praiseNum:(id)sender {

    self.praiseNumber++;//点赞次数
    int b=[self.laud.text intValue];

    if (self.praiseNumber%2==1) {
        self.laud.text=[NSString stringWithFormat:@"%i",b+1];

    }else{
        if (b<=0) {
            self.laud.text=[NSString stringWithFormat:@"%i",b];

        }else {
            self.laud.text=[NSString stringWithFormat:@"%i",b-1];


        }


    }

}
@end
