//
//  BalanceResponseModel.h
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "BalanceDetailModel.h"

@interface BalanceResponseModel : BaseResponseModel

@property (nonatomic,strong) NSMutableArray *balanceArr;


-(id)initWithDic:(NSDictionary *)dic;


@end
