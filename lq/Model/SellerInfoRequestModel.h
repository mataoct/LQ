//
//  SellerInfoRequestModel.h
//  lq
//
//  Created by  matao on 14-8-14.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "SellerInfoResponseModel.h"

@interface SellerInfoRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *sellerid;

-(id)initWithSeller:(NSString *)sellerid;

@end
