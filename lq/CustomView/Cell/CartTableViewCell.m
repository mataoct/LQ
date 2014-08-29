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
        _selectBtn = [[UIImageView alloc] initWithFrame:CGRectMake(270, 10, 20, 20)];
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 30, 175, 15)];
    
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 45, 50, 20)];
        _disPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 45, 30, 20)];
        _disLineLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 45, 30, 20)];
        
        
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 65, 30, 15)];
        _countValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(145, 65, 30, 15)];
        
        _sumLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 65, 30, 15)];
        _sumValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(210, 65, 60, 15)];
        
        
        _model = [[ShoppingCartItemModel alloc] init];
        
        
        _selectBtn.image =[UIImage imageNamed:@"MessageEntrySendButton.png"];
        
        UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 90)];
        
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _detailLabel.font = [UIFont systemFontOfSize:12];
        
        _priceLabel.font = [UIFont systemFontOfSize:16];
        _disPriceLabel.font = [UIFont systemFontOfSize:12];
        _countLabel.font = [UIFont systemFontOfSize:12];
        _countValueLabel.font = [UIFont systemFontOfSize:12];
        _sumLabel.font = [UIFont systemFontOfSize:12];
        _sumValueLabel.font = [UIFont systemFontOfSize:12];
        
        [tempView addSubview:_headView];
        [tempView addSubview:_titleLabel];
        [tempView addSubview:_selectBtn];
        [tempView addSubview:_detailLabel];
        [tempView addSubview:_priceLabel];
        [tempView addSubview:_disPriceLabel];
        [tempView addSubview:_disLineLabel];
        [tempView addSubview:_countLabel];
        [tempView addSubview:_countValueLabel];
        [tempView addSubview:_sumLabel];
        [tempView addSubview:_sumValueLabel];
        
        tempView.backgroundColor = [UIColor whiteColor];
        [self addSubview:tempView];
        
        self.backgroundColor = BackGray;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
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
    
    [_headView setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@"头像-评论.png"] success:nil failure:nil];
    
//    _headView.backgroundColor = [UIColor purpleColor];
    _titleLabel.text = _model.title;
    _detailLabel.text = _model.mydescription;
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",_model.nowPrice];
    _disPriceLabel.text =  [NSString stringWithFormat:@"￥%@",_model.originalPrice];
    _countValueLabel.text = _model.num;
    
    _countLabel.text = @"数量:";
    _sumLabel.text = @"小计:";
    
    _sumValueLabel.text =[NSString stringWithFormat:@"￥%@",_model.totalPrice];
    _selectStatus = 0;
    _selectBtn.image =[UIImage imageNamed:@"MessageEntrySendButton.png"];
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
