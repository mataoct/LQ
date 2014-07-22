//
//  MainPageBaseRequestModel.h
//  lq
//
//  Created by  matao on 14-6-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "CoreHelper.h"

@interface MainPageBaseRequestModel : BaseRequestModel<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *sellId;


-(id)initWithSellId:(NSString *)sellerId;

@end
