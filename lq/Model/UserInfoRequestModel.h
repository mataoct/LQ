//
//  UserInfoRequestModel.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "AnotherUserInfoResponseModel.h"
#import "AddressResponseModel.h"

@interface UserInfoRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *sellerid;
@property (nonatomic,strong) NSString *uid;


//-----------
//@property (nonatomic,strong) NSString *linkMan;
//@property (nonatomic,strong) NSString *phone;
//@property (nonatomic,strong) NSString *address;

-(id)initWithSellId:(NSString *)sellerId uid:(NSString *)uid;


-(void)getAddress;
-(void)sendAddressLinkMan:(NSString *)linkMan phone:(NSString *)phone address:(NSString *)address;
@end
