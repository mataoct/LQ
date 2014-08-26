//
//  MyFavTableViewCell.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MyFavTableViewCell.h"

@implementation MyFavTableViewCell

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
        
        _myModel = [[GoodsModel alloc] init];
        
        self.sumLabel.hidden = YES;
        self.sumValueLabel.hidden = YES;
                
        _addToCartBtn = [[UIButton alloc] initWithFrame:CGRectMake(220, 70, 80, 20)];
        
        [_addToCartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_addToCartBtn setBackgroundColor:Orange];
        [_addToCartBtn setFont:[UIFont systemFontOfSize:14]];
        _addToCartBtn.layer.cornerRadius = 3;
        
        [self addSubview:_addToCartBtn];
        
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

-(void)fillCellByModel:(GoodsModel *)model
{
    _myModel = model;
    
    [self.headView setImageWithURL:_myModel.img placeholderImage:[UIImage imageNamed:@"头像-评论.png"] success:nil failure:nil];
    self.titleLabel.text = _myModel.title;
    self.detailLabel.text = _myModel.content;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",_myModel.nowprice];
    self.disPriceLabel.text = [NSString stringWithFormat:@"￥%@",_myModel.originalprice];
    self.countLabel.text = @"销量:";
    self.countValueLabel.text = _myModel.sales;
//    self.sumValueLabel.text = _myModel.num;
    self.selectStatus = 0;
}

@end
