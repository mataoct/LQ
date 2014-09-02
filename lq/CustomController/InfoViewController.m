//
//  InfoViewController.m
//  lq
//
//  Created by  matao on 14-8-6.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "InfoViewController.h"

@interface InfoViewController ()

@end

@implementation InfoViewController

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
    
//    [self.view setBackgroundColor:BackGray];
    _model = [[InfoRequestModel alloc] initWithSeller:@"100" Start:@"0" Limit:@"10"];
    _infoTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height - 64 - 49 ) style:UITableViewStylePlain];
    _infoTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _infoTable.backgroundColor = BackGray;
    _infoTable.showsVerticalScrollIndicator = false;
    _responseModel = [[InfoResponseModel alloc] init];
    
    
    [self.view addSubview:_infoTable];
    
    _infoTable.delegate = self;
    _infoTable.dataSource = self;
    _model.delegate = self;
    [_model postData];
    
    
    // Do any additional setup after loading the view.
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    InfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[InfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    [cell fillCellByModel:[_responseModel.infoArr objectAtIndex:indexPath.row] ];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_responseModel.infoArr count]?[_responseModel.infoArr count]:0;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    InfoDetailViewController *detailVC = [[InfoDetailViewController alloc] initWithModel:[_responseModel.infoArr objectAtIndex:indexPath.row]];
    
    [detailVC showBackButton];
    [self.navigationController pushViewController:detailVC animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)requestFailed:(NSString *)errorStr
{
}

-(void)requestSuccess:(BaseResponseModel *)model
{
    _responseModel = (InfoResponseModel *)model;
    [_infoTable reloadData];
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

@end
