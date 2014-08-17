//
//  SignatureResponseModel.h
//  lq
//
//  Created by  matao on 14-8-10.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"

@interface SignatureResponseModel : BaseResponseModel

@property (nonatomic,strong) NSString *orderId;


-(id)initWithDic:(NSDictionary *)dic;

@end
