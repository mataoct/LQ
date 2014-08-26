//
//  MyFavViewController.m
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MyFavViewController.h"

@interface MyFavViewController ()

@property (nonatomic,assign) NSInteger selecFlag;

@end

@implementation MyFavViewController

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
    // Do any additional setup after loading the view.
    
    self.title = @"我的收藏";
    
    self.navigationController.navigationBarHidden = false;
    
    _requestModel = [[CouponRequestModel alloc] initWithSeller:@"100" Start:@"0" Limit:@"10"];
    _requestModel.uid = @"3";
    
    _requestModel.delegate = self;
    
    _responseModel = [[MyFavResponseModel alloc] init];
    
    _selecFlag = 0;
    _selectDic = [[NSMutableDictionary alloc] init];
    
    UIView *temp = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
    
    _allCheckBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 80, 20)];
    [_allCheckBtn setTitle:@"全选" forState:UIControlStateNormal];
    _allCheckBtn.backgroundColor = [UIColor blueColor];
    _favCountLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 5, 100, 20)];
    
    [temp addSubview:_allCheckBtn];
    [temp addSubview:_favCountLabel];
    [temp setBackgroundColor:[UIColor grayColor]];
    
    self.view.backgroundColor = BackGray;
    temp.backgroundColor = [UIColor whiteColor];
    
    
    _favTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 320, self.view.frame.size.height - 40 - 64 - 50)];
    _favTable.delegate = self;
    _favTable.dataSource = self;
    _favTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _favTable.backgroundColor = [UIColor greenColor];
    [self.view addSubview:temp];
    [self.view addSubview:_favTable];
    
    [_requestModel postFav];
}

-(void)reFillLayout
{
    _favCountLabel.text = [NSString stringWithFormat:@"共收藏:%@个",_responseModel.num];
    [_favTable reloadData];
    
    [_allCheckBtn addTarget:self action:@selector(allCheck) forControlEvents:UIControlEventTouchUpInside];
}

-(void)requestFailed
{
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _responseModel = (MyFavResponseModel *)model;
    [self reFillLayout];
    
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    MyFavTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[MyFavTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    [cell fillCellByModel:[_responseModel.goodsArr objectAtIndex:indexPath.row]];
   
    
    if (_selecFlag == 1) {
        [cell changeSelectStatus];
    }
    else
    {
        cell.selectStatus = 1;
        [cell changeSelectStatus];
    }
    
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_responseModel.goodsArr count]?[_responseModel.goodsArr count]:0;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MyFavTableViewCell *cell = (MyFavTableViewCell *)[tableView  cellForRowAtIndexPath:indexPath];
    [cell changeSelectStatus];
    
    if (cell.selectStatus) {
        
        //        ShoppingCartItemModel * tempModel = [[ShoppingCartItemModel alloc] initWithDic:[_responseModel.cartArr objectAtIndex:indexPath.row]];
        
        [_selectDic setObject:[_responseModel.goodsArr objectAtIndex:indexPath.row] forKey:[NSString stringWithFormat:@"%d",indexPath.row]];
    }
    else
    {
        [_selectDic removeObjectForKey:[NSString stringWithFormat:@"%d",indexPath.row]];
    }
}


-(void)allCheck
{
    if (_selecFlag == 0) {
        _selecFlag = 1;
        
        int i;
        
        [_selectDic removeAllObjects];
        for (i = 0; i < [_responseModel.goodsArr count]; i++) {
            [_selectDic setObject:[_responseModel.goodsArr objectAtIndex:i] forKey:[NSString stringWithFormat:@"%d",i]];
        }
    }
    else
    {
        _selecFlag = 0;
        [_selectDic removeAllObjects];
    }
    
    [_favTable reloadData];
}

@end
