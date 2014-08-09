//
//  MenuTableViewCell.m
//  lq
//
//  Created by  matao on 14-8-3.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MenuTableViewCell.h"

@implementation MenuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        _headView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 95, 70)];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 10, 105, 20)];
        _shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(230, 10, 30, 20)];
        _favBtn = [[UIButton alloc] initWithFrame:CGRectMake(270, 10, 30, 20)];
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 35, 375, 15)];
        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 55, 30, 20)];
        _disPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(145, 55, 30, 20)];
        _disLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(145, 55, 30, 20)];
        
        
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 75, 30, 15)];
        _countValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(145, 75, 30, 15)];
        
        _toBuyButton = [[UIButton alloc] initWithFrame:CGRectMake(205, 70, 75, 20)];
        
        
        [self addSubview:_headView];
        [self addSubview:_titleLabel];
        [self addSubview:_shareBtn];
        [self addSubview:_favBtn];
        [self addSubview:_detailLabel];
        [self addSubview:_priceLabel];
        [self addSubview:_disPriceLabel];
        [self addSubview:_disLineLabel];
        [self addSubview:_countLabel];
        [self addSubview:_countValueLabel];
        [self addSubview:_toBuyButton];
        
        
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}


-(void)fillCellByModel:(GoodsModel *)model
{
//    [super layoutSubviews];
    _model = [[GoodsModel alloc] init];
    _model = model;
    
    [_headView setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@"placeholder.png"] success:nil failure:nil];
    _titleLabel.text = _model.title;
    _detailLabel.text = _model.content;
    
    
    
    
    _priceLabel.text = _model.nowprice;
    _disPriceLabel.text = _model.originalprice;
    _countValueLabel.text = _model.sales;
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
