//
//  AddressViewController.h
//  lq
//
//  Created by  matao on 14-8-21.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "LQUIViewController.h"
#import "UserInfoRequestModel.h"
@interface AddressViewController : LQUIViewController<RequestModelDelegate>

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UITextField *nameTf;
@property (nonatomic,strong) UILabel *telLabel;
@property (nonatomic,strong) UITextField *telTf;
@property (nonatomic,strong) UILabel *addrLabel;
@property (nonatomic,strong) UITextView *addrTf;

@property (nonatomic,strong) NSString *uid;

@property (nonatomic,strong) UserInfoRequestModel *requestModel;
@property (nonatomic,strong) UserInfoRequestModel *saveRequestModel;
@property (nonatomic,strong) AddressResponseModel *responseModel;

-(id)initWithTitle:(NSString *)str uid:(NSString *)uid;

@end
