//
//  MyFavTableViewCell.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CartTableViewCell.h"
#import "GoodsModel.h"

@interface MyFavTableViewCell : CartTableViewCell

@property (nonatomic,strong) UIButton *addToCartBtn;
@property (nonatomic,strong) GoodsModel *myModel;

@end
