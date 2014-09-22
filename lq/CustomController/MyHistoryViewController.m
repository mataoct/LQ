//
//  MyHistoryViewController.m
//  lq
//
//  Created by  matao on 14-9-1.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MyHistoryViewController.h"

@interface MyHistoryViewController ()

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
        
        _historyRequest = [[CouponRequestModel alloc] initWithSeller:@"100" Start:@"0" Limit:@"10"];
        _historyRequest.delegate = self;
        _historyRequest.tag = 10001;
        
        
        _historyResponse = [[HistoryResponseModel alloc] init];
        ;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _hstTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, self.view.frame.size.height - 64) style:UITableViewStylePlain];
    _hstTable.delegate = self;
    _hstTable.dataSource = self;
    _hstTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_hstTable];
    
    
    [_historyRequest postForHistory:[CoreHelper getLoginUid]];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    HistoryModel *temp = [_historyResponse.historyArr objectAtIndex:section];
    return [temp.goodArr count]  + 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_historyResponse.historyArr count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    HistoryModel *temp = [_historyResponse.historyArr objectAtIndex:section];
    return temp.orderId;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    switch (indexPath.row) {
//        case <#constant#>:
//            <#statements#>
//            break;
//            
//        default:
//            break;
//    }
    
    HistoryModel *temp = [_historyResponse.historyArr objectAtIndex:indexPath.section];
    
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
        
        
        [defaultCell fillCellByModel:temp];
        
        if (defaultCell.model.status != 0 ) {
            [defaultCell.payBtn setHidden:YES];
        }
        else
        {
            [defaultCell.payBtn setHidden:NO];
        }
        
        
        return defaultCell;
    }
    

    
}


-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HistoryModel *temp = [_historyResponse.historyArr objectAtIndex:indexPath.section];
    
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
    
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _historyResponse = (HistoryResponseModel *)model;
    NSLog(@"heheheheh %@,%@",_historyResponse.historyArr,_historyResponse.unPayArr);
    
    [_hstTable reloadData];
}

@end
