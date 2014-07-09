//
//  DiscountTableViewCell.m
//  lq
//
//  Created by 马涛 on 14-6-20.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "DiscountTableViewCell.h"

@implementation DiscountTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier andModel:(NSDictionary *)dic
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
