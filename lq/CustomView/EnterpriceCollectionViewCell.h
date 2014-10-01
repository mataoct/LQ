//
//  EnterpriceCollectionViewCell.h
//  lq
//
//  Created by 马涛 on 14-9-30.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GoodsModel.h"
#import "UIImageView+WebCache.h"
#import "FavRequestModel.h"
#import "AddToCartRequestModel.h"
#import "DisLineLabel.h"


@protocol EnterpriceCollectionViewCellDelegate <NSObject>

-(void)shareBtnClicked:(GoodsModel *)goodModel;
//-(void)favBtnClick;

@end

@interface EnterpriceCollectionViewCell : UICollectionViewCell<RequestModelDelegate>


@property (nonatomic,strong) IBOutlet UIView *subView;

@property (nonatomic,strong) IBOutlet UIImageView *headImage;
@property (nonatomic,strong) IBOutlet UILabel *titleLabel;
@property (nonatomic,strong) IBOutlet UILabel *summaryLabel;
@property (nonatomic,strong) IBOutlet UILabel *orginaLabel;
@property (nonatomic,strong) IBOutlet DisLineLabel *disLineLabel;
@property (nonatomic,strong) IBOutlet UILabel *sales;
@property (nonatomic,strong) IBOutlet UILabel *saleValue;

@property (nonatomic,strong) IBOutlet UIButton *addCartBtn;
@property (nonatomic,strong) IBOutlet UIButton *shareBtn;
@property (nonatomic,strong) IBOutlet UIButton *favBtn;


@property (nonatomic,strong) GoodsModel *model;

@property (nonatomic,strong) FavRequestModel *favRequestModel;
@property (nonatomic,strong) AddToCartRequestModel *add2CartModel;


@property (nonatomic,assign) id<EnterpriceCollectionViewCellDelegate> delegate;


-(void)fillCellByModel:(GoodsModel *)model;

@end
