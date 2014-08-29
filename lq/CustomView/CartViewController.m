//
//  CartViewController.m
//  lq
//
//  Created by  matao on 14-8-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()

@end

@implementation CartViewController

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
    
    _requestModel = [[CartRequestModel alloc] initWithUid:[CoreHelper getLoginUid]];
    
    _selectDic = [[NSMutableDictionary alloc] init];
    
    _cartTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height - 20-44 - 60 - 50) style:UITableViewStylePlain];
    _priceCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 40, 20)];
    _priceCountValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 20, 60, 20)];
    _checkBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 10, 100, 40)];
    
    _checkBtn.backgroundColor = Pink;
    _checkBtn.layer.cornerRadius = 4.0;
    [_checkBtn setTitle:@"结算" forState:UIControlStateNormal];
    
    _priceCountLabel.font = [UIFont systemFontOfSize:12];
    _priceCountValueLabel.font = [UIFont systemFontOfSize:16];
    
    
    [_checkBtn addTarget:self action:@selector(sendOrder) forControlEvents:UIControlEventTouchUpInside];
    
    _footView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 20-44 -60 - 50, 320, 60)];
    
    [_footView addSubview:_priceCountLabel];
    [_footView addSubview:_priceCountValueLabel];
    [_footView addSubview:_checkBtn];
    
    _footView.backgroundColor = DarkGray;
    
    
    _cartTable.delegate = self;
    _cartTable.dataSource = self;
    _cartTable.backgroundColor = BackGray;
    _cartTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.view.backgroundColor = BackGray;
    
    _requestModel.delegate = self;
    _requestModel.tag = 10001;
    [_requestModel postData];
    
    [self.view addSubview:_cartTable];
    [self.view addSubview:_footView];
    
    
    // Do any additional setup after loading the view.
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
    
    switch (model.ResponseTag) {
        case 10001:
        {
            _responseModel = (ShoppingCartListResponseModel *)model;
            [self reLayoutViews];
        }
            break;
        case 10002:
        {
            _signResponseModel = (SignatureResponseModel *)model;
            
            NSLog(@"%@",_signResponseModel.orderId);
            
            OrderDetailViewController *orderDetailVC = [[OrderDetailViewController alloc] initWithTitle:@"订单详情" orderId:_signResponseModel.orderId];
            
            
            [self presentViewController:orderDetailVC animated:YES completion:nil];
            
        }
        default:
            break;
    }
    

}

-(void)reLayoutViews
{
    [_cartTable reloadData];
    _priceCountLabel.text = @"合计：";
    _priceCountLabel.textColor = [UIColor blackColor];
    _priceCountValueLabel.text = [NSString stringWithFormat:@"￥%@",_responseModel.totalPrice]  ;
    _priceCountValueLabel.textColor = [UIColor blackColor];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    CartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[CartTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell fillCellByModel:[_responseModel.cartArr objectAtIndex:indexPath.row]];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CartTableViewCell *cell = (CartTableViewCell *)[tableView  cellForRowAtIndexPath:indexPath];
    [cell changeSelectStatus];
    
    if (cell.selectStatus) {
        
//        ShoppingCartItemModel * tempModel = [[ShoppingCartItemModel alloc] initWithDic:[_responseModel.cartArr objectAtIndex:indexPath.row]];
        
        [_selectDic setObject:[_responseModel.cartArr objectAtIndex:indexPath.row] forKey:[NSString stringWithFormat:@"%d",indexPath.row]];
    }
    else
    {
        [_selectDic removeObjectForKey:[NSString stringWithFormat:@"%d",indexPath.row]];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
    return [_responseModel.cartArr count]?[_responseModel.cartArr count]:0;
}

-(void)sendOrder
{
//    for (ShoppingCartItemModel *item in [_selectDic allValues]) {
//        
//        NSLog(@"%@,%@",item.title,item.img);
//    }

    
    _signRequestModel = [[SignatureRequestModel alloc] initWithSeller:@"100" uid:[CoreHelper getLoginUid] args:[_selectDic allValues]];
    
    [_signRequestModel postData];
    _signRequestModel.delegate = self;
    _signRequestModel.tag = 10002;
    
}


@end
