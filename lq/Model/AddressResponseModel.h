//
//  AddressResponseModel.h
//  lq
//
//  Created by  matao on 14-8-24.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"

@interface AddressResponseModel : BaseResponseModel

@property (nonatomic,strong) NSString *linkMan;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *sellerid;

-(id)initWithDic:(NSDictionary *)dic;

@end
