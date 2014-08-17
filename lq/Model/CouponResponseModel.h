//
//  CouponResponseModel.h
//  lq
//
//  Created by  matao on 14-8-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "CouponModel.h"

@interface CouponResponseModel : BaseResponseModel


@property(nonatomic,strong) NSMutableArray *couponArr;


-(id)initWithDic:(NSDictionary *)dic;
@end
