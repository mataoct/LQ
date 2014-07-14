//
//  MemberCenterViewController.m
//  lq
//
//  Created by  matao on 14-7-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MemberCenterViewController.h"

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
    
    
    _headImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, 60, 20)];
    _sexImageView = [[UIImageView alloc] initWithFrame:CGRectMake(160, 10, 20, 20)];
    _telLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 30, 80, 15)];
    _punchBtn = [[UIButton alloc] initWithFrame:CGRectMake(230, 10, 60, 20)];
    
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 60, 60, 15)];
    _integrationLabel = [[UILabel alloc] initWithFrame:CGRectMake(165, 60, 60, 15)];
    _daylyLabel = [[UILabel alloc] initWithFrame:CGRectMake(240, 60, 60, 15)];
    
    _priceLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(100, 75, 60, 15)];
    _integrationLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(165, 75, 60, 15)];
    _daylyLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(240, 75, 60, 15)];
    
    
    
    _headImageView.backgroundColor = [UIColor purpleColor];
    _nameLabel.backgroundColor = [UIColor blueColor];
    _sexImageView.backgroundColor = [UIColor orangeColor];
    _telLabel.backgroundColor = [UIColor greenColor];
    
    _punchBtn.backgroundColor = [UIColor grayColor];
    
    _priceLabel.text = @"9.00";
    _priceLabel2.text = @"账户余额";
    _priceLabel.font = [UIFont systemFontOfSize:12];
    _priceLabel2.font = [UIFont systemFontOfSize:12];
    _priceLabel.textAlignment = NSTextAlignmentCenter;
    _priceLabel2.textAlignment = NSTextAlignmentCenter;
    
    _integrationLabel.text = @"258";
    _integrationLabel2.text = @"可用积分";
    _integrationLabel.font = [UIFont systemFontOfSize:12];
    _integrationLabel2.font = [UIFont systemFontOfSize:12];
    _integrationLabel.textAlignment = NSTextAlignmentCenter;
    _integrationLabel2.textAlignment = NSTextAlignmentCenter;
    
    
    _daylyLabel.text = @"+5积分";
    _daylyLabel2.text = @"每日签到";
    _daylyLabel.font = [UIFont systemFontOfSize:12];
    _daylyLabel2.font = [UIFont systemFontOfSize:12];
    _daylyLabel.textAlignment = NSTextAlignmentCenter;
    _daylyLabel2.textAlignment = NSTextAlignmentCenter;
    
    
    
    
    
    _myOrderBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, 100, 40)];
    _myFavorBtn = [[UIButton alloc] initWithFrame:CGRectMake(110, 100, 100, 40)];
    _myCouponBtn = [[UIButton alloc] initWithFrame:CGRectMake(210, 100, 100, 40)];
    
    
    _myCommentBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 300, 40)];
    _myAddrBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 190, 300, 40)];
    _bussInfoBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 230, 300, 40)];
    
    
    
    [_myOrderBtn setTitle:@"我的订单" forState:UIControlStateNormal];
    [_myFavorBtn setTitle:@"我的收藏夹" forState:UIControlStateNormal];
    [_myCouponBtn setTitle:@"我的优惠券" forState:UIControlStateNormal];
    
    _myOrderBtn.backgroundColor = [UIColor greenColor];
    _myFavorBtn.backgroundColor = [UIColor blueColor];
    _myCouponBtn.backgroundColor = [UIColor purpleColor];
    
    
    _myCommentBtn.backgroundColor = [UIColor greenColor];
    _myAddrBtn.backgroundColor = [UIColor brownColor];
    _bussInfoBtn.backgroundColor = [UIColor grayColor];
    
    
    
    _logoutBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, self.view.frame.size.height - 178 , 300,  20)];
    
    [_logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    _logoutBtn.backgroundColor = [UIColor redColor];
    
    
    
    
    [self.view addSubview:_headImageView];
    [self.view addSubview:_nameLabel];
    [self.view addSubview:_sexImageView];
    [self.view addSubview:_telLabel];
    [self.view addSubview:_punchBtn];
    [self.view addSubview:_priceLabel];
    [self.view addSubview:_priceLabel2];
    [self.view addSubview:_integrationLabel];
    [self.view addSubview:_integrationLabel2];
    [self.view addSubview:_daylyLabel];
    [self.view addSubview:_daylyLabel2];
    [self.view addSubview:_myOrderBtn];
    [self.view addSubview:_myFavorBtn];
    [self.view addSubview:_myCouponBtn];
    [self.view addSubview:_myCommentBtn];
    [self.view addSubview:_myAddrBtn];
    [self.view addSubview:_bussInfoBtn];
    [self.view addSubview:_logoutBtn];
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

@end
