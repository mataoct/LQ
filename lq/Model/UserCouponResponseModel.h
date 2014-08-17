//
//  UserCouponResponseModel.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "CouponModel.h"

@interface UserCouponResponseModel : BaseResponseModel

@property (nonatomic,strong) NSString *extcredit;
@property (nonatomic,strong) NSMutableArray *couponArr;

-(id)initWithDic:(NSDictionary *)dic;

@end
