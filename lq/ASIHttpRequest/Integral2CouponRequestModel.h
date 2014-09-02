//
//  Integral2CouponRequestModel.h
//  lq
//
//  Created by  matao on 14-8-31.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"

@interface Integral2CouponRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *couponId;

-(id)initWithUid:(NSString *)uid;

-(void)postData:(NSString *)couponId;

@end
