//
//  CartTableViewCell.m
//  lq
//
//  Created by 马涛 on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CartTableViewCell.h"

@implementation CartTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _headView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 95, 70)];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 10, 105, 20)];
        _selectBtn = [[UIImageView alloc] initWithFrame:CGRectMake(270, 10, 30, 20)];
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 35, 375, 15)];
        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 55, 30, 20)];
        _disPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(145, 55, 30, 20)];
        _disLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(145, 55, 30, 20)];
        
        
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 75, 30, 15)];
        _countValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(145, 75, 30, 15)];
        
        _sumLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 75, 30, 15)];
        _sumValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 75, 30, 15)];
        
        
        _model = [[ShoppingCartItemModel alloc] init];
        
        _selectStatus = 0;
        
        
        [self addSubview:_headView];
        [self addSubview:_titleLabel];
        [self addSubview:_selectBtn];
        [self addSubview:_detailLabel];
        [self addSubview:_priceLabel];
        [self addSubview:_disPriceLabel];
        [self addSubview:_disLineLabel];
        [self addSubview:_countLabel];
        [self addSubview:_countValueLabel];
        [self addSubview:_sumLabel];
        [self addSubview:_sumValueLabel];
        
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
-(void)fillCellByModel:(ShoppingCartItemModel *)model
{
    _model = model;
    
    [_headView setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
    _titleLabel.text = _model.title;
    _detailLabel.text = _model.mydescription;
    _priceLabel.text = _model.nowPrice;
    _disPriceLabel.text = _model.originalPrice;
    _countValueLabel.text = _model.totalPrice;
    _sumValueLabel.text = _model.num;
}



-(void)changeSelectStatus
{
    if (_selectStatus == 0) {
        _selectStatus = 1;
//        [_selectBtn setBackgroundImage:[UIImage imageNamed:@"MessageEntryInputField.png"] forState:UIControlStateNormal];
        
        _selectBtn.image =[UIImage imageNamed:@"MessageEntryInputField.png"];
    }
    else
    {
        _selectStatus = 0;
        _selectBtn.image =[UIImage imageNamed:@"MessageEntrySendButton.png"];
//        [_selectBtn setBackgroundImage:[UIImage imageNamed:@"MessageEntrySendButton.png"] forState:UIControlStateNormal];
    }
    
    
    
}

@end
