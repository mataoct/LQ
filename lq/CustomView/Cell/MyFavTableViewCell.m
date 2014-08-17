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
                
        _addToCartBtn = [[UIButton alloc] initWithFrame:CGRectMake(180, 75, 80, 15)];
        
        [_addToCartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        
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
    
    [self.headView setImageWithURL:_myModel.img placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
    self.titleLabel.text = _myModel.title;
    self.detailLabel.text = _myModel.content;
    self.priceLabel.text = _myModel.nowprice;
    self.disPriceLabel.text = _myModel.originalprice;
    self.countValueLabel.text = _myModel.sales;
//    self.sumValueLabel.text = _myModel.num;
    self.selectStatus = 0;
}

@end
