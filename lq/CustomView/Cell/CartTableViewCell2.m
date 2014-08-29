//
//  CartTableViewCell2.m
//  lq
//
//  Created by 马涛 on 14-8-29.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CartTableViewCell2.h"

@implementation CartTableViewCell2

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.headView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 95, 70)];
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 10, 105, 20)];
        self.selectBtn = [[UIImageView alloc] initWithFrame:CGRectMake(270, 10, 20, 20)];
        self.detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 30, 175, 15)];
        
        self.priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 45, 50, 20)];
        self.disPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 45, 30, 20)];
        self.disLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 45, 30, 20)];
        
        
        self.countLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 65, 30, 15)];
        self.countValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(145, 65, 30, 15)];
        
        self.sumLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 65, 30, 15)];
        self.sumValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 65, 60, 15)];
        
        
        self.model = [[ShoppingCartItemModel alloc] init];
        
        
        self.selectBtn.image =[UIImage imageNamed:@"MessageEntrySendButton.png"];
        
        UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(10, 5, 300, 90)];
        
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.detailLabel.font = [UIFont systemFontOfSize:12];
        
        self.priceLabel.font = [UIFont systemFontOfSize:16];
        self.disPriceLabel.font = [UIFont systemFontOfSize:12];
        self.countLabel.font = [UIFont systemFontOfSize:12];
        self.countValueLabel.font = [UIFont systemFontOfSize:12];
        self.sumLabel.font = [UIFont systemFontOfSize:12];
        self.sumValueLabel.font = [UIFont systemFontOfSize:12];
        
        [tempView addSubview:self.headView];
        [tempView addSubview:self.titleLabel];
        [tempView addSubview:self.selectBtn];
        [tempView addSubview:self.detailLabel];
        [tempView addSubview:self.priceLabel];
        [tempView addSubview:self.disPriceLabel];
        [tempView addSubview:self.disLineLabel];
        [tempView addSubview:self.countLabel];
        [tempView addSubview:self.countValueLabel];
        [tempView addSubview:self.sumLabel];
        [tempView addSubview:self.sumValueLabel];
        
        tempView.backgroundColor = [UIColor whiteColor];
        [self addSubview:tempView];
        
        self.backgroundColor = BackGray;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
