//
//  HistoryResponseModel.h
//  lq
//
//  Created by  matao on 14-8-31.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "GoodsModel.h"
#import "HistoryModel.h"

@interface HistoryResponseModel : BaseResponseModel

@property (nonatomic,strong) NSMutableArray *historyArr;
@property (nonatomic,strong) NSMutableArray *unPayArr;


-(id)initWithDic:(NSDictionary *)dic;

@end
