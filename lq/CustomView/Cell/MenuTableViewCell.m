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
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        _headView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 95, 75)];
        
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 10, 105, 20)];
        _shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(220, 10, 20, 20)];
        _favBtn = [[UIButton alloc] initWithFrame:CGRectMake(260, 10, 20, 20)];
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 30, 185, 15)];
        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 50, 50, 20)];
        _disPriceLabel = [[DisLineLabel alloc] initWithFrame:CGRectMake(165, 50, 30, 20)];
//        _disLineLabel = [[DisLineLabel alloc] initWithFrame:CGRectMake(165, 50, 30, 20)];
        
        
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 70, 40, 15)];
        _countValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(155, 70, 30, 15)];
        
        _toBuyButton = [[UIButton alloc] initWithFrame:CGRectMake(210, 65, 80, 20)];
        [_toBuyButton setTitle:@"加入购物车" forState:UIControlStateNormal];

        
        
        _model = [[GoodsModel alloc] init];
        
//        _addToCartBtn = [[UIButton alloc] initWithFrame:CGRectMake(220, 70, 80, 20)];
//        
//        [_addToCartBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
        [_toBuyButton setBackgroundColor:Orange];
        [_toBuyButton setFont:[UIFont systemFontOfSize:14]];
        _toBuyButton.layer.cornerRadius = 3;
        
        _titleLabel.font = [UIFont systemFontOfSize:20];
        _detailLabel.font = [UIFont systemFontOfSize:12];
        
        
        
        _priceLabel.font = [UIFont systemFontOfSize:20];
        _disPriceLabel.font = [UIFont systemFontOfSize:12];
        _countLabel.font = [UIFont systemFontOfSize:12];
        
        _countLabel.text = @"销量：";
        _countValueLabel.font = [UIFont systemFontOfSize:12];
        
        
//        _favBtn.backgroundColor = [UIColor blueColor];
//        _shareBtn.backgroundColor = [UIColor greenColor];
        
        
        UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 95)];
        tempView.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = BackGray;
        
        [tempView addSubview:_headView];
        [tempView addSubview:_titleLabel];
        [tempView addSubview:_shareBtn];
        [tempView addSubview:_favBtn];
        [tempView addSubview:_detailLabel];
        [tempView addSubview:_priceLabel];
        [tempView addSubview:_disPriceLabel];
//        [tempView addSubview:_disLineLabel];
        [tempView addSubview:_countLabel];
        [tempView addSubview:_countValueLabel];
        [tempView addSubview:_toBuyButton];
        
        [self addSubview:tempView];
        
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
    _model = model;
    
    [_headView setImageWithURL:_model.img placeholderImage:[UIImage imageNamed:@"图片默认1.png"] success:nil failure:nil];
    _titleLabel.text = _model.title;
    _detailLabel.text = _model.content;
    
    _priceLabel.text = [NSString stringWithFormat:@"￥%@",_model.nowprice];
    _disPriceLabel.text = [NSString stringWithFormat:@"￥%@",_model.originalprice];
    _countValueLabel.text = _model.sales;
    
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
    
    [_toBuyButton addTarget:self action:@selector(cartBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
