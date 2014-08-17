//
//  MyFavResponseModel.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"
#import "GoodsModel.h"
@interface MyFavResponseModel : BaseResponseModel

@property (nonatomic,strong) NSString *num;
@property (nonatomic,strong) NSMutableArray *goodsArr;

-(id)initWithDic:(NSDictionary *)dic;


@end
