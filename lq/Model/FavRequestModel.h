//
//  FavRequestModel.h
//  lq
//
//  Created by  matao on 14-8-28.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "BaseRequestModel.h"

@interface FavRequestModel : BaseRequestModel

@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *gid;
@property (nonatomic,strong) NSString *isfav;

-(id)initWithUid:(NSString *)uid gid:(NSString *)gid;
-(void)postData:(NSString *)isfav;
@end
