//
//  CustomTableViewCell.m
//  TableView
//
//  Created by mac on 16/3/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.likeBut = [[CustomBut alloc] initWithFrame:CGRectZero];
        [self addSubview:self.likeBut];
        
    }
    return self;
}

- (void)layoutSubviews
{
    [self.likeBut setFrame:CGRectMake(10, 10, 50, 30)];
    [self.likeBut setTitle:@"点赞" forState:UIControlStateNormal];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
