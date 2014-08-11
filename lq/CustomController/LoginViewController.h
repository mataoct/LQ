//
//  LoginViewController.h
//  lq
//
//  Created by  matao on 14-7-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "RegistViewController.h"

@interface LoginViewController : LQUIViewController<UITextFieldDelegate>

@property (nonatomic,strong) UILabel *headText;
@property (nonatomic,strong) UITextField *userName;
@property (nonatomic,strong) UITextField *userPwd;
@property (nonatomic,strong) UILabel *subText;

@property (nonatomic,strong) UIButton *rememberPwdBtn;
@property (nonatomic,strong) UIButton *forgetPwdBtn;
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *fastRegBtn;

@property (nonatomic,strong) UIButton *otherLoginBtn;



@end
