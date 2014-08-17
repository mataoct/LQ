//
//  LoginViewController.m
//  lq
//
//  Created by  matao on 14-7-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

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

    
    
    _headText = [[UILabel alloc] initWithFrame:CGRectMake(30, 30, 260, 20)];
    
    
    _headText.text = @"tmd赶快登陆";
    _headText.textAlignment = NSTextAlignmentCenter;
    
    _userName = [[UITextField alloc] initWithFrame:CGRectMake(30, 60, 260, 20)];
    _userPwd = [[UITextField alloc] initWithFrame:CGRectMake(30, 90, 260, 20)];

    _userPwd.placeholder = @"密码";
    _userName.placeholder = @"用户名";
    
    
    _userName.returnKeyType = UIReturnKeyDone;
    _userPwd.returnKeyType = UIReturnKeyDone;
    
    _userPwd.delegate = self;
    _userName.delegate = self;
    
//    _userName.backgroundColor = [UIColor greenColor];
//    _userPwd.backgroundColor = [UIColor greenColor] ;
    
    _userModel = [[UserInfoModel alloc] init];
    
    
    
    _rememberPwdBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 120, 120, 20)];
    _forgetPwdBtn = [[UIButton alloc] initWithFrame:CGRectMake(170, 120, 120, 20)];
    
    [_rememberPwdBtn setTitle:@"记住密码" forState:UIControlStateNormal];
    [_forgetPwdBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    
    _forgetPwdBtn.backgroundColor = [UIColor blueColor];
    _rememberPwdBtn.backgroundColor = [UIColor blueColor];
    
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 160, 260, 30)];
    [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    
    
    [_loginBtn addTarget:self action:@selector(goLogin) forControlEvents:UIControlEventTouchUpInside];
    _loginBtn.backgroundColor = [UIColor greenColor];
    
    _fastRegBtn = [[UIButton alloc] initWithFrame:CGRectMake(170, 200, 120, 20)];
    _fastRegBtn.backgroundColor = [UIColor grayColor];
    [_fastRegBtn setTitle:@"快速注册" forState:UIControlStateNormal];
    [_fastRegBtn addTarget:self action:@selector(gotoRegist) forControlEvents:UIControlEventTouchUpInside];
    
    _subText =[[UILabel alloc] initWithFrame:CGRectMake(30, 230, 260, 20)];
    _subText.text = @"其他登陆方式";
    _subText.textAlignment   = NSTextAlignmentCenter;
    
    
    _otherLoginBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 260, 50, 50)];
    _otherLoginBtn.backgroundColor =[UIColor purpleColor];
    
    
    NSLog(@"view loaded");
    
    UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height - 64)];
    
    [temp addSubview:_headText];
    [temp addSubview:_userPwd];
    [temp addSubview:_userName];
    [temp addSubview:_rememberPwdBtn];
    [temp addSubview:_forgetPwdBtn];
    [temp addSubview:_loginBtn];
    [temp addSubview:_fastRegBtn];
    [temp addSubview:_subText];
    [temp addSubview:_otherLoginBtn];
    
    temp.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:temp];
    

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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _userName || textField == _userPwd) {
        
        NSLog(@"heheh");
        
        [textField resignFirstResponder];
    }
    return YES;
}


-(void)gotoRegist
{
    RegistViewController *registVC = [[RegistViewController alloc] init];
    [self presentViewController:registVC animated:YES completion:nil];
}

-(void)goLogin
{
    _requestModel = [[LoginRequestModel alloc] initWithUsername:_userName.text Pwd:_userPwd.text sellerId:@"100"];
    _requestModel.delegate = self;
    [_requestModel postData];
}

-(void)requestFailed
{
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _userModel = (UserInfoModel *)model;
    
    NSLog(@"%@",_userModel.uid);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
