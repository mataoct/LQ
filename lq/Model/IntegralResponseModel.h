//
//  IntegralResponseModel.h
//  lq
//
//  Created by 马涛 on 14-9-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "IntegralDetailModel.h"
@interface IntegralResponseModel : BaseResponseModel

@property (nonatomic,strong) NSMutableArray *integralArr;


-(id)initWithDic:(NSDictionary *)dic;

@end
