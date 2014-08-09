//
//  RegistModel.m
//  lq
//
//  Created by  matao on 14-7-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "RegistModel.h"

@implementation RegistModel


-(id)initWithTel:(NSString *)tel verifyCode:(NSString *)verifyCode nikcName:(NSString *)nickName pwd:(NSString *)pwd
{
    self = [super init];
    if (self) {
        //
        _tel = [[NSString alloc] init];
        _tel = tel;
        
        _verifyCode = [[NSString alloc] init];
        _verifyCode = verifyCode;
        
        _nikcName = [[NSString alloc] init];
        _nikcName = nickName;
        
        _pwd = [[NSString alloc] init];
        _pwd = pwd;
    }
    
    return self;
    
}


-(void)getVerifyCodeByTel:(NSString *)tel
{
    
}

-(void)postData
{
    
}
@end
