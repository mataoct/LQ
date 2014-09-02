//
//  MemberCenterViewController.m
//  lq
//
//  Created by  matao on 14-7-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MemberCenterViewController.h"
#import "ShooInfoController.h"

@interface MemberCenterViewController ()

@end

@implementation MemberCenterViewController

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
    
//    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
    
    _settingBtn = [[UIButton alloc] initWithFrame:CGRectMake(277, 37, 23, 23)];
//    [_settingBtn setTitle:@"设置" forState:UIControlStateNormal];
    [_settingBtn setBackgroundImage:[UIImage imageNamed:@"标题-设置.png"] forState:UIControlStateNormal];
    [_settingBtn addTarget:self action:@selector(settingBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [_settingBtn setBackgroundColor:[UIColor blackColor]];
    
    _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10+64, 80, 80)];
    
    _headImageView.layer.cornerRadius = 40.0;
    _headImageView.layer.masksToBounds = YES;
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10+64, 60, 20)];
    _sexImageView = [[UIImageView alloc] initWithFrame:CGRectMake(160, 10+64, 16, 16)];
    _telLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 30+64, 80, 15)];
    _punchBtn = [[UIButton alloc] initWithFrame:CGRectMake(250, 10+64, 60, 30)];
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 60+64, 60, 15)];
    _integrationLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 60+64, 60, 15)];
    _daylyLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 60+64, 60, 15)];
    
    _priceLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 75+64, 60, 15)];
    _integrationLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(165, 75+64, 60, 15)];
    _daylyLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(240, 75+64, 60, 15)];
    
    UIImageView *temp = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 165)];
    [temp setImage:[UIImage imageNamed:@"会员_背景图"]];
    temp.userInteractionEnabled  = YES;
    
    
    _nameLabel.font = [UIFont systemFontOfSize:18];
    _nameLabel.textColor = [UIColor whiteColor];
    _telLabel.font = [UIFont systemFontOfSize:12];
    _telLabel.textColor = [UIColor whiteColor];
    [_punchBtn setEnabled:false];
    [_punchBtn setTintColor:[UIColor whiteColor]];
    
    
//    _priceLabel.text = @"9.00";
    _priceLabel2.text = @"账户余额";
    _priceLabel.font = [UIFont systemFontOfSize:12];
    _priceLabel2.font = [UIFont systemFontOfSize:12];
    _priceLabel.textAlignment = NSTextAlignmentCenter;
    _priceLabel2.textAlignment = NSTextAlignmentCenter;
    _priceLabel2.textColor = [UIColor whiteColor];
    _priceLabel.textColor = [UIColor whiteColor];
    
    
//    _integrationLabel.text = @"258";
    _integrationLabel2.text = @"可用积分";
    _integrationLabel.font = [UIFont systemFontOfSize:12];
    _integrationLabel2.font = [UIFont systemFontOfSize:12];
    _integrationLabel.textAlignment = NSTextAlignmentCenter;
    _integrationLabel2.textAlignment = NSTextAlignmentCenter;
    _integrationLabel.textColor = [UIColor whiteColor];
    _integrationLabel2.textColor = [UIColor whiteColor];
    
    
//    _daylyLabel.text = @"+5积分";
    _daylyLabel2.text = @"每日签到";
    _daylyLabel.font = [UIFont systemFontOfSize:12];
    _daylyLabel2.font = [UIFont systemFontOfSize:12];
    _daylyLabel.textAlignment = NSTextAlignmentCenter;
    _daylyLabel2.textAlignment = NSTextAlignmentCenter;
    _daylyLabel.textColor = [UIColor whiteColor];
    _daylyLabel2.textColor = [UIColor whiteColor];
    
    
    
    
    
    _myOrderBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 174, 110, 75)];
    _myFavorBtn = [[UIButton alloc] initWithFrame:CGRectMake(110, 174, 100, 75)];
    _myCouponBtn = [[UIButton alloc] initWithFrame:CGRectMake(210, 174, 110, 75)];
    
    
    _myCommentBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 195+64, 320, 45)];
    _myAddrBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 240+64, 320, 45)];
    _bussInfoBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 285+64, 320, 45)];
    

    
    
//    [_myOrderBtn setTitle:@"我的订单" forState:UIControlStateNormal];
//    [_myFavorBtn setTitle:@"我的收藏夹" forState:UIControlStateNormal];
//    [_myCouponBtn setTitle:@"我的优惠券" forState:UIControlStateNormal];
    
//    _myOrderBtn.backgroundColor = [UIColor whiteColor];
//    _myFavorBtn.backgroundColor = [UIColor blueColor];
//    _myCouponBtn.backgroundColor = [UIColor whiteColor];
    
    
    [_myOrderBtn setBackgroundImage:[UIImage imageNamed:@"会员_02.png"] forState:UIControlStateNormal];
    [_myFavorBtn setBackgroundImage:[UIImage imageNamed:@"会员_03.png"] forState:UIControlStateNormal];
    [_myCouponBtn setBackgroundImage:[UIImage imageNamed:@"会员_04.png"] forState:UIControlStateNormal];
    
    [_myCommentBtn setBackgroundImage:[UIImage imageNamed:@"bgArrow.png"] forState:UIControlStateNormal];
    [_myAddrBtn setBackgroundImage:[UIImage imageNamed:@"bgArrow.png"] forState:UIControlStateNormal];
    [_bussInfoBtn setBackgroundImage:[UIImage imageNamed:@"bgArrow.png"] forState:UIControlStateNormal];
    
    
//    _myCommentBtn.backgroundColor = [UIColor greenColor];
//    _myAddrBtn.backgroundColor = [UIColor brownColor];
//    _bussInfoBtn.backgroundColor = [UIColor grayColor];
    
    [_bussInfoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_myCommentBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_myAddrBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
//    [_bussInfoBtn set]
    
    [_bussInfoBtn setTitle:@"商家信息" forState:UIControlStateNormal];
    [_myCommentBtn setTitle:@"我的评论" forState:UIControlStateNormal];
    [_myAddrBtn setTitle:@"我的收货地址" forState:UIControlStateNormal];
    
    
    _logoutBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 50 - 60 , 300,  46)];
    
    [_logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [_logoutBtn setBackgroundColor:DarkGray];
    _logoutBtn.layer.cornerRadius = 4.0;
    
    [_logoutBtn addTarget:self action:@selector(userlogout) forControlEvents:UIControlEventTouchUpInside];
//    _logoutBtn.backgroundColor = [UIColor redColor];
    
    [_myOrderBtn addTarget:self action:@selector(gotoMyHistoryController) forControlEvents:UIControlEventTouchUpInside];
    
    [_myCouponBtn addTarget:self action:@selector(gotoCouponViewController) forControlEvents:UIControlEventTouchUpInside];
    [_myFavorBtn addTarget:self action:@selector(gotoMyFavViewController) forControlEvents:UIControlEventTouchUpInside];
    
    [_myCommentBtn addTarget:self action:@selector(gotoCommentViewController) forControlEvents:UIControlEventTouchUpInside];
    [_myAddrBtn addTarget:self action:@selector(gotoAddressController) forControlEvents:UIControlEventTouchUpInside];
    [_bussInfoBtn addTarget:self action:@selector(gotoShopInfoController) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor = BackGray;
    
    [temp addSubview:_settingBtn];
    [temp addSubview:_headImageView];
    [temp addSubview:_nameLabel];
    [temp addSubview:_sexImageView];
    [temp addSubview:_telLabel];
    [temp addSubview:_punchBtn];
    [temp addSubview:_priceLabel];
    [temp addSubview:_priceLabel2];
    [temp addSubview:_integrationLabel];
    [temp addSubview:_integrationLabel2];
    [temp addSubview:_daylyLabel];
    [temp addSubview:_daylyLabel2];
    
    [self.view addSubview:temp];
    [self.view addSubview:_myOrderBtn];
    [self.view addSubview:_myFavorBtn];
    [self.view addSubview:_myCouponBtn];
    [self.view addSubview:_myCommentBtn];
    [self.view addSubview:_myAddrBtn];
    [self.view addSubview:_bussInfoBtn];
    [self.view addSubview:_logoutBtn];
    
    
    self.navigationController.navigationBarHidden = YES;
    
//    [self reFillLayouts];
    
//    UserInfoModel *user = [CoreHelper getLoginInfo];
//    _requestModel = [[UserInfoRequestModel alloc] initWithSellId:@"100" uid:user.uid];
    
    _responseModel = [[AnotherUserInfoResponseModel alloc] init];
    _signResponseModel = [[SignResponseModel alloc] init];
    _requestModel = [[UserInfoRequestModel alloc] initWithSellId:@"100" uid:[CoreHelper getLoginUid]];
    _requestModel.delegate = self;
    _requestModel.tag = 10001;
    [_requestModel postData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

//-(void)viewWillDisappear:(BOOL)animated
//{
//    [self viewWillDisappear:animated];
//    self.navigationController.navigationBarHidden = false;
//}

//-(void)reFillLayouts
//{
//    
//    UserInfoModel *user = [CoreHelper getLoginInfo];
//    
//    [_headImageView setImageWithURL:user.avatar placeholderImage:[UIImage imageNamed:@""] success:nil failure:nil];
//    
//    if (user.sex == 1) {
//        [_sexImageView setImage:[UIImage imageNamed:@""]];
//    }
//    else
//    {
//        [_sexImageView setImage:[UIImage imageNamed:@""]];
//    }
//    
//    _nameLabel.text = user.nickName;
//    _telLabel.text = user.phone;
//    
//}

-(void)reFillContent
{
    [_headImageView setImageWithURL:_responseModel.avatar placeholderImage:[UIImage imageNamed:@"头像-会员.png"] success:nil failure:nil];
    
    if (_responseModel.sex == 1) {
        [_sexImageView setImage:[UIImage imageNamed:@"性别男.png"]];
    }
    else
    {
        [_sexImageView setImage:[UIImage imageNamed:@"性别-女.png"]];
    }
    
    _nameLabel.text = _responseModel.userName;
    _telLabel.text = _responseModel.phone;
    
    _priceLabel.text = _responseModel.money;
    _integrationLabel.text = _responseModel.integral;
    _daylyLabel.text = _responseModel.signIntegral;
    
    [_punchBtn setBackgroundImage:[UIImage imageNamed:@"签到-bg.png"] forState:UIControlStateNormal];
    [_punchBtn setBackgroundImage:[UIImage imageNamed:@"签到-bg.png"] forState:UIControlStateDisabled];
    _punchBtn.font = [UIFont systemFontOfSize:14];
    if (_responseModel.signin == 1) {
        
        [_punchBtn setTitle:@"已签到" forState:UIControlStateNormal];
        [_punchBtn setEnabled:false];
    }
    else
    {
        [_punchBtn setTitle:@"签到" forState:UIControlStateNormal];

        [_punchBtn setEnabled:true];
        [_punchBtn addTarget:self action:@selector(punchClick) forControlEvents:UIControlEventTouchUpInside];
    }
//
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


-(void)gotoShopInfoController
{
    ShooInfoController *shopInfoVC = [[ShooInfoController alloc] init];
    [shopInfoVC showBackButton];
//    shopInfoVC.title = @"商家信息";
    [self.navigationController pushViewController:shopInfoVC animated:YES];
    
}

-(void)gotoCommentViewController
{
    MyCommentViewController *commVC = [[MyCommentViewController alloc] initWithTitle:@"我的评论"];
    [self presentViewController:commVC animated:YES completion:nil];
}

-(void)gotoCouponViewController
{
    UserCouponViewController *coupVC = [[UserCouponViewController alloc] initWithTitle:@"我的优惠券"];
    [self presentViewController:coupVC animated:YES completion:nil];
}
-(void)gotoMyFavViewController
{
    MyFavViewController *favVC = [[MyFavViewController alloc] init];
    [favVC showBackButton];
    [self.navigationController pushViewController:favVC animated:YES];
}

-(void)gotoMyHistoryController
{
    MyHistoryViewController *hstVC = [[MyHistoryViewController alloc] initWithTitle:@"我的订单"];
    [self presentViewController:hstVC animated:YES completion:nil];
}

-(void)gotoAddressController
{
    AddressViewController *favVC = [[AddressViewController alloc] initWithTitle:@"我的收货地址" uid:[CoreHelper getLoginUid]];
    [self presentViewController:favVC animated:YES completion:nil];
}

-(void)userlogout
{
    [CoreHelper logout];
    
    [self.tabBarController setSelectedIndex:0];
    [self.tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbg-1.png"]];
}

-(void)requestFailed:(NSString *)errorStr
{
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    switch (model.ResponseTag) {
        case 10001:
        {
            
            _responseModel = (AnotherUserInfoResponseModel *)model;
            [self reFillContent];
        }
            break;
        case 10002:
        {
            if (model.ResponseStatus == 1) {
                _signResponseModel = (SignResponseModel *)model;
                [self signFinish];

            }
        }
            break;
        default:
            break;
    }
}


-(void)signFinish
{
    //更新按钮状态
    [_punchBtn setTitle:@"已签到" forState:UIControlStateNormal];
    [_punchBtn setEnabled:false];
    //更新积分显示
    
    _integrationLabel.text =  [NSString stringWithFormat:@"%d分",[_responseModel.integral integerValue] + _signResponseModel.integral];
}


-(void)settingBtnClick:(id)sender
{
    NSLog(@"setting click");
}

-(void)punchClick
{
    _signRequestModel = [[UserInfoRequestModel alloc] initWithSellId:@"100" uid:[CoreHelper getLoginUid]];
    _signRequestModel.delegate = self;
    _signRequestModel.tag = 10002;
    [_signRequestModel sign];
}

@end
