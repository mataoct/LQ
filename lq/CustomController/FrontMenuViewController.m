//
//  FrontMenuViewController.m
//  lq
//
//  Created by  matao on 14-10-1.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "FrontMenuViewController.h"

@interface FrontMenuViewController ()

@end

@implementation FrontMenuViewController

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
    
    _menuRequestModel = [[MenuReuqestModel alloc] initWithSellId:CustomID uid:[CoreHelper getLoginUid]];
    
    _menuRequestModel.delegate = self;
    _menuRequestModel.tag = 10001;
    
    _categoryArr = [[NSMutableArray alloc] init];
    
    _cateTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 10, 300, self.view.frame.size.height - 64 - 49) style:UITableViewStylePlain];
    _cateTable.delegate = self;
    _cateTable.dataSource = self;
    _cateTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_cateTable];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_menuRequestModel postData];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [_menuRequestModel.request cancel];
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

-(void)requestSuccess:(BaseResponseModel *)model
{
    _menuResponseModel = (MenuResponseModel *)model;
            
//    [_categoryArr removeAllObjects];
//    
//    for (CategoriesModel *cate in _menuResponseModel.categoriesArr)
//    {
//        [_categoryArr addObject:cate];
//    }

    [_cateTable reloadData];
            
            NSLog(@"%@",_menuResponseModel);
}

-(void)requestFailed:(NSString *)errorStr
{
    
}


#pragma mark - tableViewDelegate & tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //    NSLog(@"%d",[_menuResponseModel.goodsArr count]);
    return [_menuResponseModel.categoriesArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%d ",indexPath.row);
    static NSString *cellIdetifier = @"cellMenu";
    FrontMenuTableViewCell *cell  = [_cateTable dequeueReusableCellWithIdentifier:cellIdetifier];
    
    if (cell       == nil) {
        cell = [[FrontMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdetifier];
    }
    
    [cell fillByModel:[_menuResponseModel.categoriesArr objectAtIndex:indexPath.row] index:indexPath.row];
//    cell.delegate = self;
    NSLog(@"fill finish %d ",indexPath.row);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    GoodsModel *model = [[GoodsModel alloc]init];
//    
//    model = [_sourceArr objectAtIndex:indexPath.row];
//    
//    GoodsViewController  *goodController = [[GoodsViewController alloc] initWithGid:model.gid Title:@"菜品详情"];
//    
//    [self presentViewController:goodController animated:YES completion:nil];
    
    _menuVC = [[MenuForEnterpriceController alloc] init];
    _menuVC.title = @"菜单列表";
    
    
    [self.navigationController pushViewController:_menuVC animated:YES];
}

@end
