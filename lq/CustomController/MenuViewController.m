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
    
    _classfy = [[UIButton alloc] initWithFrame:CGRectMake(20, 30, 70, 20)];
    _volume = [[UIButton alloc] initWithFrame:CGRectMake(90, 30, 70, 20)];
    _time = [[UIButton alloc] initWithFrame:CGRectMake(160, 30, 70, 20)];
    _price = [[UIButton alloc] initWithFrame:CGRectMake(230, 30, 70, 20)];
    
    
    _classfy.backgroundColor = [UIColor greenColor];
    _volume.backgroundColor = [UIColor greenColor];
    _time.backgroundColor = [UIColor greenColor];
    _price.backgroundColor = [UIColor greenColor];
    
    
    [_classfy setTitle:@"分类" forState:UIControlStateNormal];
    [_volume setTitle:@"销量" forState:UIControlStateNormal];
    [_time setTitle:@"时间" forState:UIControlStateNormal];
    [_price setTitle:@"价格" forState:UIControlStateNormal];
    
    
    [self.view addSubview:_classfy];
    [self.view addSubview:_volume];
    [self.view addSubview:_time];
    [self.view addSubview:_price];
    
    
    NSLog(@"bounds height = %f",self.view.frame.size.height);
    
    _menuTable = [[UITableView alloc] initWithFrame:CGRectMake(20, 60, 280, self.view.frame.size.height-20 - 40 - 44 - 60 - 20) style:UITableViewStylePlain];
    
    _menuTable.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:_menuTable];
    
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
    return 10;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
