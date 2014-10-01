//
//  EnterpriceCollectionViewCell.m
//  lq
//
//  Created by 马涛 on 14-9-30.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "EnterpriceCollectionViewCell.h"

@implementation EnterpriceCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
//-(id)ini

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
    //    [super layoutSubviews];
    _model = model;
    
    [_headImage setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@"图片默认1.png"] success:nil failure:nil];
    _titleLabel.text = _model.title;
    _summaryLabel.text = _model.content;
    
    _orginaLabel.text = [NSString stringWithFormat:@"￥%@",_model.nowprice];
    _disLineLabel.text = [NSString stringWithFormat:@"￥%@",_model.originalprice];
    _saleValue.text = _model.sales;
    
    if ([_model.isfav intValue] == 0) {
        //
        [_favBtn setImage:[UIImage imageNamed:@"收藏.png"] forState:UIControlStateNormal];
    }
    else
    {
        [_favBtn setImage:[UIImage imageNamed:@"收藏-已收藏.png"] forState:UIControlStateNormal];
    }
    
    [_favBtn addTarget:self action:@selector(favBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    _favRequestModel = [[FavRequestModel alloc] initWithUid:[CoreHelper getLoginUid] gid:_model.gid];
    _add2CartModel = [[AddToCartRequestModel alloc] initWithGid:_model.gid uid:[CoreHelper getLoginUid]];
    
    [_shareBtn setImage:[UIImage imageNamed:@"分享.png"] forState:UIControlStateNormal];
    
    [_shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [_addCartBtn setBackgroundColor:SkyBlue];
//    [_toBuyButton setFont:[UIFont systemFontOfSize:14]];
    _addCartBtn.layer.cornerRadius = 3;
    [_addCartBtn addTarget:self action:@selector(cartBtnClick) forControlEvents:UIControlEventTouchUpInside];
}


-(void)shareBtnClick
{
    if ([_delegate respondsToSelector:@selector(shareBtnClicked:)]) {
        [_delegate shareBtnClicked:_model];
    }
}

-(void)favBtnClick
{
    //    _favRequestModel.isfav = _model.isfav;
    _favRequestModel.delegate = self;
    _favRequestModel.tag = 10001;
    
    
    [_favRequestModel.request cancel];
    [_favRequestModel postData:[_model.isfav isEqualToString:@"0"]?@"1":@"0"];
    
    NSLog(@"clcik") ;
}

-(void)cartBtnClick
{
    _add2CartModel.delegate = self;
    _add2CartModel.tag = 10002;
    [_add2CartModel postData:@"1"];
    
    NSLog(@"add 2 cart");
}


-(void)requestFailed:(NSString *)errorStr
{
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    switch (model.ResponseTag) {
        case 10001:
        {
            if ([_model.isfav integerValue] == 0) {
                
                NSLog(@"收藏成功");
                _model.isfav = @"1";
            }
            else
            {
                _model.isfav = @"0";
            }
            
            [self fillCellByModel:_model];
        }
            break;
        case 10002:
        {
            //            NSLog(@"添加购物车OK");
            
            [SVProgressHUD showSuccessWithStatus_custom:@"添加购物车成功" duration:1.5];
            [CoreHelper addTabbarBadgeValue];
            
        }
            break;
            
        default:
            break;
    }
}


@end
