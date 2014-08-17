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
    _couponTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 74, 300, self.view.frame.size.height - 74) style:UITableViewStylePlain];
    
    [self.view addSubview:_couponTable];
    
    _couponTable.dataSource = self;
    _couponTable.delegate = self;
    
    _requestModel.uid = @"3";
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
    return 110.0;
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

@end
