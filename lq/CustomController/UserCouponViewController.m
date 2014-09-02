//
//  UserCouponViewController.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "UserCouponViewController.h"

@interface UserCouponViewController ()

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
        
        _requestModel = [[CouponRequestModel alloc] initWithSeller:@"100" Start:@"0" Limit:@"10"];
        _responseModel = [[UserCouponResponseModel alloc] init];
        
       
        
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

-(void)requestFailed
{
}
-(void)requestSuccess:(BaseResponseModel *)model
{
    _responseModel = (UserCouponResponseModel *)model;
    [_couponTable reloadData];
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
    
    CouponModel *temp = [[CouponModel alloc] init];
    temp = [_responseModel.couponArr objectAtIndex:indexPath.row];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"kCouponUse" object:nil userInfo:[NSDictionary dictionaryWithObjectsAndKeys:temp.couponid,@"couponId",temp.title,@"title", nil]];

}

@end
