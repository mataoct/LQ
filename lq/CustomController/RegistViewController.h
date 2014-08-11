//
//  RegistViewController.h
//  lq
//
//  Created by  matao on 14-7-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "RegistModel.h"
#import "RegisterResponseModel.h"

@interface RegistViewController : LQUIViewController<UITextFieldDelegate,RequestModelDelegate>

@property (nonatomic,strong) UITextField *telText;
@property (nonatomic,strong) UITextField *verifyCodeText;
@property (nonatomic,strong) UITextField *nickText;
@property (nonatomic,strong) UITextField *pwdText;

@property (nonatomic,strong) UIButton *getVerifyCodeBtn;
@property (nonatomic,strong) UIButton *registBtn;


@property (nonatomic,strong) RegisterResponseModel *responseModel;
@property (nonatomic,strong) RegistModel *requestModel;


@end
