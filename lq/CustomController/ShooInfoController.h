//
//  ShooInfoController.h
//  lq
//
//  Created by  matao on 14-7-15.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQ7ViewController.h"
#import "SellerInfoRequestModel.h"
#import "CoreHelper.h"
#import "HKBaiduMapViewController.h"

@interface ShooInfoController : LQ7ViewController<RequestModelDelegate>

@property (nonatomic,strong) UIView *infoView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *telLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UIButton *telBtn;
@property (nonatomic,strong) UIButton *addressBtn;

@property (nonatomic,strong) UIView *introduceView;
@property (nonatomic,strong) UILabel *headLabel;
@property (nonatomic,strong) UITextView *introduceField;


@property (nonatomic,strong) SellerInfoRequestModel *requestModel;
@property (nonatomic,strong) SellerInfoResponseModel *responseModel;

-(id)init;

@end
