//
//  UserCouponViewController.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "UserCouponViewController.h"

@interface UserCouponViewController ()

@property (nonatomic,strong) CouponModel *temp;

@end

@implementation UserCouponViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id)initWithTitle:(NSString *)str
{
    self = [super initWithTitle:str];
    if (self) {
        //
        
        _requestModel = [[CouponRequestModel alloc] initWithSeller:CustomID Start:@"0" Limit:@"10"];
        _responseModel = [[UserCouponResponseModel alloc] init];
        
        _uoRequestModel = [[updateOrderRequestModel alloc] init];
        
        _temp = [[CouponModel alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _couponTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    
    [self.view addSubview:_couponTable];
    
    _couponTable.dataSource = self;
    _couponTable.delegate = self;
    _couponTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _couponTable.backgroundColor = BackGray;
    
    _requestModel.uid = [CoreHelper getLoginUid];
    _requestModel.delegate = self;
    _requestModel.tag = 10001;
    [_requestModel postUserCoupon];
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
    
    switch (model.ResponseTag) {
        case 10001:
            _responseModel = (UserCouponResponseModel *)model;
            [_couponTable reloadData];
            break;
        case 10002:
            [SVProgressHUD showSuccessWithStatus_custom:@"优惠券使用成功" duration:1.2];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"kCouponUse" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:_temp.couponid,@"couponId",_temp.title,@"title", nil]];
            break;
        default:
            break;
    }
    
    

    
    

}


-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [_responseModel.couponArr count]?[_responseModel.couponArr count ]:0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    DiscountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[DiscountTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell fillCellByModel:[_responseModel.couponArr objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    _temp = [[CouponModel alloc] init];
    _temp = [_responseModel.couponArr objectAtIndex:indexPath.row];
    
    
    _uoRequestModel.tag = 10002;
    _uoRequestModel.delegate = self;
    _uoRequestModel.couponId = _temp.couponid;
    
    [_uoRequestModel postData];
    



}

@end
