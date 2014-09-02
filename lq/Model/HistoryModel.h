//
//  HistoryModel.h
//  lq
//
//  Created by  matao on 14-8-31.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ShoppingCartItemModel.h"
@interface HistoryModel : NSObject

@property (nonatomic,strong) NSString *orderId;
@property (nonatomic,strong) NSString *orderTime;
@property (nonatomic,strong) NSString *orderType;
@property (nonatomic,strong) NSString *orderPeople;
@property (nonatomic,assign) NSInteger status;
@property (nonatomic,strong) NSString *totalNum;
@property (nonatomic,strong) NSString *sendPrice;
@property (nonatomic,strong) NSString *freesendPrice;
@property (nonatomic,strong) NSString *totalPrice;
@property (nonatomic,strong) NSString *extcredit;
@property (nonatomic,strong) NSString *couponId;
@property (nonatomic,strong) NSString *ccontent;
@property (nonatomic,strong) NSString *stotalPrice;
@property (nonatomic,strong) NSString *remark;
@property (nonatomic,strong) NSString *createTime;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *mobile;
@property (nonatomic,strong) NSString *linkMan;
@property (nonatomic,strong) NSString *pid;
@property (nonatomic,strong) NSString *discount;
@property (nonatomic,strong) NSString *boxno;
@property (nonatomic,strong) NSMutableArray *goodArr;


-(id)initWithDic:(NSDictionary *)dic;

@end
