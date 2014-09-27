//
//  ProductionRequestModel.h
//  lq
//
//  Created by 马涛 on 14-7-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "ProdutionResponseModel.h"
//#import "CoreHelper.h"

@interface ProductionRequestModel :  BaseRequestModel<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *sellId;
@property (nonatomic,strong) NSString *gid;
@property (nonatomic,strong) NSString *uid;


-(id)initWithSellId:(NSString *)sellerId Gid:(NSString *)gid;
@end
