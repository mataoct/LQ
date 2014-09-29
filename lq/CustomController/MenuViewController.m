//
//  MenuViewController.m
//  lq
//
//  Created by  matao on 14-7-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@property (nonatomic,strong) NSMutableArray *categoryArr;
@property (nonatomic,assign) NSInteger start;

@property (nonatomic,strong) NSMutableArray *sourceArr;




@property (nonatomic,assign) Boolean volumeFlag;
@property (nonatomic,assign) Boolean timeFlag;
@property (nonatomic,assign) Boolean priceFlag;

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
    
    
    _menuRequest = [[MenuReuqestModel alloc] initWithSellId:CustomID uid:[CoreHelper getLoginUid]];
    
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
    _categoryArr = [[NSMutableArray alloc] init];
    _sourceArr = [[NSMutableArray alloc] init];
    
    [_classfy addTarget:self action:@selector(classfyBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_price addTarget:self action:@selector(interfacetest) forControlEvents:UIControlEventTouchUpInside];
    [_volume addTarget:self action:@selector(volumeClick:) forControlEvents:UIControlEventTouchUpInside];
    [_time addTarget:self action:@selector(timeClick:) forControlEvents:UIControlEventTouchUpInside];
    _volumeFlag = true;
    _priceFlag = true;
    _timeFlag = true;
    
    [self.view addSubview:_classfy];
    [self.view addSubview:_volume];
    [self.view addSubview:_time];
    [self.view addSubview:_price];
    
    
    NSLog(@"bounds height = %f",self.view.frame.size.height);
    
    _menuTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 40, 320, self.view.frame.size.height-64 -40 - 50) style:UITableViewStylePlain];
    _menuTable.delegate = self;
    _menuTable.dataSource = self;
    [self addHeader];
    
    _menuTable.backgroundColor = BackGray;
    
    _menuTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:_menuTable];
    self.view.backgroundColor = BackGray;
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    _start = 0;
    _menuRequest.start = [NSString stringWithFormat:@"%d",_start] ;
    _menuRequest.limit = @"10";
    
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
//    NSLog(@"%d",[_menuResponseModel.goodsArr count]);
    return [_sourceArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     NSLog(@"%d ",indexPath.row);
    static NSString *cellIdetifier = @"cellMenu";
    MenuTableViewCell *cell  = [_menuTable dequeueReusableCellWithIdentifier:cellIdetifier];
    
    if (cell       == nil) {
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdetifier];
    }
    
    [cell fillCellByModel:[_sourceArr objectAtIndex:indexPath.row]];
    cell.delegate = self;
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
    
    model = [_sourceArr objectAtIndex:indexPath.row];
    
    GoodsViewController  *goodController = [[GoodsViewController alloc] initWithGid:model.gid Title:@"菜品详情"];
    
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
            
            [_categoryArr removeAllObjects];
            
            [_categoryArr addObject:@"全部"];
            
            for (CategoriesModel *cate in _menuResponseModel.categoriesArr) {
                [_categoryArr addObject:cate.title];
            }
            
            
            
            
            if (_start == 0) {
                [_sourceArr removeAllObjects];
            }
            
            
            if ([_menuResponseModel.goodsArr count] > 0) {
                for (id model in _menuResponseModel.goodsArr) {
                    
                    [_sourceArr addObject:model];
                }
                _start++;
                
            }
            [_menuTable reloadData];
            [_menuTable headerEndRefreshing];
            
            
            NSLog(@"%@",_menuResponseModel);
        }
            break;
    }
}

-(void)requestFailed:(NSString *)errorStr
{
    
    [_menuTable headerEndRefreshing];
}



-(void)shareBtnClicked:(GoodsModel *)goodModel
{
    NSLog(@"share");
    
    
    [CoreHelper UMShare:self shareText:goodModel.title shareImage:nil delegate:nil];
}



-(void)classfyBtnClick:(id)sender
{
    if(_dropDown == nil)
    {
        CGFloat f = ([_categoryArr count] > 5 ? 5 : [_categoryArr count]) * 40.0;
        _dropDown = [[NIDropDown alloc]showDropDown:sender :&f :_categoryArr];
        _dropDown.delegate = self;
    }
    else
    {
        [_dropDown hideDropDown:sender];
        _dropDown = nil;
    }
}

- (void) niDropDownDelegateMethod: (NIDropDown *) sender indexPath:(NSIndexPath *)indexPath {
    
    
    NSLog(@"%d,",indexPath.row);
    _dropDown = nil;
    
    
    CategoriesModel *temp = [[CategoriesModel alloc] init];
    
    
    switch (indexPath.row) {
        case 0:
            //
        {
            _menuRequest.cid = 0;
        }
            break;
        default:
        {
            temp = [_menuResponseModel.categoriesArr objectAtIndex:indexPath.row];
            
            _menuRequest.cid = temp.cid;
        }
            break;
    }
    
    _start = 0;
    _menuRequest.start = [NSString stringWithFormat:@"%d",_start];
    
    [_menuRequest postData];
    
}


- (void)addHeader
{
    __unsafe_unretained typeof(self) wself = self;
    // 添加下拉刷新头部控件
    [_menuTable addHeaderWithCallback:^{
        // 进入刷新状态就会回调这个Block
        
        wself.menuRequest.start = [NSString stringWithFormat:@"%d",wself.start];
        [wself.menuRequest postData];
    }];
}

-(void)volumeClick:(id)sender
{
    NSArray *temp  = [_sourceArr sortedArrayUsingComparator:^NSComparisonResult(GoodsModel *obj1,GoodsModel *obj2)
                      {
                          NSInteger num1 = [obj1.sales integerValue];
                          NSInteger num2 = [obj2.sales integerValue];
                          
                          NSLog(@"num1 %d,num2 %d",num1,num2);
                          
                          return _volumeFlag ? (num1 > num2 ? NSOrderedAscending : NSOrderedDescending) : (num1 > num2 ? NSOrderedDescending : NSOrderedAscending);

                      }];
    
    
    
    _volumeFlag = !_volumeFlag;
    
    
    [_sourceArr removeAllObjects];
    for (id model in temp) {
        [_sourceArr addObject:model];
    }
    
    
    NSLog(@"temp = %@",_sourceArr);
    [_menuTable reloadData];
}

-(void)timeClick:(id)sender
{
    NSArray *temp  = [_sourceArr sortedArrayUsingComparator:^NSComparisonResult(GoodsModel *obj1,GoodsModel *obj2)
                      {
                          NSInteger num1 = [obj1.gid integerValue];
                          NSInteger num2 = [obj2.gid integerValue];
                          
                          return _timeFlag ? (num1 > num2 ? NSOrderedAscending : NSOrderedDescending) : (num1 > num2 ? NSOrderedDescending : NSOrderedAscending);                      }];
    
    
    _timeFlag = !_timeFlag;
    
    [_sourceArr removeAllObjects];
    for (id model in temp) {
        [_sourceArr addObject:model];
    }
    
    
    NSLog(@"temp = %@",_sourceArr);
    [_menuTable reloadData];
}

-(void)interfacetest
{
    
    NSArray *temp  = [_sourceArr sortedArrayUsingComparator:^NSComparisonResult(GoodsModel *obj1,GoodsModel *obj2)
                      {
                          NSInteger num1 = [obj1.nowprice integerValue];
                          NSInteger num2 = [obj2.nowprice integerValue];
                          
                          return _priceFlag ? (num1 > num2 ? NSOrderedAscending : NSOrderedDescending) : (num1 > num2 ? NSOrderedDescending : NSOrderedAscending);
                          
                      }];
    
    _priceFlag = !_priceFlag;
    
    
    [_sourceArr removeAllObjects];
    for (id model in temp) {
        [_sourceArr addObject:model];
    }
    NSLog(@"temp = %@",_sourceArr);
    [_menuTable reloadData];
}

@end
