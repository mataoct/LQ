//
//  RegistViewController.m
//  lq
//
//  Created by  matao on 14-7-7.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()

@end

@implementation RegistViewController


-(id)initWithTitle:(NSString *)str
{
    self = [super initWithTitle:str];
    if (self) {
        //
        
        
    }
    return self;
}

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
    
    _telText = [[UITextField alloc] initWithFrame:CGRectMake(30, 30, 260, 20)];
    _verifyCodeText = [[UITextField alloc] initWithFrame:CGRectMake(30, 60, 180, 20)];
    _getVerifyCodeBtn = [[UIButton alloc] initWithFrame:CGRectMake(210, 60, 80, 20)];
    _nickText = [[UITextField alloc] initWithFrame:CGRectMake(30, 90, 260, 20)];
    _pwdText = [[UITextField alloc] initWithFrame:CGRectMake(30, 120, 260, 20)];
    
    
    _telText.returnKeyType = UIReturnKeyDone;
    _verifyCodeText.returnKeyType = UIReturnKeyDone;
    _nickText.returnKeyType = UIReturnKeyDone;
    _pwdText.returnKeyType = UIReturnKeyDone;
    
    _telText.delegate = self;
    _verifyCodeText.delegate = self;
    _nickText.delegate = self;
    _pwdText.delegate = self;
    
    
    _telText.placeholder = @"电话";
    _verifyCodeText.placeholder = @"验证码";
    _nickText.placeholder = @"昵称";
    _pwdText.placeholder = @"密码";
    
    
    _pwdText.secureTextEntry = YES;
    
    
    
    _registBtn = [[UIButton alloc] initWithFrame:CGRectMake(30, 160, 260, 20)];
    
    
    _getVerifyCodeBtn.backgroundColor = [UIColor greenColor];
    _registBtn.backgroundColor = [UIColor redColor];
    
    [_getVerifyCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_registBtn setTitle:@"注册" forState:UIControlStateNormal];
    
    [_getVerifyCodeBtn addTarget:self action:@selector(getVerifyCodeByReuqest) forControlEvents:UIControlEventTouchUpInside];
    [_registBtn addTarget:self action:@selector(sendRegisterInfo) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height - 64)];
    
    
    
    [temp addSubview:_telText];
    [temp addSubview:_verifyCodeText];
    [temp addSubview:_getVerifyCodeBtn];
    [temp addSubview:_nickText];
    [temp addSubview:_pwdText];
    [temp addSubview:_registBtn];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
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
    if (textField == _telText || textField == _verifyCodeText || textField == _nickText || textField == _pwdText) {
        
        NSLog(@"heheh");
        
        [textField resignFirstResponder];
    }
    return YES;
}


-(void)getVerifyCodeByReuqest
{
    _requestModel = [[RegistModel alloc] initWithTel:_telText.text];
    _requestModel.delegate = self;
    _requestModel.tag = 10001;
    [_requestModel getVerifyCodeByTel];
}


-(void)sendRegisterInfo
{
    [_requestModel fillModelWithverifyCode:_verifyCodeText.text nikcName:_telText.text pwd:_pwdText.text];
    _requestModel.delegate = self;
    _requestModel.tag = 10002;
    [_requestModel postData];
}


-(void)requestFailed
{
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    switch (model.ResponseTag) {
        case 10001:
        {
            NSLog(@"verifity code send");
        }
            break;
        case 10002:
        {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

@end
