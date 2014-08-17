//
//  SignatureRequestModel.h
//  lq
//
//  Created by  matao on 14-8-9.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "ShoppingCartItemModel.h"
#import "SignatureResponseModel.h"

@interface SignatureRequestModel : BaseRequestModel<ASIHTTPRequestDelegate>

@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *gids;
@property (nonatomic,strong) NSString *nums;
@property (nonatomic,strong) NSArray *argsArr;

-(id)initWithSeller:(NSString *)sellerId uid:(NSString *)uid args:(NSArray *)args;
@end
