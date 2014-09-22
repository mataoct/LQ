//
//  SettingViewController.m
//  lq
//
//  Created by  matao on 14-9-22.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

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
    
    
    
    _notiView = [[UIView alloc] initWithFrame:CGRectMake(10, 74, 300, 44)];
    _notiLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 100, 30)];
    _notiSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(244, 7, 46, 30)];
    _notiView.layer.cornerRadius = 2.0;
    _notiView.backgroundColor = [UIColor whiteColor];
    _notiLabel.text = @"接收通知";
    _notiLabel.font = [UIFont systemFontOfSize:16];
    [_notiView addSubview:_notiLabel];
    [_notiView addSubview:_notiSwitch];

    
    
    _infoModify = [[CusSettingBtn alloc] initWithFrame:CGRectMake(0, 128, 320, 43)];
    _infoModify.textLabel.text = @"资料修改";
//    
//    @property (nonatomic,strong) CusSettingBtn *clearPic;
//    @property (nonatomic,strong) CusSettingBtn *clearData;
//    
//    @property (nonatomic,strong) CusSettingBtn *update;
//    
//    @property (nonatomic,strong) CusSettingBtn *devinfo;
//    @property (nonatomic,strong) CusSettingBtn *seviceInfo;
//    @property (nonatomic,strong) CusSettingBtn *eual;
    
    _clearPic = [[CusSettingBtn alloc] initWithFrame:CGRectMake(0, 172, 320, 44)];
    _clearPic.textLabel.text = @"清除图片缓存";
    _clearData = [[CusSettingBtn alloc] initWithFrame:CGRectMake(0, 216, 320, 44)];
    _clearData.textLabel.text = @"清除历史数据";
    
    _update = [[CusSettingBtn alloc] initWithFrame:CGRectMake(0, 270, 320, 44)];
    _update.textLabel.text = @"版本更新";
    _update.textLabel2.text = @"当前版本0.0.9";
    
    _devinfo = [[CusSettingBtn alloc] initWithFrame:CGRectMake(0, 324, 320, 44)];
    _devinfo.textLabel.text = @"开发方协议";
    _seviceInfo = [[CusSettingBtn alloc] initWithFrame:CGRectMake(0, 368, 320, 44)];
    _seviceInfo.textLabel.text = @"服务协议";
    _eual = [[CusSettingBtn alloc] initWithFrame:CGRectMake(0, 412, 320, 44)];
    _eual.textLabel.text = @"特别说明";
    
    [self.view addSubview:_notiView];
    [self.view addSubview:_infoModify];
    [self.view addSubview:_clearPic];
    [self.view addSubview:_clearData];
    [self.view addSubview:_update];
    [self.view addSubview:_devinfo];
    [self.view addSubview:_seviceInfo];
    [self.view addSubview:_eual];
    
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

@end
