//
//  UserInfoRequestModel.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "AnotherUserInfoResponseModel.h"
@interface UserInfoRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *sellerid;
@property (nonatomic,strong) NSString *uid;

-(id)initWithSellId:(NSString *)sellerId uid:(NSString *)uid;


@end
