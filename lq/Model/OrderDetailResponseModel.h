//
//  OrderDetailResponseModel.h
//  lq
//
//  Created by  matao on 14-8-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "ShoppingCartItemModel.h"
#import "CoreHelper.h"

@interface OrderDetailResponseModel : BaseResponseModel


@property (nonatomic,strong) NSString *orderId;
@property (nonatomic,strong) NSString *orderTime;
@property (nonatomic,strong) NSString *orderType;
@property (nonatomic,strong) NSString *orderPeople;
@property (nonatomic,strong) NSString *status;
@property (nonatomic,strong) NSString *totalNum;
@property (nonatomic,strong) NSString *sendPrice;
@property (nonatomic,strong) NSString *freeSendPrice;
@property (nonatomic,strong) NSString *totalPrice;
@property (nonatomic,strong) NSString *extCredit;
@property (nonatomic,strong) NSString *coupondId;
@property (nonatomic,strong) NSString *cconttent;
@property (nonatomic,strong) NSString *stotalPrice;
@property (nonatomic,strong) NSString *remark;
@property (nonatomic,strong) NSString *createTime;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *mobile;
@property (nonatomic,strong) NSString *linkMan;
@property (nonatomic,strong) NSString *pid;
@property (nonatomic,strong) NSString *discount;
@property (nonatomic,strong) NSMutableArray *goodList;

-(id)initWithDic:(NSDictionary *)dic;
@end
