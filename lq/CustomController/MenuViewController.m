//
//  MenuViewController.m
//  lq
//
//  Created by  matao on 14-7-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

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
    
    
    _menuRequest = [[MenuReuqestModel alloc] initWithSellId:@"100" uid:[CoreHelper getLoginUid]];
    
    _menuRequest.delegate = self;

    
    
    _classfy = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 75, 30)];
    _volume = [[UIButton alloc] initWithFrame:CGRectMake(85, 10, 75, 30)];
    _time = [[UIButton alloc] initWithFrame:CGRectMake(160, 10, 75, 30)];
    _price = [[UIButton alloc] initWithFrame:CGRectMake(235, 10, 75, 30)];
    
    
    _classfy.backgroundColor = DarkGreen;
    _volume.backgroundColor = DarkGreen;
    _time.backgroundColor = DarkGreen;
    _price.backgroundColor = DarkGreen;
    
    
    [_classfy setTitle:@"分类" forState:UIControlStateNormal];
    [_volume setTitle:@"销量" forState:UIControlStateNormal];
    [_time setTitle:@"时间" forState:UIControlStateNormal];
    [_price setTitle:@"价格" forState:UIControlStateNormal];
    
    _menuResponseModel = [[MenuResponseModel alloc] init];
    
    
    
    [_price addTarget:self action:@selector(interfacetest) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:_classfy];
    [self.view addSubview:_volume];
    [self.view addSubview:_time];
    [self.view addSubview:_price];
    
    
    NSLog(@"bounds height = %f",self.view.frame.size.height);
    
    _menuTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 320, self.view.frame.size.height-64 -40 - 50) style:UITableViewStylePlain];
    _menuTable.delegate = self;
    _menuTable.dataSource = self;
    
    _menuTable.backgroundColor = BackGray;
    
    _menuTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_menuTable];
    self.view.backgroundColor = BackGray;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        [_menuRequest postData];
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


#pragma mark - tableViewDelegate & tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d",[_menuResponseModel.goodsArr count]);
    return [_menuResponseModel.goodsArr count]?[_menuResponseModel.goodsArr count]:0;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     NSLog(@"%d ",indexPath.row);
    static NSString *cellIdetifier = @"cellMenu";
    MenuTableViewCell *cell  = [_menuTable dequeueReusableCellWithIdentifier:cellIdetifier];
    
    if (cell       == nil) {
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdetifier];
    }
    
    
    GoodsModel *model = [[GoodsModel alloc]init];
    
    model = [ _menuResponseModel.goodsArr objectAtIndex:indexPath.row];
    
    
    
    NSLog(@"%@ ",model.title);
    [cell fillCellByModel:[_menuResponseModel.goodsArr objectAtIndex:indexPath.row]];
    NSLog(@"fill finish %d ",indexPath.row);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GoodsModel *model = [[GoodsModel alloc]init];
    
    model = [ _menuResponseModel.goodsArr objectAtIndex:indexPath.row];
    
    GoodsViewController  *goodController = [[GoodsViewController alloc] initWithGid:model.gid Title:@"菜品详情"];
//    [self.navigationController pushViewController:goodController animated:YES];
    
//    LQUINavigationController *tempNavi = [[LQUINavigationController alloc] initWithRootViewController:goodController];
    
    [self presentViewController:goodController animated:YES completion:nil];
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    
    
    switch (model.ResponseTag) {
        case 200:
        {
            ProdutionResponseModel *productionResponsModel = (ProdutionResponseModel *)model;
            NSLog(@"%@",productionResponsModel);
        }
            break;
            
        default:
        {
            _menuResponseModel = (MenuResponseModel *)model;
            
            [_menuTable reloadData];
            NSLog(@"%@",_menuResponseModel);
        }
            break;
    }
}

-(void)requestFailed:(NSString *)errorStr
{
    
}

-(void)interfacetest
{
    _productionModel = [[ProductionRequestModel alloc] initWithSellId:@"100" Gid:@"1"];
    _productionModel.delegate = self;
    
    _productionModel.tag = 200;
    [_productionModel postData];
}

@end
