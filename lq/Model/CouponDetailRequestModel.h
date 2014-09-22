//
//  CouponDetailRequestModel.h
//  lq
//
//  Created by  matao on 14-9-22.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "CouponModel.h"
@interface CouponDetailRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *coupondId;

-(id)initWithCouponId:(NSString *)couponId;

@end
