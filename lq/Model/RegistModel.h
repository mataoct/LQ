//
//  RegistModel.h
//  lq
//
//  Created by  matao on 14-7-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"

@interface RegistModel : BaseRequestModel


@property (nonatomic,strong) NSString *tel;
@property (nonatomic,strong) NSString *verifyCode;
@property (nonatomic,strong) NSString *nikcName;
@property (nonatomic,strong) NSString *pwd;


-(id)initWithTel:(NSString *)tel verifyCode:(NSString *)verifyCode nikcName:(NSString *)nickName pwd:(NSString *)pwd;
-(void)getVerifyCodeByTel:(NSString *)tel;

@end
