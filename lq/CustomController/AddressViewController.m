//
//  AddressViewController.m
//  lq
//
//  Created by  matao on 14-8-21.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "AddressViewController.h"

@interface AddressViewController ()

@end

@implementation AddressViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithTitle:(NSString *)str uid:(NSString *)uid
{
    self = [super initWithTitle:str];
    
    if (self) {
        
        _uid = [[NSString alloc] init];
        _uid = uid;
        
        _requestModel = [[UserInfoRequestModel alloc] initWithSellId:@"100" uid:_uid];
        _responseModel = [[AddressResponseModel alloc] init];
        
        
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 74, 100, 20)];
        _nameTf = [[UITextField alloc] initWithFrame:CGRectMake(10, 96, 300, 48)];
        
        _telLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 144, 100, 30)];
        _telTf = [[UITextField alloc] initWithFrame:CGRectMake(10, 174, 300, 48)];
        
        _addrLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 222, 100, 30)];
        _addrTf = [[UITextView alloc] initWithFrame:CGRectMake(10, 252, 300, 144)];
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    _rightButton = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(selectRightAction:)];
    self.item.rightBarButtonItem = _rightButton;
    // Do any additional setup after loading the view.
    
//    @property (nonatomic,strong) UILabel *nameLabel;
//    @property (nonatomic,strong) UITextField *nameTf;
//    @property (nonatomic,strong) UILabel *telLabel;
//    @property (nonatomic,strong) UITextField *telTf;
//    @property (nonatomic,strong) UILabel *addrLabel;
//    @property (nonatomic,strong) UITextField *addrTf;
    
    
    
    _nameLabel.font = [UIFont systemFontOfSize:14];
        _telLabel.font = [UIFont systemFontOfSize:14];
        _addrLabel.font = [UIFont systemFontOfSize:14];
    
    _nameLabel.text = @"联系人";
    _telLabel.text = @"联系电话";
    _addrLabel.text = @" 收货地址";
    
    
    
    _nameTf.font = [UIFont systemFontOfSize:16];
    _telTf.font = [UIFont systemFontOfSize:16];
    _addrTf.font = [UIFont systemFontOfSize:16];
    
    _nameTf.backgroundColor = [UIColor whiteColor];
    _telTf.backgroundColor = [UIColor whiteColor];
    
    
    
    [self.view addSubview:_nameLabel];
    [self.view addSubview:_nameTf];
    [self.view addSubview:_telLabel];
    [self.view addSubview:_telTf];
    [self.view addSubview:_addrLabel];
    [self.view addSubview:_addrTf];
    

    _requestModel.delegate = self;
    
    _requestModel.tag = 10001;
    
    [_requestModel getAddress];
    
}

-(void )reFillLayouts
{
    _nameTf.text = _responseModel.linkMan;
    _telTf.text = _responseModel.phone;
    _addrTf.text = _responseModel.address;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestFailed
{
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    switch (model.ResponseTag) {
        case 10001:
        {
            _responseModel = (AddressResponseModel *)model;
            [self reFillLayouts];
        }
            break;
        case 10002:
        {
            if (model.ResponseStatus == 1) {
                NSLog(@"addr save success") ;
            }
        }
            
        default:
            break;
    }
}


-(void)selectRightAction:(id)sender
{
    _saveRequestModel   = [[UserInfoRequestModel alloc] initWithSellId:@"100" uid:_uid];
    _saveRequestModel.delegate = self;
    _saveRequestModel.tag = 10002;
    [_saveRequestModel sendAddressLinkMan:_nameTf.text phone:_telTf.text address:_addrTf.text];
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
