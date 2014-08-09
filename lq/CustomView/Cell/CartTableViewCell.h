//
//  CartTableViewCell.h
//  lq
//
//  Created by 马涛 on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "ShoppingCartItemModel.h"

@interface CartTableViewCell : UITableViewCell


@property (nonatomic,strong) UIImageView *headView;
@property (nonatomic,strong) UIImageView *selectBtn;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *detailLabel;

@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *disPriceLabel;
@property (nonatomic,strong) UILabel *disLineLabel;

@property (nonatomic,strong) UILabel *countLabel;
@property (nonatomic,strong) UILabel *countValueLabel;

@property (nonatomic,strong) UILabel *sumLabel;
@property (nonatomic,strong) UILabel *sumValueLabel;
@property (nonatomic,strong) ShoppingCartItemModel *model;

@property (nonatomic,assign) NSInteger selectStatus;

-(void)fillCellByModel:(ShoppingCartItemModel *)model;
-(void)changeSelectStatus;
@end
