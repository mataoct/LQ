//
//  MyCommentRequestModel.h
//  lq
//
//  Created by  matao on 14-8-16.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"
#import "MyCommentResponseModel.h"
@interface MyCommentRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *sellerId;
@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *start;
@property (nonatomic,strong) NSString *limit;
@property (nonatomic,strong) NSString *type;

-(id)initWithSeller:(NSString *)sellerId uid:(NSString *)uid start:(NSString *)start limit:(NSString *)limit type:(NSString *)type;

@end
