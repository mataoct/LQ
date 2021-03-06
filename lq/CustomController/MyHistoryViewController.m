//
//  MyHistoryViewController.m
//  lq
//
//  Created by  matao on 14-9-1.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MyHistoryViewController.h"

@interface MyHistoryViewController ()

@property (nonatomic,strong) NSMutableArray *sourceArr;

@property (nonatomic,strong) NSMutableArray *oneArr;
@property (nonatomic,strong) NSMutableArray *twoArr;

@property (nonatomic,assign) NSInteger start;


@property (nonatomic,strong) HistoryModel *deleteTarget;

@end

@implementation MyHistoryViewController

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
        
        _historyRequest = [[CouponRequestModel alloc] initWithSeller:CustomID Start:@"0" Limit:@"30"];
        _historyRequest.delegate = self;
        _historyRequest.tag = 10001;
        
        _cancleRequest = [[CancleRequestModel alloc] init];
        _cancleRequest.delegate = self;
        _cancleRequest.tag = 10002;
        
        
        _historyResponse = [[HistoryResponseModel alloc] init];
        ;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn. frame=CGRectMake(15, 5, 23, 23);
    [btn setBackgroundImage:[UIImage imageNamed:@"标题--电话.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(selectRightAction:)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *call=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    
    
    self.item.rightBarButtonItem = call;

    
    
    _sourceArr = [[NSMutableArray alloc] init];
    _oneArr = [[NSMutableArray alloc] init];
    _twoArr = [[NSMutableArray alloc] init];
    _start = 0;
    
    NSArray *buttonNames = [NSArray arrayWithObjects:@"未完成订单", @"历史订单", nil];
    _seg = [[UISegmentedControl alloc] initWithItems:buttonNames];
    [_seg addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [_seg setFrame:CGRectMake(10, 74, 300, 26)];
    [_seg setSelectedSegmentIndex:0];
    _seg.tintColor = DarkGreen;
    _hstTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 110, 320, self.view.frame.size.height - 110) style:UITableViewStylePlain];
    _hstTable.delegate = self;
    _hstTable.dataSource = self;
    _hstTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _hstTable.backgroundColor = BackGray;
    [self addHeader];
    [self.view addSubview:_hstTable];
    [self.view addSubview:_seg];
    
//    [_historyRequest postForHistory:[CoreHelper getLoginUid]];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _start = 0;
    _historyRequest.start = [NSString stringWithFormat:@"%d",_start];
    
    [_oneArr removeAllObjects];
    [_twoArr removeAllObjects];
    [_sourceArr removeAllObjects];
    [_historyRequest postForHistory:[CoreHelper getLoginUid]];

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    HistoryModel *temp = [_sourceArr objectAtIndex:section];
    return [temp.goodArr count]  + 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_sourceArr count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    HistoryModel *temp = [_sourceArr objectAtIndex:section];
    return [NSString stringWithFormat:@" 订单编号：%@",temp.orderId];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* myView = [[UIView alloc] init];
    HistoryModel *temp = [_sourceArr objectAtIndex:section];
    myView.backgroundColor = DarkGreen;
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 100, 22)];
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor=[UIColor whiteColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text=[NSString stringWithFormat:@" 订单编号：%@",temp.orderId];
    
    [myView addSubview:titleLabel];
    return myView;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    HistoryModel *temp = [_sourceArr objectAtIndex:indexPath.section];
    
    if (indexPath.row < [temp.goodArr count] ) {
        static NSString *cartCell = @"cartCell";
        CartTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:cartCell];
        
        if (cell == nil) {
            //
            cell = [[CartTableViewCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cartCell];
        }
        [cell fillCellByModel:[temp.goodArr objectAtIndex:indexPath.row]];
        [cell.selectBtn setHidden:YES];
        return cell;
    }
    else
    {
        static NSString *systemCell = @"cell";
        HistoryDetailTableViewCell *defaultCell = [tableView dequeueReusableCellWithIdentifier:systemCell];
        if (defaultCell == nil) {
            defaultCell = [[HistoryDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:systemCell];
        }
//        defaultCell.textLabel.text = @"2";
        
        defaultCell.delegate = self;
        
        HistoryModel *temp = [_sourceArr objectAtIndex:indexPath.section];
        defaultCell.orderId =temp.orderId;
        
        [defaultCell fillCellByModel:temp];
        
        if (defaultCell.model.status != 0 ) {
            [defaultCell.payBtn setHidden:YES];
            [defaultCell.cancleBtn setHidden:YES];
        }
        else
        {
            [defaultCell.payBtn setHidden:NO];
            [defaultCell.cancleBtn setHidden:NO];
        }
        
        defaultCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return defaultCell;
    }
    

    
}


-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HistoryModel *temp = [_sourceArr objectAtIndex:indexPath.section];
    
    if (indexPath.row < [temp.goodArr count] ) {
        return 91.0;
    }
    else
    {
        return 161.0;
    }
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
    [_hstTable headerEndRefreshing];
    
    [SVProgressHUD showErrorWithStatus_custom:errorStr duration:1.3];
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    
    
    switch (model.ResponseTag) {
        case 10001:
            //
        {
            _historyResponse = (HistoryResponseModel *)model;
            //    NSLog(@"heheheheh %@,%@",_historyResponse.historyArr,_historyResponse.unPayArr);
            
            if ([_historyResponse.historyArr count] > 0) {
                for (HistoryModel *temp in _historyResponse.historyArr) {
                    if (temp.status != 0) {
                        //
                        [_oneArr addObject:temp];
                    }
                    else
                    {
                        [_twoArr addObject:temp];
                    }
                }
                
                _start ++;
            }
            
            if (_seg.selectedSegmentIndex != 0) {
                _sourceArr = _oneArr;
            }
            else
            {
                _sourceArr = _twoArr;
            }
            
            [_hstTable headerEndRefreshing];
            [_hstTable reloadData];

        }
            break;
        case 10002:
        {            
            [_sourceArr removeObject:_deleteTarget];
            [_hstTable reloadData];
            
            [SVProgressHUD showSuccessWithStatus_custom:@"订单已取消" duration:1.2];
        }
            break;
        default:
            break;
    }
    
    
 }



-(void)segmentAction:(UISegmentedControl *)seg{
    //    NSInteger Index = seg.selectedSegmentIndex;
    
//    _start = 0;
//    [_sourceArr removeAllObjects];
    
    switch (seg.selectedSegmentIndex) {
        case 1:
            _sourceArr = _oneArr;
            break;
        case 0:
            _sourceArr = _twoArr;
            break;
            
        default:
            break;
    }
    
    [_hstTable reloadData];
}


- (void)addHeader
{
    __unsafe_unretained typeof(self) wself = self;
    // 添加下拉刷新头部控件
    [_hstTable addHeaderWithCallback:^{
        // 进入刷新状态就会回调这个Block
        
        wself.historyRequest.start = [NSString stringWithFormat:@"%d",wself.start];
        [wself.historyRequest postForHistory:[CoreHelper getLoginUid]];
    }];
}

-(void)payNowClick:(NSString *)orderId
{
    OrderDetailViewController *orderDetailVC = [[OrderDetailViewController alloc] initWithTitle:@"订单详情" orderId:orderId];
    
    [self presentViewController:orderDetailVC animated:YES completion:nil];

}


-(void)cancleOrder:(NSString *)orderId model:(HistoryModel *)model
{
    _cancleRequest.orderId = orderId;
    _cancleRequest.status = @"-1";
    _cancleRequest.uid = [CoreHelper getLoginUid];
    _deleteTarget = model;
    
    [_cancleRequest postData];
}

-(void)selectRightAction:(id)sender
{
    [CoreHelper callService:[CoreHelper getSellerPhone]];
}

@end
