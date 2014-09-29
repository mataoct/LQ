//
//  CartViewController.m
//  lq
//
//  Created by  matao on 14-8-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()

@property (nonatomic,strong) UIView *emptyView;

@property (nonatomic,strong) UIImageView *emptyImageView;
@property (nonatomic,strong) UILabel *emptyLabel;
@property (nonatomic,strong) UIButton *emptyBtn;


@property (nonatomic,strong) UITabBarItem *rightButton;

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
    
    _delRequestModel = [[DelCartRequestModel alloc] init];
    
    UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn. frame=CGRectMake(15, 5, 40, 40);
    [btn setBackgroundImage:[UIImage imageNamed:@"删除.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(deleteCheckedItem:)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *back=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.rightBarButtonItem = back;
    
    _emptyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height - 20-44 - 60 - 50)];
    _emptyImageView = [[UIImageView alloc] initWithFrame:CGRectMake(108, 108, 104, 94)];
    _emptyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 212, 320, 20)];
    _emptyBtn = [[UIButton alloc] initWithFrame:CGRectMake(95, 282, 130, 36)];
    
    [_emptyImageView setImage:[UIImage imageNamed:@"购物车-空.png"]];
    _emptyLabel.text = @"您的购物车还是空的，赶紧去挑选几件吧";
    _emptyLabel.font = [UIFont systemFontOfSize:13];
    _emptyLabel.textAlignment = NSTextAlignmentCenter;
    _emptyLabel.textColor = [UIColor grayColor];
    
    [_emptyBtn setTitle:@"去逛逛" forState:UIControlStateNormal];
    _emptyBtn.layer.cornerRadius = 4;
    _emptyBtn.layer.masksToBounds = YES;
    _emptyBtn.backgroundColor = DarkGreen;
    _emptyBtn.font = [UIFont systemFontOfSize:16];
    
    [_emptyBtn addTarget:self action:@selector(goShopping:) forControlEvents:UIControlEventTouchUpInside];
    
    
    _emptyImageView.userInteractionEnabled =YES;
    _emptyView.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goShopping:)];
    [_emptyView addGestureRecognizer:tapGesture];
    
    [_emptyView addSubview:_emptyImageView];
    [_emptyView addSubview:_emptyLabel];
    [_emptyView addSubview:_emptyBtn];
    
    
    
    
    
    //tableView
    _cartTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height - 20-44 - 60 - 50) style:UITableViewStylePlain];
    _priceCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 40, 20)];
    _priceCountValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(55, 20, 120, 20)];
    _checkBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 10, 100, 40)];
    
    _checkBtn.backgroundColor = Pink;
    _checkBtn.layer.cornerRadius = 4.0;
    [_checkBtn setTitle:@"结算" forState:UIControlStateNormal];
    
    _priceCountLabel.font = [UIFont systemFontOfSize:12];
    _priceCountValueLabel.font = [UIFont systemFontOfSize:16];
    
    
    [_checkBtn addTarget:self action:@selector(sendOrder) forControlEvents:UIControlEventTouchUpInside];
    
    _footView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 20-44 -60 - 49, 320, 60)];
    
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
//    [_requestModel postData];
    
    
    [self.view addSubview:_emptyView];
    [self.view addSubview:_cartTable];
    [self.view addSubview:_footView];
    
    
    _emptyView.hidden = YES;
    _cartTable.hidden = YES;
    _footView.hidden = YES;
    
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"....");
    
    [_requestModel postData];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_selectDic removeAllObjects];
    
    [_requestModel.request cancel];
    
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
    [SVProgressHUD showErrorWithStatus_custom:errorStr duration:1.4];
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
            break;
        case 10003:
        {
            for (NSString *str in [_selectDic allKeys]) {
                [_responseModel.cartArr removeObject:[_selectDic objectForKey:str]];
            }
            
//            NSLog(@"select all %@",[[_selectDic allKeys] componentsJoinedByString:@","]);
            
            [self reLayoutViews];
            [SVProgressHUD showSuccessWithStatus_custom:@"删除成功" duration:1.2];

        }
            break;
        default:
            break;
    }
    

}

-(void)reLayoutViews
{
    if ([_responseModel.cartArr count] > 0) {
        _cartTable.hidden = false;
        _footView.hidden = false;
        _emptyView.hidden = true;
        [_cartTable reloadData];
        _priceCountLabel.text = @"合计：";
        _priceCountLabel.textColor = [UIColor blackColor];
        _priceCountValueLabel.text = @"￥0.0";// [NSString stringWithFormat:@"￥%@",_responseModel.totalPrice]  ;
        
        
        _priceCountValueLabel.textColor = Pink;
    }
    else
    {
        _emptyView.hidden = false;
        _cartTable.hidden = true;
        _footView.hidden = true;
        [_cartTable reloadData];
    }
    
    

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
    
//    cell.selectStatus = 0;
    
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
    [self updateTotalPrice];
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
    
    if ([_selectDic count] <= 0) {
        return;
    }
    

    
    _signRequestModel = [[SignatureRequestModel alloc] initWithSeller:CustomID uid:[CoreHelper getLoginUid] args:[_selectDic allValues]];
    
    _signRequestModel.delegate = self;
    _signRequestModel.tag = 10002;
    [_signRequestModel postData];
    
}

-(void)updateTotalPrice
{
    float total = 0;
    
    NSLog(@"%@",_selectDic);
    
    for (NSString  *key in _selectDic) {
        
        ShoppingCartItemModel *model = _selectDic[key];
        
        total = total + [model.num integerValue]* [model.nowPrice floatValue];
    }
    
    _priceCountValueLabel.text = [NSString stringWithFormat:@"￥%.2f",total];
    
}

-(void)goShopping:(id *)gesture
{
//    [self.tabBarController.tabBar setsel]
    [self.tabBarController setSelectedIndex:2];
    [self.tabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbg-3.png"]];
}

-(void)deleteCheckedItem:(id)sender
{
    _delRequestModel.uid = [CoreHelper getLoginUid];
 
    
    if ([_selectDic count] > 0) {
        ShoppingCartItemModel *temp = [[ShoppingCartItemModel alloc] init];
        
        
        for (int i = 0; i < [_selectDic count]; i++) {
            //
            temp = [_responseModel.cartArr  objectAtIndex:[[[_selectDic allKeys] objectAtIndex:i] intValue]];
//            _delRequestModel.gid = [_delRequestModel.gid stringByAppending]
            if (i == 0) {
                _delRequestModel.gid = temp.gid;
            }
            else
            {
                _delRequestModel.gid = [_delRequestModel.gid stringByAppendingFormat:@",%@",temp.gid];
            }
        }
                
        _delRequestModel.tag = 10003;
        _delRequestModel.delegate = self;
        [_delRequestModel postData];
    }
    
}





@end
