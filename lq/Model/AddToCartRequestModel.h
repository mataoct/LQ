//
//  AddToCartRequestModel.h
//  lq
//
//  Created by  matao on 14-8-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"

@interface AddToCartRequestModel : BaseRequestModel


@property (nonatomic,strong) NSString *gid;
@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *num;


-(id)initWithGid:(NSString *)gid uid:(NSString *)uid;

-(void)postData:(NSString *)num;

@end
