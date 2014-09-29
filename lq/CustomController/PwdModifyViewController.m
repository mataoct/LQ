//
//  PwdModifyViewController.m
//  lq
//
//  Created by 马涛 on 14-9-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "PwdModifyViewController.h"

@interface PwdModifyViewController ()

@property (nonatomic,strong) UIBarButtonItem *rightButton;

@end

@implementation PwdModifyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _requestModel = [[PasswordRequestModel alloc] init];
    
    _rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(selectRightAction:)];
    _rightButton.image = [UIImage imageNamed:@"保存.png"];
    _rightButton.tintColor = [UIColor whiteColor];
    self.item.rightBarButtonItem = _rightButton;
    
    
    _oldPwdTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 74, 300, 44)];
    _PwdTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 128, 300, 44)];
    _reNewPwdTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 182, 300, 44)];
    
    
    _oldPwdTF.placeholder = @"旧密码";
    _PwdTF.placeholder = @"新密码（6-18）位";
    _reNewPwdTF.placeholder = @"重新输入密码";
    
    [self.view addSubview:_oldPwdTF];
    [self.view addSubview:_PwdTF];
    [self.view addSubview:_reNewPwdTF];
    
    
    _oldPwdTF.returnKeyType = UIReturnKeyDone;
    _PwdTF.returnKeyType = UIReturnKeyDone;
    _reNewPwdTF.returnKeyType = UIReturnKeyDone;
    _oldPwdTF.delegate = self;
    _PwdTF.delegate = self;
    _reNewPwdTF.delegate = self;
    
    
    _oldPwdTF.secureTextEntry = YES;
    _PwdTF.secureTextEntry = YES;
    _reNewPwdTF.secureTextEntry = YES;
    
    _oldPwdTF.backgroundColor = [UIColor whiteColor];
    _PwdTF.backgroundColor = [UIColor whiteColor];
    _reNewPwdTF.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)selectRightAction:(id)sender
{
    
    if ([_PwdTF.text isEqualToString:_reNewPwdTF.text])
    {
        _requestModel.oldPwd = _oldPwdTF.text;
        _requestModel.sellerId = CustomID;
        _requestModel.uid = [CoreHelper getLoginUid];
        _requestModel.pwd = _PwdTF.text;
        _requestModel.delegate = self;
        [_requestModel postData];
    }
    else
    {
        [SVProgressHUD showErrorWithStatus_custom:@"新密码不一致,请重新输入" duration:1.5];
        _reNewPwdTF.text = @"";
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _reNewPwdTF || textField == _PwdTF || textField == _oldPwdTF) {
        
        
        [textField resignFirstResponder];
    }
    return YES;
}

-(void)requestFailed:(NSString *)errorStr
{
    
    [SVProgressHUD showErrorWithStatus_custom:errorStr duration:1.5];
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    
    [SVProgressHUD showSuccessWithStatus:@"密码修改成功" duration:1.5];
}

@end
