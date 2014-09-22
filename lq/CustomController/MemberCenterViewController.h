//
//  MemberCenterViewController.h
//  lq
//
//  Created by  matao on 14-7-8.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQ7ViewController.h"
#import "CoreHelper.h"
#import "UIImageView+WebCache.h"
#import "UserInfoRequestModel.h"
#import "MyCommentViewController.h"
#import "UserCouponViewController.h"
#import "MyFavViewController.h"
#import "AddressViewController.h"
#import "SignResponseModel.h"
#import "IntegralViewController.h"
#import "BalanceViewController.h"
#import "MyHistoryViewController.h"

#import "SettingViewController.h"

@interface MemberCenterViewController : LQ7ViewController<RequestModelDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic,strong) UIButton *settingBtn;

@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *telLabel;
@property (nonatomic,strong) UIImageView *sexImageView;
@property (nonatomic,strong) UIButton *punchBtn;

@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *priceLabel2;
@property (nonatomic,strong) UILabel *integrationLabel;
@property (nonatomic,strong) UILabel *integrationLabel2;
@property (nonatomic,strong) UILabel *daylyLabel;
@property (nonatomic,strong) UILabel *daylyLabel2;



@property (nonatomic,strong) UIButton *myOrderBtn;
@property (nonatomic,strong) UIButton *myFavorBtn;
@property (nonatomic,strong) UIButton *myCouponBtn;

@property (nonatomic,strong) UIButton *myCommentBtn;
@property (nonatomic,strong) UIButton *myAddrBtn;
@property (nonatomic,strong) UIButton *bussInfoBtn;

@property (nonatomic,strong) UIButton *logoutBtn;

@property (nonatomic,strong) UIActionSheet *photoSheet;

@property (nonatomic,strong) UserInfoRequestModel *requestModel;
@property (nonatomic,strong) UserInfoRequestModel *signRequestModel;
@property (nonatomic,strong) AnotherUserInfoResponseModel *responseModel;
@property (nonatomic,strong) SignResponseModel *signResponseModel;

@end
