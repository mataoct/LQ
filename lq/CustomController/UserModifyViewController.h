//
//  UserModifyViewController.h
//  lq
//
//  Created by  matao on 14-9-22.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "UserInfoModel.h"
#import "UIImageView+WebCache.h"

@interface UserModifyViewController : LQUIViewController<UIActionSheetDelegate>

@property (nonatomic,strong) UserInfoModel *user;

@property (nonatomic,strong) UIImageView *headImg;
@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UIView *headView;

@property (nonatomic,strong) UIActionSheet *photoSheet;


@end
