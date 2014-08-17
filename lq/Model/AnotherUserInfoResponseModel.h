//
//  AnotherUserInfoResponseModel.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"

@interface AnotherUserInfoResponseModel : BaseResponseModel

@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSURL *avatar;
@property (nonatomic,assign) NSInteger sex;
@property (nonatomic,strong) NSString *money;
@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,strong) NSString *integral;
@property (nonatomic,assign) NSInteger signin;
@property (nonatomic,strong) NSString *signIntegral;


-(id)initWithDic:(NSDictionary *)dic;

@end
