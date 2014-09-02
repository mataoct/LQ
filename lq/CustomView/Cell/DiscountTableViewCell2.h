//
//  DiscountTableViewCell2.h
//  lq
//
//  Created by  matao on 14-8-31.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "DiscountTableViewCell.h"
#import "Integral2CouponRequestModel.h"

@interface DiscountTableViewCell2 : DiscountTableViewCell<RequestModelDelegate >




@property (nonatomic,strong) Integral2CouponRequestModel *reuqestModel;


@end
