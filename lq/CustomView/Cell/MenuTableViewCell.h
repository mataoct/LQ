//
//  MenuTableViewCell.h
//  lq
//
//  Created by  matao on 14-8-3.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
#import "UIImageView+WebCache.h"
#import "FavRequestModel.h"
#import "AddToCartRequestModel.h"
#import "DisLineLabel.h"
@protocol MenuTableViewCellDelegate <NSObject>

-(void)shareBtnClicked:(GoodsModel *)goodModel;
//-(void)favBtnClick;

@end

@interface MenuTableViewCell : UITableViewCell<RequestModelDelegate>

@property (nonatomic,strong) UIImageView *headView;
@property (nonatomic,strong) UIButton *shareBtn;
@property (nonatomic,strong) UIButton *favBtn;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *detailLabel;

@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) DisLineLabel *disPriceLabel;
//@property (nonatomic,strong) DisLineLabel *disLineLabel;
@property (nonatomic,strong) UILabel *countLabel;
@property (nonatomic,strong) UILabel *countValueLabel;
@property (nonatomic,strong) UIButton *toBuyButton;
@property (nonatomic,strong) GoodsModel *model;

@property (nonatomic,strong) FavRequestModel *favRequestModel;
@property (nonatomic,strong) AddToCartRequestModel *add2CartModel;


@property (nonatomic,assign) id<MenuTableViewCellDelegate> delegate;

-(void)fillCellByModel:(GoodsModel *)model;

@end
