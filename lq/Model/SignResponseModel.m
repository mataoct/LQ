//
//  SignResponseModel.m
//  lq
//
//  Created by 马涛 on 14-8-27.
//  Copyright (c) 2014年 马 涛. All rights reserved.
//

#import "SignResponseModel.h"

@implementation SignResponseModel

-(id)initWithDic:(NSDictionary *)dic
{
    self = [super initWithDic:dic];
    if (self) {
        //
        _integral = [[[dic objectForKey:@"data"] objectForKey:@"integral"] integerValue];
    }
    return self;
}
@end
