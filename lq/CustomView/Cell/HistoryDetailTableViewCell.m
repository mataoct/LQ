//
//  HistoryDetailTableViewCell.m
//  lq
//
//  Created by  matao on 14-9-2.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "HistoryDetailTableViewCell.h"

@implementation HistoryDetailTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        _model = [[HistoryModel alloc] init];
        
        _orderId = [[NSString alloc] init];
        
        
        UIView *subView = [[UIView alloc] initWithFrame:CGRectMake(10, 1, 300, 160)];
        subView.backgroundColor = [UIColor whiteColor];
        _totalNumLable = [[UILabel alloc] initWithFrame:CGRectMake(10, 3, 140, 16)];
        _totalNumLable.font = [UIFont systemFontOfSize:10];
        _originalPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 3, 100, 16)];
        _originalPriceLabel.font = [UIFont systemFontOfSize:10];
        _sendPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 19, 170, 16)];
        _sendPriceLabel.font = [UIFont systemFontOfSize:10];
        _currentPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 19, 100, 16)];
        _currentPriceLabel.font = [UIFont systemFontOfSize:10];
        
        _couponLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 170, 16)];
        _couponLabel.font = [UIFont systemFontOfSize:10];
        _integralLabel = [[UILabel alloc] initWithFrame:CGRectMake(180, 35, 100, 16)];
        _integralLabel.font = [UIFont systemFontOfSize:10];
        
        UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 54, 300, 1)];
        line1.backgroundColor = BackGray;
        [subView addSubview:_totalNumLable];
        [subView addSubview:_originalPriceLabel];
        [subView addSubview:_sendPriceLabel];
        [subView addSubview:_currentPriceLabel];
        [subView addSubview:_couponLabel];
        [subView addSubview:_integralLabel];
        [subView addSubview:line1];
        
        
        
        //备注
        _summaryLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 55, 280, 32)];
        _summaryLabel.font = [UIFont systemFontOfSize:10];
        _summaryLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _summaryLabel.numberOfLines = 2;
        
        UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 89, 300, 1)];
        line2.backgroundColor = BackGray;
        [subView addSubview:_summaryLabel];
        [subView addSubview:line2];
        
        //地址
        _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 91, 180, 16)];
        _addressLabel.font = [UIFont systemFontOfSize:10];
        _telLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 107, 140, 16)];
        _telLabel.font = [UIFont systemFontOfSize:10];
        _linkManLabel = [[UILabel alloc] initWithFrame:CGRectMake(160, 107, 120, 16)];
        _linkManLabel.font = [UIFont systemFontOfSize:10];
        
        UILabel *line3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 125, 300, 1)];
        line3.backgroundColor = BackGray;
        [subView addSubview:_addressLabel];
        [subView addSubview:_telLabel];
        [subView addSubview:_linkManLabel];
        [subView addSubview:line3];
        
        //日期/按钮
        
        _createTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 135, 120, 16)];
        _createTimeLabel.font = [UIFont systemFontOfSize:10];
        _payBtn = [[UIButton alloc] initWithFrame:CGRectMake(130, 133, 75, 20)];
        _payBtn.font = [UIFont systemFontOfSize:14];
        _payBtn.layer.cornerRadius = 3.0;
        [_payBtn setBackgroundColor:DarkGreen];
        _cancleBtn = [[UIButton alloc] initWithFrame:CGRectMake(215, 133, 75, 20)];
        _cancleBtn.font = [UIFont systemFontOfSize:14];
        _cancleBtn.layer.cornerRadius = 3.0;
        [_cancleBtn setBackgroundColor:[UIColor grayColor]];
        
        [_payBtn setTitle:@"现在付款" forState:UIControlStateNormal];
        [_payBtn addTarget:self action:@selector(payForOrder) forControlEvents:UIControlEventTouchUpInside];
        
        [_cancleBtn setTitle:@"取消订单" forState:UIControlStateNormal];
        [_cancleBtn addTarget:self action:@selector(cancleClick) forControlEvents:UIControlEventTouchUpInside];
        [subView addSubview:_createTimeLabel];
        [subView addSubview:_payBtn];
        [subView addSubview:_cancleBtn];
        
        
        [self addSubview:subView];
        
        
        self.backgroundColor = BackGray;
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


-(void)fillCellByModel:(HistoryModel *)model
{
    _model = model;
    _totalNumLable.text = [NSString stringWithFormat:@"数量总计：%@",_model.totalNum];
    _originalPriceLabel.text = [NSString stringWithFormat:@"合计：%@",_model.totalPrice];
    _sendPriceLabel.text = [NSString stringWithFormat:@"配送费：%@元(满%@元免配送费)",_model.sendPrice,_model.freesendPrice];
    _currentPriceLabel.text = [NSString stringWithFormat:@"实际应付：￥%@",_model.stotalPrice];
    _couponLabel.text = [NSString stringWithFormat:@"电子优惠券：%@",_model.couponId];
    _integralLabel.text = [NSString stringWithFormat:@"可获积分：%@",_model.extcredit];
    _summaryLabel.text = [NSString stringWithFormat:@"备注：%@",_model.remark];
    _addressLabel.text = [NSString stringWithFormat:@"收货地址：%@",_model.address];
    _linkManLabel.text = [NSString stringWithFormat:@"联系人：%@",_model.linkMan];
    _telLabel.text = [NSString stringWithFormat:@"联系电话：%@",_model.mobile];
    _createTimeLabel.text = [NSString stringWithFormat:@"创建日期：%@",_model.createTime];
    
}


-(void)payForOrder
{
    if ([_delegate respondsToSelector:@selector(payNowClick:)]) {
        [_delegate payNowClick:_orderId];
    }
}


-(void)cancleClick
{
    if ([_delegate respondsToSelector:@selector(cancleOrder:)]) {
        [_delegate cancleOrder:_orderId];
    }
}

@end
