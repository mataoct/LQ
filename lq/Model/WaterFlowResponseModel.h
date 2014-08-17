//
//  WaterFlowResponseModel.h
//  lq
//
//  Created by  matao on 14-8-12.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "WaterFlowModel.h"
@interface WaterFlowResponseModel : BaseResponseModel

@property (nonatomic,strong) NSMutableArray *waterArr;


-(id)initWithDic:(NSDictionary *)dic;

@end
