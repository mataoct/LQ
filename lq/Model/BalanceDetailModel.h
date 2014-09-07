//
//  BalanceDetailModel.h
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"

@interface BalanceDetailModel : NSObject

@property (nonatomic,strong) NSString *date;
@property (nonatomic,strong) NSString *orderId;
@property (nonatomic,strong) NSString *integral;
@property (nonatomic,strong) NSString *typeString;

-(id)initWithDic:(NSDictionary *)dic;

@end
