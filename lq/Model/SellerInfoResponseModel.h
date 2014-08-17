//
//  SellerInfoResponseModel.h
//  lq
//
//  Created by  matao on 14-8-14.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseResponseModel.h"

@interface SellerInfoResponseModel : BaseResponseModel

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *myDescription;
@property (nonatomic,strong) NSString *mapUrl;
@property (nonatomic,assign) float pointx;
@property (nonatomic,assign) float pointy;


-(id)initWithDic:(NSDictionary *)dic;

@end
