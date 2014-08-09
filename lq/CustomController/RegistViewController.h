//
//  RegistViewController.h
//  lq
//
//  Created by  matao on 14-7-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQ7ViewController.h"

@interface RegistViewController : LQ7ViewController<UITextFieldDelegate>

@property (nonatomic,strong) UITextField *telText;
@property (nonatomic,strong) UITextField *verifyCodeText;
@property (nonatomic,strong) UITextField *nickText;
@property (nonatomic,strong) UITextField *pwdText;

@property (nonatomic,strong) UIButton *getVerifyCodeBtn;
@property (nonatomic,strong) UIButton *registBtn;
@end
