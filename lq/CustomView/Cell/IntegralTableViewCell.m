//
//  IntegralTableViewCell.m
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "IntegralTableViewCell.h"

@implementation IntegralTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 70, 32)];
        _dateLabel.font = [UIFont systemFontOfSize:12];
        _orderIdLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 0, 110, 32)];
        _orderIdLabel.font = [UIFont systemFontOfSize:12];
        _integralLabel = [[UILabel alloc] initWithFrame:CGRectMake(190, 0, 40, 32)];
        _integralLabel.font = [UIFont systemFontOfSize:12];
        _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(230, 0, 70, 32)];
        _typeLabel.font = [UIFont systemFontOfSize:12];
        
        
        _iModel = [[IntegralDetailModel alloc] init];
        _bModel = [[BalanceDetailModel alloc] init];
        
        
        
        
        [self addSubview:_dateLabel];
        [self addSubview:_orderIdLabel];
        [self addSubview:_integralLabel];
        [self addSubview:_typeLabel];
        
        
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

-(void)fillCellByIModel:(IntegralDetailModel *)model
{
    _iModel = model;
    
    _dateLabel.text = _iModel.date;
    _orderIdLabel.text = _iModel.orderId;
    _integralLabel.text = _iModel.integral;
    _typeLabel.text = _iModel.typeString;
    
}

-(void)fillCellByBModel:(BalanceDetailModel *)model
{
    _bModel = model;
    
    _dateLabel.text = _bModel.date;
    _orderIdLabel.text = _bModel.orderId;
    _integralLabel.text = _bModel.integral;
    _typeLabel.text = _bModel.typeString;
    
}

@end
