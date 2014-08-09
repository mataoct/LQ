//
//  MenuReuqestModel.h
//  lq
//
//  Created by 马涛 on 14-7-25.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "CoreHelper.h"
#import "MenuResponseModel.h"

@interface MenuReuqestModel : BaseRequestModel<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *sellId;


-(id)initWithSellId:(NSString *)sellerId;

@end
