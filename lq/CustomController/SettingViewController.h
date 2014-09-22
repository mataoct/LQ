//
//  SettingViewController.h
//  lq
//
//  Created by  matao on 14-9-22.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "CusSettingBtn.h"

@interface SettingViewController : LQUIViewController

@property (nonatomic,strong) UIView *notiView;
@property (nonatomic,strong) UILabel *notiLabel;
@property (nonatomic,strong) UISwitch *notiSwitch;

@property (nonatomic,strong) CusSettingBtn *infoModify;
@property (nonatomic,strong) CusSettingBtn *clearPic;
@property (nonatomic,strong) CusSettingBtn *clearData;

@property (nonatomic,strong) CusSettingBtn *update;

@property (nonatomic,strong) CusSettingBtn *devinfo;
@property (nonatomic,strong) CusSettingBtn *seviceInfo;
@property (nonatomic,strong) CusSettingBtn *eual;

@end
