//
//  CartRequestModel.h
//  lq
//
//  Created by  matao on 14-8-5.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "ShoppingCartListResponseModel.h"

@interface CartRequestModel : BaseRequestModel <ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *uid;

-(id)initWithUid:(NSString *)uid;
@end
