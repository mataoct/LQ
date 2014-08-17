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
        
        _requestModel = [[SellerInfoRequestModel alloc] initWithSeller:@"100"];
        _responseModel = [[SellerInfoResponseModel alloc] init];
        
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"商家信息";
    
    _infoView = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 180)];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 60)];
    _telLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 61, 240, 60)];
    _telBtn = [[UIButton alloc] initWithFrame:CGRectMake(241, 61, 60, 60)];
    _addressLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 121, 240, 60)];
    _addressBtn = [[UIButton alloc] initWithFrame:CGRectMake(241, 121, 60, 60)];
    
    
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    

    
    
    [_infoView addSubview:_titleLabel];
    [_infoView addSubview:_telLabel];
    [_infoView addSubview:_telBtn];
    [_infoView addSubview:_addressLabel];
    [_infoView addSubview:_addressBtn];
    
    
    
    
    
    _introduceView = [[UIView alloc] initWithFrame:CGRectMake(10, 200, 300, 240)];
    _headLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    _introduceField = [[UITextView alloc] initWithFrame:CGRectMake(0, 31, 300, 210)];
    
    
    
    _headLabel.backgroundColor = [UIColor greenColor];
    
    _introduceField.editable  = false;
    _introduceField.backgroundColor = [UIColor orangeColor];
    
    [_introduceView addSubview:_headLabel];
    [_introduceView addSubview:_introduceField];
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
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
    
    [_telBtn setBackgroundColor:[UIColor blueColor]];
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

-(void)requestFailed
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
    
    [self.navigationController pushViewController:mapVC animated:YES];
}

@end
