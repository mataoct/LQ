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
        
        [_addToCartBtn addTarget:self action:@selector(cartBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
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
    
    
    _add2CartModel = [[AddToCartRequestModel alloc] initWithGid:_myModel.gid uid:[CoreHelper getLoginUid]];
    
    [self.headView setImageWithURL:_myModel.img placeholderImage:[UIImage imageNamed:@"图片默认1.png"] success:nil failure:nil];
    self.titleLabel.text = _myModel.title;
    self.detailLabel.text = _myModel.content;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",_myModel.nowprice];
    self.disPriceLabel.text = [NSString stringWithFormat:@"￥%@",_myModel.originalprice];
    self.countLabel.text = @"销量:";
    self.countValueLabel.text = _myModel.sales;
//    self.sumValueLabel.text = _myModel.num;
    self.selectStatus = 0;
}



-(void)cartBtnClick
{
    _add2CartModel.delegate = self;
    _add2CartModel.tag = 10001;
    [_add2CartModel postData:@"1"];
    
    NSLog(@"add 2 cart");
}

-(void)requestFailed:(NSString *)errorStr
{
    [SVProgressHUD showSuccessWithStatus_custom:errorStr duration:1.5];
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    switch (model.ResponseTag) {
        case 10001:
        {
            if (model.ResponseStatus == 1) {
                //
                [SVProgressHUD showSuccessWithStatus_custom:@"加入购物车成功" duration:1.5];
            }
            else
            {
                [SVProgressHUD showSuccessWithStatus_custom:@"加入购物车失败" duration:1.5];
            }
        }
            break;
            
        default:
            break;
    }
}

@end
