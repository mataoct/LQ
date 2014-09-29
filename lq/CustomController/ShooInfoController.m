//
//  ShooInfoController.m
//  lq
//
//  Created by  matao on 14-7-15.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "ShooInfoController.h"

@interface ShooInfoController ()

@end

@implementation ShooInfoController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self) {
        //
        _requestModel = [[SellerInfoRequestModel alloc] initWithSeller:CustomID];
        _responseModel = [[SellerInfoResponseModel alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = false;
    
    self.title = @"商家信息";
    
    _infoView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 180)];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
    _telLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, 235, 44)];
    _telBtn = [[UIButton alloc] initWithFrame:CGRectMake(236, 45, 64, 44)];
    _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 90, 235, 44)];
    _addressBtn = [[UIButton alloc] initWithFrame:CGRectMake(236, 90, 64, 44)];
    
    
    _telBtn.backgroundColor = [UIColor whiteColor];
    [_telBtn setBackgroundImage:[UIImage imageNamed:@"电话.png"] forState:UIControlStateNormal];
    
    _addressBtn.backgroundColor = [UIColor whiteColor];
    [_addressBtn setBackgroundImage:[UIImage imageNamed:@"地址.png"] forState:UIControlStateNormal];
    
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.view.backgroundColor = BackGray;
    
    _telLabel.backgroundColor = [UIColor whiteColor];
    _titleLabel.backgroundColor = [UIColor whiteColor];
    _addressLabel.backgroundColor = [UIColor whiteColor];
    
    [_infoView addSubview:_titleLabel];
    [_infoView addSubview:_telLabel];
    [_infoView addSubview:_telBtn];
    [_infoView addSubview:_addressLabel];
    [_infoView addSubview:_addressBtn];
    
    [_infoView setBackgroundColor:BackGray];
    
    
    
    
    
    _introduceView = [[UIView alloc] initWithFrame:CGRectMake(10, 154, 300, 125)];
    _headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 24)];
    _introduceField = [[UITextView alloc] initWithFrame:CGRectMake(0, 25, 300, 100)];
    
    
    
    _headLabel.backgroundColor = [UIColor whiteColor];
    
    _introduceField.editable  = false;
    _introduceField.backgroundColor = [UIColor whiteColor];
    
    [_introduceView addSubview:_headLabel];
    [_introduceView addSubview:_introduceField];
    
    
    
    
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _telLabel.font = [UIFont systemFontOfSize:14];
    _addressLabel.font = [UIFont systemFontOfSize:14];
    
    _headLabel.font = [UIFont systemFontOfSize:13];
    
    
    
    [self.view addSubview:_infoView];
    [self.view addSubview:_introduceView];
    
    _requestModel.delegate = self;
    [_requestModel postData];
    
    
}



-(void)reFillLayouts
{
    _titleLabel.text = _responseModel.name;
    _telLabel.text = _responseModel.phone;
    _addressLabel.text = _responseModel.address;
    _headLabel.text = @"商家简介";
    
    _introduceField.text = _responseModel.myDescription;
    
//    [_telBtn setBackgroundColor:[UIColor blueColor]];
    [_telBtn addTarget:self action:@selector(makePhoneCall) forControlEvents:UIControlEventTouchUpInside];
    
    [_addressBtn addTarget:self action:@selector(showMap) forControlEvents:UIControlEventTouchUpInside];
    
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

-(void)requestFailed:(NSString *)errorStr
{
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _responseModel = (SellerInfoResponseModel *)model;
    [self reFillLayouts];
}

-(void)makePhoneCall
{
    [CoreHelper callService:_responseModel.phone];
}

-(void)showMap
{
    HKBaiduMapViewController *mapVC = [[HKBaiduMapViewController alloc] initWithX:_responseModel.pointy Y:_responseModel.pointx];
    [mapVC showBackButton];
    mapVC.title = @"商家位置";
    [self.navigationController pushViewController:mapVC animated:YES];
}

@end
