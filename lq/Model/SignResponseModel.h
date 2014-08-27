//
//  SignResponseModel.h
//  lq
//
//  Created by 马涛 on 14-8-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"

@interface SignResponseModel : BaseResponseModel

@property (nonatomic,assign) NSInteger integral;


-(id)initWithDic:(NSDictionary *)dic;

@end
