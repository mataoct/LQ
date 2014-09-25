//
//  PwdModifyViewController.h
//  lq
//
//  Created by 马涛 on 14-9-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "PasswordRequestModel.h"

@interface PwdModifyViewController : LQUIViewController<UITextFieldDelegate,RequestModelDelegate>

@property (nonatomic,strong) UITextField *oldPwdTF;
@property (nonatomic,strong) UITextField *PwdTF;
@property (nonatomic,strong) UITextField *reNewPwdTF;


@property (nonatomic,strong) PasswordRequestModel *requestModel;

@end
