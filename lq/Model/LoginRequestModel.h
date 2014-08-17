//
//  LoginRequestModel.h
//  lq
//
//  Created by  matao on 14-7-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "UserInfoModel.h"
#import "CoreHelper.h"

enum tokens{
    sinaToken=1,
    qqToken=2
};


@interface LoginRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *username;
@property (nonatomic,strong) NSString *userpwd;

@property (nonatomic,strong) NSString *token;
@property (nonatomic,strong) NSString *sellerID;

@property (nonatomic,assign) enum tokens tokenType;


-(id)initWithUsername:(NSString *)username Pwd:(NSString *)userpwd sellerId:(NSString *)sellerID;

@end
