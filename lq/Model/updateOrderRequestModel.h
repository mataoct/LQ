//
//  updateOrderRequestModel.h
//  lq
//
//  Created by  matao on 14-8-31.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"

@interface updateOrderRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *orderTime;
@property (nonatomic,strong) NSString *orderPeople;
@property (nonatomic,strong) NSString *orderType;
@property (nonatomic,strong) NSString *couponId;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *linkMan;
@property (nonatomic,strong) NSString *mobile;
@property (nonatomic,strong) NSString *pid;
@property (nonatomic,strong) NSString *remark;
@property (nonatomic,strong) NSString *orderId;


-(id)initWithUid:(NSString *)uid orderId:(NSString *)orderId;


@end
